import 'package:flutter/material.dart';
import 'package:wallet_app/l10n/app_localizations.dart';
import 'package:wallet_app/ui/core/theme/spacing.dart';
import 'package:wallet_app/ui/core/ui/app_text.dart';

class ListEmptyState extends StatelessWidget {
  const ListEmptyState({super.key, this.text});
  final String? text;

  @override
  Widget build(BuildContext context) {
    final titleText = Theme.of(context).textTheme.titleMedium;
    final emptyText = AppLocalizations.of(context)!.listIsEmpty;

    return Column(
      spacing: Spacing.xl,
      children: [
        AppText(text: text ?? emptyText, style: titleText),
        const Icon(Icons.hourglass_empty),
      ],
    );
  }
}
