
import 'package:flutter/cupertino.dart';

import 'styles.dart';

class EmptyState extends StatelessWidget {

  final String message;

  EmptyState({
    this.message = '暂无任何数据',
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset('asset/image/common/empty_state.png',
            width: 156,
            height: 156,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10,),
          Text(message,
            style: TextStyle(fontSize: 13, color: colorTextSecondary,),
          ),
        ],
      ),
    );
  }
}

class ErrorState extends StatelessWidget {

  final String message;

  ErrorState({
    this.message = '出错啦',
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset('asset/image/common/error_state.png',
            width: 156,
            height: 156,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10,),
          Text(message,
            style: TextStyle(fontSize: 13, color: colorTextSecondary,),
          ),
        ],
      ),
    );
  }
}