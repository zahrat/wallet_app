import 'package:flutter/material.dart';
import 'package:wallet_app/ui/core/theme/app_colors.dart';
import 'package:wallet_app/ui/core/theme/app_fontsize.dart';

final lightTheme = ThemeData.light().copyWith(
  bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.white),
  dividerTheme: DividerThemeData(color: Color.fromARGB(187, 202, 202, 202)),
  extensions: const <ThemeExtension<dynamic>>[
    AppColors(
      borderColor: Color.fromARGB(189, 224, 226, 227),
      grayIcon: Color.fromARGB(187, 127, 129, 129),
      grayText: Color.fromARGB(187, 127, 129, 129),
    ),
  ],
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: Color.fromARGB(255, 185, 43, 237),
    onPrimary: Color.fromARGB(255, 185, 54, 233),
    secondary: Color.fromARGB(255, 233, 213, 241),
    onSecondary: Color.fromARGB(255, 215, 193, 223),
    error: Colors.red,
    onError: Colors.red,
    surface: const Color.fromARGB(179, 244, 242, 242),
    onSurface: const Color.fromARGB(255, 241, 235, 235),
  ),
  iconTheme: IconThemeData(color: Color.fromARGB(186, 80, 80, 80), size: 20),
  textTheme: const TextTheme(
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
  ),
  scaffoldBackgroundColor: const Color.fromARGB(255, 241, 241, 241),
  navigationBarTheme: NavigationBarThemeData(
    surfaceTintColor: Color.fromARGB(179, 16, 16, 16),
    indicatorColor: Colors.white,
    backgroundColor: Colors.white,
    iconTheme: WidgetStateProperty.resolveWith<IconThemeData?>((states) {
      if (states.contains(WidgetState.selected)) {
        return const IconThemeData(color: Colors.black);
      }

      return const IconThemeData(color: Colors.grey);
    }),
    labelTextStyle: WidgetStateProperty.resolveWith<TextStyle?>((states) {
      if (states.contains(WidgetState.selected)) {
        return const TextStyle(color: Colors.black);
      }

      return const TextStyle(color: Colors.grey);
    }),
  ),
);

final darkTheme = ThemeData.dark().copyWith(
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: Color.fromARGB(255, 240, 222, 246),
    onPrimary: Color.fromARGB(255, 229, 213, 235),
    secondary: Color.fromARGB(255, 251, 250, 252),
    onSecondary: Color.fromARGB(255, 248, 247, 249),
    error: Colors.red,
    onError: Colors.red,
    surface: const Color.fromARGB(179, 16, 16, 16),
    onSurface: const Color.fromARGB(255, 27, 26, 26),
  ),
  textTheme: TextTheme(
    bodySmall: TextStyle(color: Color.fromARGB(255, 213, 213, 213)),
    headlineMedium: TextStyle(color: Colors.white),
    titleMedium: TextStyle(color: Colors.white, fontSize: AppFontsize.md),
  ),
  scaffoldBackgroundColor: Color.fromARGB(179, 4, 4, 4),
  navigationBarTheme: NavigationBarThemeData(
    surfaceTintColor: Color.fromARGB(179, 16, 16, 16),
    indicatorColor: Color.fromARGB(255, 10, 0, 14),
    backgroundColor: Color.fromARGB(255, 10, 0, 14),
    labelTextStyle: WidgetStateProperty.resolveWith<TextStyle?>((states) {
      if (states.contains(WidgetState.selected)) {
        return const TextStyle(color: Colors.white);
      }

      return const TextStyle(color: Color.fromARGB(255, 231, 229, 229));
    }),
    iconTheme: WidgetStateProperty.resolveWith<IconThemeData?>((states) {
      if (states.contains(WidgetState.selected)) {
        return const IconThemeData(color: Colors.white);
      }

      return const IconThemeData(color: Color.fromARGB(255, 231, 229, 229));
    }),
  ),
);
