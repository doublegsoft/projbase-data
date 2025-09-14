
import 'package:flutter/material.dart';

class Cover extends StatelessWidget {

  final String url;

  double? width;

  double? height;

  Cover({
    super.key,
    this.url = '',
    this.width,
    this.height = 150,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(url,
      width: width,
      height: height,
      fit: BoxFit.cover,
      errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
        return Image.asset('asset/image/common/image.png',
          width: width,
          height: height,
          fit: BoxFit.cover,
        );
      },
    );
  }

}