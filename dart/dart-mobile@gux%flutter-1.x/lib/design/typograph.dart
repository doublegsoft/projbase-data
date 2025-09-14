
import 'package:flutter/material.dart';
import 'styles.dart';

class Headline1 extends StatelessWidget {

  final String text;

  Color? color;

  final int lines;

  final double width;

  final double lineHeight;

  Headline1({
    required this.text,
    this.color,
    this.lineHeight = 0,
    this.lines = 1,
    this.width = 0,
  }) {
    this.color = this.color??colorTextPrimary;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width == 0 ? null : width,
      alignment: Alignment.centerLeft,
      child: Text(text,
        maxLines: lines,
        style: TextStyle(
          color: color,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class Headline2 extends StatelessWidget {

  final String text;

  Color? color;

  final int lines;

  final double width;

  final double lineHeight;

  Headline2({
    required this.text,
    this.color,
    this.lineHeight = 0,
    this.lines = 1,
    this.width = 0,
  }) {
    this.color = this.color??colorTextPrimary;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width == 0 ? null : width,
      alignment: Alignment.centerLeft,
      child: Text(text,
        style: TextStyle(
          color: color,
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class Headline3 extends StatelessWidget {

  final String text;

  Color? color;

  final int lines;

  final double width;

  final double lineHeight;

  Headline3({
    required this.text,
    this.color,
    this.lineHeight = 0,
    this.lines = 1,
    this.width = 0,
  }) {
    this.color = this.color??colorTextPrimary;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width == 0 ? null : width,
      alignment: Alignment.centerLeft,
      child: Text(text,
        style: TextStyle(
          color: color,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class Headline4 extends StatelessWidget {

  final String text;

  Color? color;

  final int lines;

  final double width;

  final double lineHeight;

  Headline4({
    required this.text,
    this.lineHeight = 0,
    this.lines = 1,
    this.width = 0,
  }) {
    this.color = this.color??colorTextPrimary;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width == 0 ? null : width,
      alignment: Alignment.centerLeft,
      child: Text(text,
        style: TextStyle(
          color: color,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class Headline5 extends StatelessWidget {

  final String text;

  Color? color;

  final int lines;

  final double width;

  final double lineHeight;

  Headline5({
    required this.text,
    this.color,
    this.lineHeight = 0,
    this.lines = 1,
    this.width = 0,
  }) {
    this.color = this.color??colorTextPrimary;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width == 0 ? null : width,
      alignment: Alignment.centerLeft,
      child: Text(text,
        style: TextStyle(
          color: color,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class Headline6 extends StatelessWidget {

  final String text;

  Color? color;

  final int lines;

  final double width;

  final double lineHeight;

  Headline6({
    required this.text,
    this.color,
    this.lineHeight = 0,
    this.lines = 1,
    this.width = 0,
  }) {
    this.color = this.color??colorTextPrimary;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width == 0 ? null : width,
      alignment: Alignment.centerLeft,
      child: Text(text,
        style: TextStyle(
          color: color,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}