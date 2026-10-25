import 'package:flutter/material.dart';
import 'package:wallet_app/l10n/app_localizations.dart';

import '../../core/ui/index.dart';

class SectionLabel extends StatelessWidget {
  const SectionLabel({super.key, required this.label, this.onSeeAll});
  final String label;
  final VoidCallback? onSeeAll;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final localizations = AppLocalizations.of(context);

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
        if (onSeeAll != null)
          TextButton(
            onPressed: onSeeAll,
            child: AppText(
              text: localizations!.seeAll,
              style: TextStyle(color: Colors.blue),
            ),
          ),
      ],
    );
  }
}
