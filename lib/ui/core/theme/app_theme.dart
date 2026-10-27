import 'package:flutter/material.dart';
import 'package:wallet_app/ui/core/theme/app_colors_extension.dart';
import 'package:wallet_app/ui/core/theme/list_item_theme.dart';
import 'package:wallet_app/ui/core/theme/navigation_bar_theme.dart';
import 'package:wallet_app/ui/core/theme/sort_and_filter_theme.dart';
import 'package:wallet_app/ui/core/theme/text_theme.dart';

final lightTheme = ThemeData.light().copyWith(
  bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.white),

  dividerTheme: DividerThemeData(color: Color.fromARGB(187, 202, 202, 202)),

  extensions: <ThemeExtension<dynamic>>[
    lightAppColorExtension,
    lightListItemTextStyles,
    lightSortAndFilterTheme,
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

  textTheme: lightTextTheme,

  scaffoldBackgroundColor: const Color.fromARGB(255, 241, 241, 241),

  navigationBarTheme: lightNavigationBarTheme,
);

final darkTheme = ThemeData.dark().copyWith(
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Color(0xFF18151B),
    surfaceTintColor: Colors.transparent,
  ),

  dividerTheme: const DividerThemeData(color: Color(0xFF38343B)),

  extensions: <ThemeExtension<dynamic>>[
    darkAppColorExtension,
    darkListItemTextStyles,
    darkSortAndFilterTheme,
  ],

  colorScheme: const ColorScheme(
    brightness: Brightness.dark,

    primary: Color.fromARGB(255, 185, 43, 237),
    onPrimary: Color.fromARGB(255, 185, 54, 233),

    secondary: Color.fromARGB(255, 233, 213, 241),
    onSecondary: Color.fromARGB(255, 215, 193, 223),

    error: Color(0xFFFF6B6B),
    onError: Color(0xFF2B0808),

    surface: Color(0xFF242027),
    onSurface: Color(0xFFF0ECF2),
  ),

  iconTheme: const IconThemeData(color: Color(0xFFB8B2BD), size: 20),

  textTheme: darkTextTheme,

  scaffoldBackgroundColor: const Color(0xFF121015),

  navigationBarTheme: darkNavigationBarTheme,
);
