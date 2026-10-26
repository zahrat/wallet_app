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

const lightListItemTextStyles = ListItemTextStyles(
  listItemTitle: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  ),

  listItemDescription: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: Colors.blueGrey,
  ),
);

const darkListItemTextStyles = ListItemTextStyles(
  listItemTitle: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  ),

  listItemDescription: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 234, 241, 245),
  ),
);
