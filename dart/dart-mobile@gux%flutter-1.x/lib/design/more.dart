
import 'package:flutter/material.dart';

import '/design/styles.dart' as styles;

class More extends StatelessWidget {

  final String label;

  VoidCallback? doTap;

  More({
    required this.label,
    this.doTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(label,
        style: TextStyle(
          fontSize: 12,
          color: styles.colorTextSecondary,
        ),
      ),
      onTap: doTap == null ? null : doTap,
    );
  }
}