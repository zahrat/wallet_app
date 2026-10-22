import 'package:flutter/material.dart';

import '../../core/ui/index.dart';

class SectionLabel extends StatelessWidget {
  const SectionLabel({super.key, required this.label, this.onSeeAll});
  final String label;
  final VoidCallback? onSeeAll;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          text: label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: textTheme.headlineMedium?.color,
          ),
        ),
        TextButton(
          onPressed: onSeeAll,
          child: const AppText(
            text: "See All",
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
