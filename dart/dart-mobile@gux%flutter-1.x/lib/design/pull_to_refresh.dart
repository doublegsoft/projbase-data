/*
** ──────────────────────────────────────────────────
** ─██████████████─██████──██████─████████──████████─
** ─██░░░░░░░░░░██─██░░██──██░░██─██░░░░██──██░░░░██─
** ─██░░██████████─██░░██──██░░██─████░░██──██░░████─
** ─██░░██─────────██░░██──██░░██───██░░░░██░░░░██───
** ─██░░██─────────██░░██──██░░██───████░░░░░░████───
** ─██░░██──██████─██░░██──██░░██─────██░░░░░░██─────
** ─██░░██──██░░██─██░░██──██░░██───████░░░░░░████───
** ─██░░██──██░░██─██░░██──██░░██───██░░░░██░░░░██───
** ─██░░██████░░██─██░░██████░░██─████░░██──██░░████─
** ─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░░░██──██░░░░██─
** ─██████████████─██████████████─████████──████████─
** ──────────────────────────────────────────────────
*/
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../design/styles.dart' as styles;

class PullToRefresh extends StatefulWidget {

  final Widget body;

  final AsyncCallback? onRefresh;

  final double? height;

  final Color? backgroundColor;

  final Color? foregroundColor;

  const PullToRefresh({
    Key? key,
    required this.body,
    this.onRefresh,
    this.backgroundColor,
    this.foregroundColor,
    this.height,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => PullToRefreshState();
}

class PullToRefreshState extends State<PullToRefresh> with SingleTickerProviderStateMixin {

  IndicatorState _stateOfRefreshing = IndicatorState.idle;

  double _heightOfRefreshing = 0;

  late double _height;


  @override
  void initState() {
    super.initState();
    _height = widget.height ?? 72;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.onRefresh == null) {
      return widget.body;
    }
    return CustomRefreshIndicator(
      onRefresh: () async {
        if (_stateOfRefreshing == IndicatorState.finalizing) {
          setState(() {
            _heightOfRefreshing = _height;
          });
        }
        await widget.onRefresh!();
      },
      builder: (context, child, controller) {
        _heightOfRefreshing = _height * (controller.value >= 1 ? 1 : controller.value);
        if (controller.isFinalizing && _stateOfRefreshing != IndicatorState.finalizing) {
          _stateOfRefreshing = IndicatorState.finalizing;
          _heightOfRefreshing = _height;
        } else if (controller.isCanceling) {
          _stateOfRefreshing = IndicatorState.canceling;
        }
        return Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Container(
              color: Colors.transparent,
              width: styles.screenWidth,
              height: _heightOfRefreshing,
              child: Center(
                child: controller.isIdle ? Container() : _buildTitledProgressIndicator(),
              ),
            ),
            Transform.translate(
              offset: Offset(0, _height * controller.value),
              child: child,
            ),
          ],
        );
      },
      child: widget.body,
    );
  }

  Widget _buildTitledProgressIndicator() {
    return Center(
      child: Image.asset('asset/image/common/loading.gif',),
    );
  }
}