
import 'dart:math';

import 'package:flutter/material.dart';

class FixedMaxBar extends StatelessWidget {

  final List<double> data;

  final double maxValue;

  const FixedMaxBar({
    Key? key,
    required this.data,
    this.maxValue = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: data.asMap().entries.map((entry) {
          final double barHeight = (entry.value / maxValue) * 180;
          return Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: 30,
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: 30,
                      height: barHeight,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4,),
              Text('${entry.value.toStringAsFixed(0)}', style: TextStyle(fontSize: 13,))
            ],
          );
        }).toList(),
      ),
    );
  }
}

class TickGaugePainter extends CustomPainter {
  final double progress;
  final int tickCount;

  TickGaugePainter({
    required this.progress,
    required this.tickCount,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height);
    final radius = size.width * 0.4;
    final tickLength = size.width * 0.08;
    final tickWidth = 2.0;

    // Calculate the sweep angle for the progress (180 degrees = pi radians)
    final double startAngle = -pi;
    final double totalSweepAngle = pi;
    final double sweepAnglePerTick = totalSweepAngle / (tickCount - 1);

    final paint = Paint()
      ..color = Colors.blue.withOpacity(0.3)
      ..strokeWidth = tickWidth
      ..style = PaintingStyle.stroke;

    // Draw the ticks
    for (int i = 0; i < tickCount; i++) {
      final currentAngle = startAngle + (sweepAnglePerTick * i);
      final shouldHighlight = i <= (progress * tickCount);

      paint.color = shouldHighlight
          ? Colors.blue
          : Colors.blue.withOpacity(0.1);

      final innerPoint = Offset(
        center.dx + (radius * cos(currentAngle)),
        center.dy + (radius * sin(currentAngle)),
      );

      final inner2Point = Offset(
        center.dx + ((radius - 10) * cos(currentAngle)),
        center.dy + ((radius - 10) * sin(currentAngle)),
      );

      final inner3Point = Offset(
        center.dx + ((radius - 8) * cos(currentAngle)),
        center.dy + ((radius - 8) * sin(currentAngle)),
      );

      final outerPoint = Offset(
        center.dx + ((radius + tickLength) * cos(currentAngle)),
        center.dy + ((radius + tickLength) * sin(currentAngle)),
      );

      canvas.drawLine(inner2Point, inner3Point, paint);
      canvas.drawLine(innerPoint, outerPoint, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

///
///
///
class Sparkbar extends StatelessWidget {
  final List<double> data;
  final List<Color>? barColors;
  final double barWidth;
  final double borderRadius;
  Sparkbar({
    required this.data,
    this.barColors,
    this.barWidth = 5.0,
    this.borderRadius = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _SparkBarPainter(
          data: data,
          barColors: barColors,
          barWidth: barWidth,
          borderRadius: borderRadius
      ),
    );
  }
}

class _SparkBarPainter extends CustomPainter {
  final List<double> data;
  final List<Color>? barColors;
  final double barWidth;
  final double borderRadius;
  _SparkBarPainter({
    required this.data,
    this.barColors,
    required this.barWidth,
    required this.borderRadius
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (data.isEmpty) return; // Avoid drawing with no data

    final double width = size.width;
    final double height = size.height;
    final double maxData = data.reduce(max);
    final double barSpacing = (width - (data.length * barWidth)) / (data.length + 1); // Calculate spacing
    for (int i = 0; i < data.length; i++) {
      final double barHeight = (data[i] / maxData) * height;
      final double x = barSpacing + (barWidth + barSpacing) * i;
      final double y = height - barHeight; // Top of bar
      final paint = Paint()
        ..color = (barColors?.length ?? 0) > i ? barColors![i] : Colors.blue
        ..style = PaintingStyle.fill;
      final rrect = RRect.fromRectAndRadius(
        Rect.fromLTWH(x, y, barWidth, barHeight),
        Radius.circular(borderRadius),
      );

      canvas.drawRRect(rrect, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _SparkBarPainter oldDelegate) {
    return data != oldDelegate.data ||
        barColors != oldDelegate.barColors ||
        barWidth != oldDelegate.barWidth ||
        borderRadius != oldDelegate.borderRadius;
  }
}

class Sparkline extends StatelessWidget {
  final List<double> data;
  final Color lineColor;
  final double lineWidth;
  final Color? fillColor;

  Sparkline({
    required this.data,
    this.lineColor = Colors.blue,
    this.lineWidth = 1.0,
    this.fillColor
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _SparklinePainter(data: data, lineColor: lineColor, lineWidth: lineWidth, fillColor: fillColor),
    );
  }
}

class _SparklinePainter extends CustomPainter {
  final List<double> data;
  final Color lineColor;
  final double lineWidth;
  final Color? fillColor;
  _SparklinePainter({
    required this.data,
    required this.lineColor,
    required this.lineWidth,
    this.fillColor
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (data.isEmpty) return;

    final double width = size.width;
    final double height = size.height;

    final double minData = data.reduce(min);
    final double maxData = data.reduce(max);
    final double dataRange = maxData - minData;
    if(dataRange <= 0) return;

    final double xStep = width / (data.length - 1);
    List<Offset> points = [];
    for(int i = 0; i < data.length; i++) {
      final double x = i * xStep;
      final double y = height - ((data[i] - minData)/ dataRange) * height;
      points.add(Offset(x,y));
    }

    final path = Path()..moveTo(points[0].dx, points[0].dy);
    final linePath = Path()..moveTo(points[0].dx, points[0].dy);

    for (var i = 0; i < points.length - 1; i++) {
      final p1 = points[i];
      final p2 = points[i + 1];

      final controlPoint1X = p1.dx + xStep/2;
      final controlPoint1Y = p1.dy;
      final controlPoint2X = p2.dx - xStep/2;
      final controlPoint2Y = p2.dy;

      path.cubicTo(controlPoint1X, controlPoint1Y, controlPoint2X, controlPoint2Y, p2.dx, p2.dy);
      linePath.cubicTo(controlPoint1X, controlPoint1Y, controlPoint2X, controlPoint2Y, p2.dx, p2.dy);
    }

    if (fillColor != null) {
      path.lineTo(size.width, size.height);
      path.lineTo(0, size.height);
      path.close();
      final fillPaint = Paint()
        ..color = fillColor!
        ..style = PaintingStyle.fill
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [lineColor, lineColor.withOpacity(0.27)],
          stops: const [0.1, 1.0],
        ).createShader(
          Rect.fromPoints(
              Offset.zero,
              Offset(size.width, size.height)
          ),
        );
      canvas.drawPath(path, fillPaint);
    }
    final linePaint = Paint()
      ..color = lineColor
      ..strokeWidth = lineWidth
      ..style = PaintingStyle.stroke;
    final paint = Paint()
      ..color = Colors.transparent
      ..strokeWidth = lineWidth
      ..style = PaintingStyle.stroke;
    canvas.drawPath(path, paint);
    canvas.drawPath(linePath, linePaint);
  }

  @override
  bool shouldRepaint(covariant _SparklinePainter oldDelegate) {
    return data != oldDelegate.data || lineColor != oldDelegate.lineColor || lineWidth != oldDelegate.lineWidth || fillColor != oldDelegate.fillColor;
  }
}