import 'package:flutter/material.dart';
import 'package:wallet_app/ui/core/theme/app_colors_extension.dart';
import 'package:wallet_app/ui/core/theme/app_fontsize.dart';
import 'package:wallet_app/ui/core/theme/list_item_theme.dart';
import 'package:wallet_app/ui/core/theme/sort_and_filter_theme.dart';

final lightTheme = ThemeData.light().copyWith(
  bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.white),
  dividerTheme: DividerThemeData(color: Color.fromARGB(187, 202, 202, 202)),
  extensions: <ThemeExtension<dynamic>>[
    lightAppColorExtension,
    lightListItemTextStyles,

    SortAndFilterTheme(
      sortIconColor: Color.fromARGB(255, 185, 43, 237),
      menuStyle: MenuStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.white),
        surfaceTintColor: const WidgetStatePropertyAll(Colors.transparent),
        elevation: const WidgetStatePropertyAll(6),
        padding: const WidgetStatePropertyAll(EdgeInsets.all(6)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
      itemStyle: MenuItemButton.styleFrom(
        minimumSize: const Size(180, 44),
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        iconSize: 18,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      selectedItemStyle: MenuItemButton.styleFrom(
        minimumSize: const Size(180, 44),
        foregroundColor: Color.fromARGB(255, 185, 43, 237),
        backgroundColor: Color.fromARGB(
          255,
          185,
          43,
          237,
        ).withValues(alpha: 0.10),
        iconSize: 18,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      buttonStyle: TextButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Color.fromARGB(
          255,
          185,
          43,
          237,
        ).withValues(alpha: 0.07),
        iconColor: Colors.black,
        iconSize: 20,
        textStyle: ThemeData.light().textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.w600,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: Color.fromARGB(255, 185, 43, 237).withValues(alpha: 0.12),
          ),
        ),
      ),
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
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Color(0xFF18151B),
    surfaceTintColor: Colors.transparent,
  ),

  dividerTheme: const DividerThemeData(color: Color(0xFF38343B)),

  extensions: <ThemeExtension<dynamic>>[
    darkAppColorExtension,
    darkListItemTextStyles,

    SortAndFilterTheme(
      sortIconColor: const Color(0xFFF0DEF6),

      menuStyle: MenuStyle(
        backgroundColor: const WidgetStatePropertyAll(Color(0xFF242027)),
        surfaceTintColor: const WidgetStatePropertyAll(Colors.transparent),
        elevation: const WidgetStatePropertyAll(6),
        padding: const WidgetStatePropertyAll(EdgeInsets.all(6)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),

      itemStyle: MenuItemButton.styleFrom(
        minimumSize: const Size(180, 44),
        foregroundColor: const Color(0xFFECE8EF),
        backgroundColor: Colors.transparent,
        iconSize: 18,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),

      selectedItemStyle: MenuItemButton.styleFrom(
        minimumSize: const Size(180, 44),
        foregroundColor: const Color(0xFFF0DEF6),
        backgroundColor: const Color(0xFFF0DEF6).withValues(alpha: 0.12),
        iconSize: 18,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),

      buttonStyle: TextButton.styleFrom(
        foregroundColor: const Color(0xFFECE8EF),
        backgroundColor: const Color(0xFFF0DEF6).withValues(alpha: 0.08),
        iconColor: const Color(0xFFECE8EF),
        iconSize: 20,
        textStyle: ThemeData.dark().textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.w600,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: const Color(0xFFF0DEF6).withValues(alpha: 0.15),
          ),
        ),
      ),
    ),
  ],

  colorScheme: const ColorScheme(
    brightness: Brightness.dark,

    primary: Color(0xFFF0DEF6),
    onPrimary: Color(0xFF25152B),

    secondary: Color(0xFFD8B5E5),
    onSecondary: Color(0xFF291D2D),

    error: Color(0xFFFF6B6B),
    onError: Color(0xFF2B0808),

    surface: Color(0xFF242027),
    onSurface: Color(0xFFF0ECF2),
  ),

  iconTheme: const IconThemeData(color: Color(0xFFB8B2BD), size: 20),

  textTheme: const TextTheme(
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
  ),

  scaffoldBackgroundColor: const Color(0xFF121015),

  navigationBarTheme: NavigationBarThemeData(
    surfaceTintColor: Colors.transparent,
    indicatorColor: const Color(0xFF38283F),
    backgroundColor: const Color(0xFF18151B),

    iconTheme: WidgetStateProperty.resolveWith<IconThemeData?>((states) {
      if (states.contains(WidgetState.selected)) {
        return const IconThemeData(color: Color(0xFFF0DEF6));
      }

      return const IconThemeData(color: Color(0xFFAAA5AE));
    }),

    labelTextStyle: WidgetStateProperty.resolveWith<TextStyle?>((states) {
      if (states.contains(WidgetState.selected)) {
        return const TextStyle(color: Color(0xFFF0DEF6));
      }

      return const TextStyle(color: Color(0xFFAAA5AE));
    }),
  ),
);
