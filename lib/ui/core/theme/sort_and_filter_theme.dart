import 'package:flutter/material.dart';

@immutable
class SortAndFilterTheme extends ThemeExtension<SortAndFilterTheme> {
  const SortAndFilterTheme({
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
  SortAndFilterTheme copyWith({
    Color? sortIconColor,
    MenuStyle? menuStyle,
    ButtonStyle? itemStyle,
    ButtonStyle? selectedItemStyle,
    ButtonStyle? buttonStyle,
  }) {
    return SortAndFilterTheme(
      sortIconColor: sortIconColor ?? this.sortIconColor,
      menuStyle: menuStyle ?? this.menuStyle,
      itemStyle: itemStyle ?? this.itemStyle,
      selectedItemStyle: selectedItemStyle ?? this.selectedItemStyle,
      buttonStyle: buttonStyle ?? this.buttonStyle,
    );
  }

  @override
  SortAndFilterTheme lerp(SortAndFilterTheme? other, double t) {
    if (other == null) return this;
    return SortAndFilterTheme(
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
