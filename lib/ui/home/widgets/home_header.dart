import 'package:flutter/material.dart';
import 'package:wallet_app/ui/core/ui/index.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key, required this.walletAddress});
  final String walletAddress;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const AppImage(imageUri: 'app_logo.png', width: 25, height: 25),
        Column(
          children: [
            AppText(text: "Wallet 1", style: textTheme.titleSmall),
            AppText(text: walletAddress, style: textTheme.bodySmall),
          ],
        ),
        const Icon(Icons.notifications_none_rounded),
      ],
    );
  }
}
