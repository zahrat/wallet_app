import 'package:flutter/material.dart';

final lightNavigationBarTheme = NavigationBarThemeData(
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
);

final darkNavigationBarTheme = NavigationBarThemeData(
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
);
