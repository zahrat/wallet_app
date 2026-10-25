import 'package:flutter/material.dart';

class ListItemTextStyles extends ThemeExtension<ListItemTextStyles> {
  const ListItemTextStyles({
    required this.listItemTitle,
    required this.listItemDescription,
  });

  final TextStyle listItemTitle;

  final TextStyle listItemDescription;

  @override
  ThemeExtension<ListItemTextStyles> copyWith() {
    return ListItemTextStyles(
      listItemTitle: listItemTitle,
      listItemDescription: listItemDescription,
    );
  }

  @override
  ThemeExtension<ListItemTextStyles> lerp(
    covariant ThemeExtension<ListItemTextStyles>? other,
    double t,
  ) {
    return ListItemTextStyles(
      listItemTitle: listItemTitle,
      listItemDescription: listItemDescription,
    );
  }
}
