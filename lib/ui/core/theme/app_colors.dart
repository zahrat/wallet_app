import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.blackText,
    required this.grayText,
    required this.lightGrayText,
  });

  final Color? blackText;
  final Color? grayText;
  final Color? lightGrayText;

  @override
  AppColors copyWith({
    Color? blackText,
    Color? grayText,
    Color? lightGrayText,
  }) {
    return AppColors(
      blackText: blackText ?? this.blackText,
      grayText: grayText ?? this.grayText,
      lightGrayText: lightGrayText ?? this.lightGrayText,
    );
  }

  @override
  AppColors lerp(AppColors? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      blackText: Color.lerp(blackText, other.blackText, t),
      grayText: Color.lerp(grayText, other.grayText, t),
      lightGrayText: Color.lerp(lightGrayText, other.lightGrayText, t),
    );
  }
}
