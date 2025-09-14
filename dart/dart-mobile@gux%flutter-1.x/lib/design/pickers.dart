import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_view/photo_view.dart';

import 'action_sheet.dart';
import 'bottom_picker.dart';
import 'buttons.dart';
import 'datetime_picker.dart';
import 'ruler_picker.dart';
import '/sdk/options.dart';
import '/design/styles.dart' as styles;

void pickDate(BuildContext context, {
  DateTime? initial,
  Function(DateTime? value)? onSelected,
}) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(  // Rounded corners
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return DateTimePicker(
        mode: DateTimePickerMode.date,
        value: initial??null,
        onSelected: (value) {
          if (onSelected != null) {
            onSelected(value);
          }
        },
      );
    },
  );
}

void pickTime(BuildContext context, {
  DateTime? initial,
  Function(DateTime? value)? onSelected,
}) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(  // Rounded corners
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return DateTimePicker(
        mode: DateTimePickerMode.time,
        value: initial??null,
        onSelected: (value) {
          if (onSelected != null) {
            onSelected(value);
          }
        },
      );
    },
  );
}

void pickOption(BuildContext context, {
  String? initial,
  List<Option> options = const <Option>[],
  Function(Option? value)? onSelected,
}) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(  // Rounded corners
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) => BottomPicker(
      options: options.map<BottomPickerOption>((opt) => BottomPickerOption(
        value: opt.value,
        label: opt.text,
      )).toList(),
      value: initial,
      onSelected: (option) {
        if (option == BottomPickerOption.NONE) {
          if (onSelected != null) {
            onSelected(null);
          }
        } else {
          if (onSelected != null) {
            onSelected(Option(
              text: option.label!,
              value: option.value,
            ));
          }
        }
      },
    ),
  );
}

void pickRuler(BuildContext context, {
  double? initial,
  int? max,
  int? min,
  Function(num? value)? onSelected,
}) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(  // Rounded corners
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      return GXRulerPicker(
        max: max??100,
        min: min??0,
        value: initial??0,
        onValueChanged: (value) {
          if (value == double.infinity) {
            if (onSelected != null) {
              onSelected(null);
            }
          } else {
            if (onSelected != null) {
              onSelected(value);
            }
          }
        },
      );
    },
  );
}

void pickItem(BuildContext context, {
  List<Option> options = const <Option>[],
  String? initial,
  double height = 300,
  Function(String)? didPick,
}) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      return StatefulBuilder(builder: (context, setState) {
        return Container(
          height: height,
          child: Column(
            children: [
              Container(
                height: 48,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 10,),
                        CloseIconButton(),
                        SizedBox(width: 20,),
                        ClearIconButton(
                          didTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    Spacer(),
                    ConfirmIconButton(
                      didTap: () {
                        if (didPick != null && initial != null) {
                          didPick(initial!);
                        }
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(width: 10,),
                  ],
                ),
              ),
              Container(height: 1, color: styles.colorDivider,),
              Column(
                children: options.map((opt) {
                  return Container(
                    width: double.infinity,
                    // padding: EdgeInsets.only(left: styles.padding, right: styles.padding,),
                    child: Column(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.only(
                            left: styles.padding,
                            right: styles.padding,
                            top: 0,
                            bottom: 0,
                          ),
                          title: Text(opt.text),
                          trailing: (initial == opt.value) ? Icon(Icons.check,) : null,
                          onTap: () {
                            setState(() {
                              initial = opt.value;
                            });
                          },
                        ),
                        Container(
                          height: 1,
                          color: styles.colorDivider,
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
              Container(height: 64),
            ],
          ),
        );
      });
    },
  );
}

final ImagePicker picker = ImagePicker();

final ImageCropperHelper _imageCropperHelper = ImageCropperHelper();

void pickImage(BuildContext context, {
  bool croppable = false,
  Function(File file)? didPick,
  double ratioX = 128,
  double ratioY = 128,
}) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(  // Rounded corners
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      return ActionSheet(
        actions: [
          ActionData(text: '相机', callback: () async {
            if (!Platform.isIOS) {
              if (!await Permission.camera.request().isGranted) {
                return;
              }
            }
            try {
              final XFile? image = await picker.pickImage(source: ImageSource.camera);
              if (image != null && image.path.isNotEmpty) {
                // 调用封装的方法
                XFile? croppedFile = await _imageCropperHelper.cropImage(image,
                    aspectRatio: CropAspectRatio(ratioX: ratioX, ratioY: ratioY));
                if (croppedFile != null) {
                  // 检查文件是否存在
                  final File file = File(croppedFile.path);
                  if (await file.exists()) {
                    Uint8List bytes = await file.readAsBytes();
                    // Size size = await Utils.getImageSizeFromBytes(bytes);
                    // if (size.width >= 3000) {
                    //   bytes = await Utils.createThumbnail(bytes, (size.width / 5).toInt(), (size.height / 5).toInt());
                    // } else if (size.width >= 1000) {
                    //   bytes = await Utils.createThumbnail(bytes, (size.width / 2).toInt(), (size.height / 2).toInt());
                    // }
                    await file.writeAsBytes(bytes, flush: true);
                    if (didPick != null) {
                      didPick(file);
                    }
                  } else {
                    // TODO
                    print("图片文件不存在或路径无效");
                  }
                }
              }
            } catch (e) {
              print('Error picking image: $e');
            }
          }),
          ActionData(text: '图片', callback: () async {
            if (!await Permission.storage.request().isGranted) {
              return;
            }
            try {
              final XFile? image = await picker.pickImage(source: ImageSource.gallery);
              if (image != null && image.path.isNotEmpty) {
                // 调用封装的方法
                XFile? croppedFile = await _imageCropperHelper.cropImage(image,
                    aspectRatio: CropAspectRatio(ratioX: ratioX, ratioY: ratioY));
                if (croppedFile != null) {
                  // 检查文件是否存在
                  final File file = File(croppedFile.path);
                  if (await file.exists()) {
                    Uint8List bytes = await file.readAsBytes();
                    // Size size = await Utils.getImageSizeFromBytes(bytes);
                    // if (size.width >= 3000) {
                    //   bytes = await Utils.createThumbnail(bytes, (size.width / 5).toInt(), (size.height / 5).toInt());
                    // } else if (size.width >= 1000) {
                    //   bytes = await Utils.createThumbnail(bytes, (size.width / 2).toInt(), (size.height / 2).toInt());
                    // }
                    await file.writeAsBytes(bytes, flush: true);
                    if (didPick != null) {
                      didPick(file);
                    }
                  } else {
                    // TODO
                    print("图片文件不存在或路径无效");
                  }
                }
              }
            } catch (e) {
              // Handle errors
              print('Error picking image: $e');
            }
          }),
        ],
      );
    },
  );
}

void viewNetworkImage(BuildContext context, String url) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: PhotoView(
          backgroundDecoration: BoxDecoration(
            color: Colors.white10,
          ),
          imageProvider: NetworkImage(url),
        ),
      );
    },
  );
}

void viewFileImage(BuildContext context, String url) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: PhotoView(
          backgroundDecoration: BoxDecoration(
            color: Colors.white10,
          ),
          imageProvider: FileImage(File(url)),
        ),
      );
    },
  );
}

class ImageCropperHelper {
  Future<XFile?> cropImage(
      XFile pickedFile, {
        CropAspectRatio? aspectRatio,
        CropStyle? cropStyle,
      }) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: pickedFile.path,
      aspectRatio: aspectRatio ?? const CropAspectRatio(ratioX: 1, ratioY: 1),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: '',
          toolbarColor: const Color(0xff171717),
          toolbarWidgetColor: Colors.white,
          hideBottomControls: true,
          cropStyle: cropStyle ?? CropStyle.rectangle,
          showCropGrid: cropStyle == CropStyle.circle ? false : true,
          cropFrameColor:
          cropStyle == CropStyle.circle ? Colors.transparent : Colors.white,
        ),
        IOSUiSettings(
          title: '',
          rotateButtonsHidden: true,
          aspectRatioLockEnabled: true,
          doneButtonTitle: '完成',
          cancelButtonTitle: '取消',
          cropStyle: cropStyle ?? CropStyle.rectangle,
        ),
      ],
    );

    if (croppedFile != null) {
      // 返回裁剪后的文件
      return XFile(croppedFile.path);
    }
    // 如果用户取消裁剪或其他情况，返回null
    return null;
  }
}

class CropAspectRatioPresetCustom implements CropAspectRatioPresetData {
  @override
  (int, int)? get data => (1, 1);

  @override
  String get name => '1x1 (customized)';
}