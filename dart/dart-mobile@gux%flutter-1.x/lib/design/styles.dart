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
import 'package:flutter/material.dart';

const double padding = 16.0;

late double _screenWidth;

late double _screenHeight;

void init(BuildContext context) {
  final size = MediaQuery.of(context).size;
  _screenHeight = size.height;
  _screenWidth = size.width;
}

Color get colorPrimary {
  return Color(0xff3f86ff);
}

Color get colorError {
  return Color(0xffF53F3F);
}

Color get colorErrorLight {
  return Color(0xffFFECE8);
}

Color get colorSuccess {
  return Color(0xFF37C654);
}

Color get colorSuccessLight {
  return Color(0xffF1F9F1);
}

Color get colorWarning {
  return Color(0xffFF780A);
}

Color get colorWarningLight {
  return Color(0xffFFF4EB);
}

Color get colorInfo {
  return const Color(0xFF00AFF2);
}

Color get colorInfoLight {
  return const Color (0xFFF0F6FA);
}

Color get colorBackground {
  return const Color(0xFFF3F3F3);
}

Color get colorDivider {
  return const Color(0xFFE7E7E7);
}

Color get colorBorder {
  return const Color(0xFFDCDCDC);
}

Color get colorSurface {
  return const Color(0xFFFFFFFF);
}

Color get colorSurfaceSecondary {
  return const Color(0xFFF3F3F3);
}

Color get colorFatal {
  return const Color(0xFFF2595E);
}

Color get colorCritical {
  return const Color(0xFFFF7B5C);
}

Color get colorMajor {
  return const Color(0xFFF6A144);
}

Color get colorHigh {
  return const Color(0xFFECC000);
}

Color get colorModerate {
  return const Color(0xFF03C7DD);
}

Color get colorLow {
  return const Color(0xFF01CAA6);
}

Color get colorTextPrimary {
  return Color.fromRGBO(0, 0, 0, 0.87);
}

Color get colorTextSecondary {
  return const Color(0xff8A8A8D);
}

Color get colorTextTertiary {
  return const Color(0xFFAFAFAF);
}

Color get colorTextPlaceholder {
  return const Color(0xFF000000).withOpacity(0.4);
}

Color get colorTextDisabled {
  return const Color(0xFF000000).withOpacity(0.26);
}

Color get colorTextInverse {
  return Color.fromRGBO(250, 250, 250, 1);
}

Color get colorTextSecondaryInverse {
  return const Color(0xFFF9F9F9);
}

Color get colorTextTertiaryInverse {
  return const Color(0xFFF2F2F2);
}

double get screenHeight {
  return _screenHeight;
}

double get screenWidth {
  return _screenWidth;
}

double width(context, int paddingCount, int count) {
  double width = MediaQuery.of(context).size.width;
  return (width - padding * paddingCount) / count;
}