import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.borderColor,
    required this.grayIcon,
    required this.grayText,
    required this.secondView,
  });

  final Color borderColor;
  final Color grayIcon;
  final Color grayText;
  final Color secondView;

  @override
  AppColors copyWith() {
    return AppColors(
      borderColor: borderColor,
      grayIcon: grayIcon,
      grayText: grayText,
      secondView: secondView,
    );
  }

  @override
  AppColors lerp(AppColors other, double t) {
    return AppColors(
      borderColor: Color.lerp(borderColor, other.borderColor, t) ?? borderColor,
      grayIcon: Color.lerp(grayIcon, other.grayIcon, t) ?? grayIcon,
      grayText: Color.lerp(grayText, other.grayText, t) ?? grayText,
      secondView: Color.lerp(secondView, other.secondView, t) ?? grayText,
    );
  }
}
