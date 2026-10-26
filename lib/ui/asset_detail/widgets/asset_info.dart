import 'package:flutter/material.dart';
import 'package:wallet_app/l10n/app_localizations.dart';
import 'package:wallet_app/ui/core/theme/app_colors_extension.dart';
import 'package:wallet_app/ui/core/ui/index.dart';

class AssetInfo extends StatelessWidget {
  const AssetInfo({
    super.key,
    required this.balance,
    required this.currentPrice,
  });
  final double balance;
  final double currentPrice;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).extension<AppColorsExtension>();

    return RoundedCard(
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                AppText(
                  text: localizations!.currentPrice,
                  style: textTheme.titleSmall?.copyWith(
                    color: colors!.grayText,
                  ),
                ),
                AppText(text: "$currentPrice", style: textTheme.titleMedium),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                AppText(
                  text: localizations!.totalValue,
                  style: textTheme.titleSmall?.copyWith(
                    color: colors!.grayText,
                  ),
                ),
                AppText(
                  text: "\$${(balance * currentPrice).toStringAsFixed(2)}",
                  style: textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
