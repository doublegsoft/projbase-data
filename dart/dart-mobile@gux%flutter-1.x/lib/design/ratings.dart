
import 'package:flutter/material.dart';
import 'dart:math' as math;

class StarRating extends StatelessWidget {
  final double rating;
  final int starCount;
  final double starSize;
  final Color starColor;
  final Color emptyStarColor;
  final Function(double)? onRatingChanged;

  StarRating({
    required this.rating,
    this.starCount = 5,
    this.starSize = 36.0,
    this.starColor = Colors.amber,
    this.emptyStarColor = Colors.grey,
    this.onRatingChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(starCount, (index) {
        double fillPercentage = rating - index;
        bool isSelected = fillPercentage > 0;

        return GestureDetector(
          onTap: () {
            if (onRatingChanged != null) {
              onRatingChanged!(index + 1.0);
            }
          },
          child: Icon(Icons.star, color: Colors.yellow, size: 24,)
        );
      }),
    );
  }
}