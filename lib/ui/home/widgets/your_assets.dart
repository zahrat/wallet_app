import 'package:flutter/material.dart';
import 'package:wallet_app/data/models/asset.dart';
import 'package:wallet_app/data/models/currency.dart';
import 'package:wallet_app/ui/core/theme/index.dart';
import 'package:wallet_app/ui/home/widgets/section_label.dart';

import '../../core/ui/index.dart';

class YourAssets extends StatelessWidget {
  const YourAssets({
    super.key,
    required this.assets,
    required this.getAssetBalance,
  });
  final List<Asset> assets;
  final double Function(Currency currency) getAssetBalance;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: Spacing.md,
      children: [
        const SectionLabel(label: "Your Assets"),
        RoundedCard(
          child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final asset = assets[index];
              final balance = getAssetBalance(asset.currency);
              return CurrencyItem(asset: asset, balance: balance);
            },
            itemCount: assets.length,
          ),
        ),
      ],
    );
  }
}

class CurrencyItem extends StatelessWidget {
  const CurrencyItem({super.key, required this.asset, required this.balance});
  final Asset asset;
  final double balance;

  @override
  Widget build(BuildContext context) {
    final secondaryColor = Theme.of(context).colorScheme.secondary;

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
      child: Row(
        spacing: Spacing.sm,

        children: [
          CircleAvatar(
            backgroundColor: secondaryColor,
            child: AppImage(
              imageUri: asset.icon,
              width: 50,
              height: 50,
              isAsset: false,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: asset.currency.name.toUpperCase(),
                style: TextStyles.listItemTitle,
              ),
              AppText(
                text: "${asset.balance} ${asset.currency.name.toUpperCase()}",
                style: TextStyles.listItemDescription,
              ),
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,

              children: [
                AppText(
                  text: "\$${balance.toStringAsFixed(2)}",
                  style: TextStyles.listItemTitle,
                ),
              ],
            ),
          ),
          const Icon(Icons.keyboard_arrow_right_outlined),
        ],
      ),
    );
  }
}
