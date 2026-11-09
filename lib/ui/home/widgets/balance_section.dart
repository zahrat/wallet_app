import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_app/extensions/number_extension.dart';
import 'package:wallet_app/l10n/app_localizations.dart';
import 'package:wallet_app/ui/core/theme/index.dart';
import 'package:wallet_app/ui/core/ui/index.dart';

class BalanceSection extends StatelessWidget {
  const BalanceSection({super.key, required this.balanceAsync});
  final AsyncValue<double> balanceAsync;

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
          AsyncValueView<double>(
            value: balanceAsync,
            data: (balance) => AppText(
              text: '\$${balance.separateByComma()}',
              style: textTheme.titleLarge,
            ),
          ),
        ],
      ),
    );
  }
}
