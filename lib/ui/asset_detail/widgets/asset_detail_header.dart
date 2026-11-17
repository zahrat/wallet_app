import 'package:flutter/material.dart';
import 'package:wallet_app/data/models/asset.dart';
import 'package:wallet_app/ui/core/theme/index.dart';
import 'package:wallet_app/ui/core/ui/index.dart';
import 'package:wallet_app/ui/core/ui/photo_hero.dart';

class AssetDetailHeader extends StatelessWidget {
  const AssetDetailHeader({super.key, required this.asset});
  final Asset asset;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: Spacing.md,
      children: [
        Row(
          spacing: Spacing.md,
          children: [
            PhotoHero(photo: asset.icon, width: 100),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(text: asset.label, style: textTheme.titleMedium),
                AppText(
                  text: asset.currency.name.toUpperCase(),
                  style: textTheme.titleSmall,
                ),
              ],
            ),
          ],
        ),
        AppText(
          text: '${asset.balance} ${asset.currency.name.toUpperCase()}',
          style: textTheme.titleLarge,
        ),
      ],
    );
  }
}


            // CircleAvatar(
            //   radius: 25,
            //   child: PhotoHero(photo: asset.icon, width: 100),
            // )