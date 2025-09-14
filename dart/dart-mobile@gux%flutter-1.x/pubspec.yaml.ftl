name: ${app.name}
description: "${app.name}"

publish_to: 'none'

version: 1.0.0+1

environment:
  sdk: '>=3.4.1 <4.0.0'

dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter  
  intl: ^0.19.0
  http: ^1.2.2
  permission_handler: ^11.3.1
  sqflite: ^2.3.0 
  sqflite_common_ffi: ^2.3.4+4
  image: ^4.3.0
  provider: ^6.1.2
  cupertino_icons: ^1.0.6
  image_picker: ^1.1.2
  image_cropper: 8.0.0
  photo_view: ^0.14.0
  flutter_picker: ^2.1.0
  flutter_advanced_switch: ^3.1.0
  flutter_ruler_picker: ^1.0.6
  flutter_slidable: ^4.0.0
  table_calendar: ^3.1.2
  carousel_slider: ^5.0.0
  webview_flutter: ^4.0.0
  fl_chart: ^0.69.0
  custom_refresh_indicator: ^4.0.1
  skeletonizer: ^1.4.2
  flutter_easyloading: ^3.0.5
  
#  gux:
#    path: mod/gux

dev_dependencies:
  flutter_test:
    sdk: flutter

  flutter_lints: ^3.0.0
  flutter_launcher_icons: ^0.14.1
  
flutter_launcher_icons:
  android: "launcher_icon"
  ios: true
  image_path: "asset/image/logo.png"
  min_sdk_android: 21  

flutter:

  uses-material-design: true

  assets:
    - asset/sql/
    - asset/image/common/
    - asset/image/icon/
    - asset/image/theme/
    - asset/text/

