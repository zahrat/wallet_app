import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({required this.borderColor, required this.grayIcon});

  final Color borderColor;
  final Color grayIcon;

  @override
  AppColors copyWith() {
    return AppColors(borderColor: borderColor, grayIcon: grayIcon);
  }

  @override
  AppColors lerp(AppColors other, double t) {
    return AppColors(
      borderColor: Color.lerp(borderColor, other.borderColor, t) ?? borderColor,
      grayIcon: Color.lerp(grayIcon, other.grayIcon, t) ?? grayIcon,
    );
  }
}
