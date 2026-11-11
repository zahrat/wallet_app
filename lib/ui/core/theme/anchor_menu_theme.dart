import 'package:flutter/material.dart';

@immutable
class AnchorMenuTheme extends ThemeExtension<AnchorMenuTheme> {
  const AnchorMenuTheme({
    required this.sortIconColor,
    required this.menuStyle,
    required this.itemStyle,
    required this.selectedItemStyle,
    required this.buttonStyle,
  });

  final MenuStyle menuStyle;
  final Color sortIconColor;
  final ButtonStyle itemStyle;
  final ButtonStyle selectedItemStyle;
  final ButtonStyle buttonStyle;

  @override
  AnchorMenuTheme copyWith({
    Color? sortIconColor,
    MenuStyle? menuStyle,
    ButtonStyle? itemStyle,
    ButtonStyle? selectedItemStyle,
    ButtonStyle? buttonStyle,
  }) {
    return AnchorMenuTheme(
      sortIconColor: sortIconColor ?? this.sortIconColor,
      menuStyle: menuStyle ?? this.menuStyle,
      itemStyle: itemStyle ?? this.itemStyle,
      selectedItemStyle: selectedItemStyle ?? this.selectedItemStyle,
      buttonStyle: buttonStyle ?? this.buttonStyle,
    );
  }

  @override
  AnchorMenuTheme lerp(AnchorMenuTheme? other, double t) {
    if (other == null) return this;
    return AnchorMenuTheme(
      sortIconColor: Color.lerp(sortIconColor, other.sortIconColor, t)!,
      menuStyle: MenuStyle.lerp(menuStyle, other.menuStyle, t)!,
      itemStyle: ButtonStyle.lerp(itemStyle, other.itemStyle, t)!,
      selectedItemStyle: ButtonStyle.lerp(
        selectedItemStyle,
        other.selectedItemStyle,
        t,
      )!,
      buttonStyle: ButtonStyle.lerp(buttonStyle, other.buttonStyle, t)!,
    );
  }
}

final lightAnchorMenuTheme = AnchorMenuTheme(
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
    minimumSize: const Size(180, 30),
    foregroundColor: Color.fromARGB(255, 185, 43, 237),
    backgroundColor: Color.fromARGB(255, 185, 43, 237).withValues(alpha: 0.10),
    iconSize: 18,
    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  ),
  buttonStyle: TextButton.styleFrom(
    foregroundColor: Colors.black,
    backgroundColor: Color.fromARGB(255, 185, 43, 237).withValues(alpha: 0.07),
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
);

final darkAnchorMenuTheme = AnchorMenuTheme(
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
      side: BorderSide(color: const Color(0xFFF0DEF6).withValues(alpha: 0.15)),
    ),
  ),
);
