
import 'package:flutter/material.dart';

import '/design/styles.dart' as styles;

class Description extends StatelessWidget {

  final String content;

  final int lines;

  Description({
    required this.content,
    this.lines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Text(content,
      style: TextStyle(
        fontSize: 13,
        color: styles.colorTextSecondary,
      ),
      maxLines: lines,
      overflow: TextOverflow.ellipsis,
    );
  }

}