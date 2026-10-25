import 'package:flutter/material.dart';
import 'package:wallet_app/l10n/app_localizations.dart';
import 'package:wallet_app/ui/core/theme/index.dart';
import 'package:wallet_app/ui/core/ui/index.dart';

class BalanceSection extends StatelessWidget {
  const BalanceSection({super.key, required this.balance});
  final double balance;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final localizations = AppLocalizations.of(context);

    return RoundedCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: Spacing.sm,
            children: [
              AppText(
                text: localizations!.totalBalace,
                style: textTheme.titleMedium,
              ),
              const Icon(Icons.remove_red_eye_outlined, size: 15),
            ],
          ),
          AppText(text: '\$${balance.toString()}', style: textTheme.titleLarge),
        ],
      ),
    );
  }
}
