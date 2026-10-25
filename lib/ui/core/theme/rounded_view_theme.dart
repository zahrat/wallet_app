import 'package:flutter/material.dart';

@immutable
class RoundedViewTheme extends ThemeExtension<RoundedViewTheme> {
  const RoundedViewTheme({
    required this.backgroundColor,
    required this.borderRadius,
  });

  final Color backgroundColor;
  final BorderRadius borderRadius;

  @override
  RoundedViewTheme copyWith({
    Color? backgroundColor,
    BorderRadius? borderRadius,
  }) {
    return RoundedViewTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  @override
  RoundedViewTheme lerp(RoundedViewTheme? other, double t) {
    if (other == null) return this;
    return RoundedViewTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      borderRadius: BorderRadius.lerp(borderRadius, other.borderRadius, t)!,
    );
  }
}
