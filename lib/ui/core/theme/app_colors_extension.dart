import 'package:flutter/material.dart';

@immutable
class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  const AppColorsExtension({
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
  AppColorsExtension copyWith() {
    return AppColorsExtension(
      borderColor: borderColor,
      grayIcon: grayIcon,
      grayText: grayText,
      secondView: secondView,
    );
  }

  @override
  AppColorsExtension lerp(AppColorsExtension other, double t) {
    return AppColorsExtension(
      borderColor: Color.lerp(borderColor, other.borderColor, t) ?? borderColor,
      grayIcon: Color.lerp(grayIcon, other.grayIcon, t) ?? grayIcon,
      grayText: Color.lerp(grayText, other.grayText, t) ?? grayText,
      secondView: Color.lerp(secondView, other.secondView, t) ?? grayText,
    );
  }
}

final lightAppColorExtension = const AppColorsExtension(
  borderColor: Color.fromARGB(189, 224, 226, 227),
  grayIcon: Color.fromARGB(187, 127, 129, 129),
  grayText: Color.fromARGB(187, 127, 129, 129),
  secondView: Colors.white,
);

final darkAppColorExtension = const AppColorsExtension(
  borderColor: Color(0xFF38343B),
  grayIcon: Color(0xFFAAA5AE),
  grayText: Color(0xFFAAA5AE),
  secondView: Color.fromARGB(255, 112, 111, 111),
);
