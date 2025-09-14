
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path/path.dart';

import '/design/pickers.dart';

class Cover extends StatelessWidget {
  final double width;
  final double height;
  final String? url;
  bool local = false;
  bool viewable = false;

  Cover({
    this.width = 100,
    this.height = 100,
    this.url,
    this.local = false,
    this.viewable = true,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: local ?  _buildFileImage(context, url) : _buildNetworkImage(context, url),
    );
  }

  Widget _buildFileImage(BuildContext context, String? url) {
    return GestureDetector(
      onTap: !viewable ? null : () {
        if (url == null || url == '') return;
        viewFileImage(context, url);
      },
      child: Image.file(File(url??''),
        width: width,
        height: height,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius:
              BorderRadius.circular(8),
            ),
            width: width,
            height: height,
            child: Center(
              child: Image.asset('assets/image/common/image.png',
                width: width,
                height: height,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildNetworkImage(BuildContext context, String? url) {
    return GestureDetector(
      onTap: !viewable ? null : () {
        if (url == null || url == '' || !viewable) return;
        viewNetworkImage(context, url);
      },
      child: Image.network(url??'',
        width: width,
        height: height,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius:
              BorderRadius.circular(8),
            ),
            width: width,
            height: height,
            child: Center(
              child: Image.asset('assets/icons/empty_traching.png',
                width: width,
                height: height,
              ),
            ),
          );
        },
      ),
    );
  }
}