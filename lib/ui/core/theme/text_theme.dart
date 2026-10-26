import 'package:flutter/material.dart';
import 'package:wallet_app/ui/core/theme/app_fontsize.dart';

const lightTextTheme = TextTheme(
  bodyMedium: TextStyle(color: Colors.black, fontSize: AppFontsize.md),
  bodySmall: TextStyle(
    color: Color.fromARGB(255, 143, 142, 142),
    fontSize: AppFontsize.sm,
  ),
  headlineMedium: TextStyle(color: Colors.black),
  titleMedium: TextStyle(
    color: Colors.black,
    fontSize: AppFontsize.md,
    fontWeight: FontWeight.bold,
  ),
  titleLarge: TextStyle(
    color: Colors.black,
    fontSize: AppFontsize.xl,
    fontWeight: FontWeight.bold,
  ),
  titleSmall: TextStyle(
    color: Colors.black,
    fontSize: AppFontsize.sm,
    fontWeight: FontWeight.bold,
  ),
  headlineLarge: TextStyle(
    color: Colors.black,
    fontSize: AppFontsize.xxl,
    fontWeight: FontWeight.bold,
  ),
);

const darkTextTheme = TextTheme(
  bodyMedium: TextStyle(color: Color(0xFFECE8EF), fontSize: AppFontsize.md),

  bodySmall: TextStyle(color: Color(0xFFAAA5AE), fontSize: AppFontsize.sm),

  headlineMedium: TextStyle(color: Color(0xFFF5F1F7)),

  titleMedium: TextStyle(
    color: Color(0xFFF5F1F7),
    fontSize: AppFontsize.md,
    fontWeight: FontWeight.bold,
  ),

  titleLarge: TextStyle(
    color: Color(0xFFF5F1F7),
    fontSize: AppFontsize.xl,
    fontWeight: FontWeight.bold,
  ),

  titleSmall: TextStyle(
    color: Color(0xFFF5F1F7),
    fontSize: AppFontsize.sm,
    fontWeight: FontWeight.bold,
  ),

  headlineLarge: TextStyle(
    color: Color(0xFFF5F1F7),
    fontSize: AppFontsize.xxl,
    fontWeight: FontWeight.bold,
  ),
);
