import 'dart:collection';

import 'package:flutter/material.dart';

typedef SortEntry = DropdownMenuEntry<Sort>;

enum Sort {
  newest('Newest'),
  oldest('Oldest'),
  none('Default');

  const Sort(this.label);
  final String label;

  static final List<SortEntry> entries = UnmodifiableListView<SortEntry>(
    values.map<SortEntry>(
      (Sort sort) => SortEntry(value: sort, label: sort.label),
    ),
  );
}
