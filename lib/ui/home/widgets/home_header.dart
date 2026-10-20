import 'package:flutter/material.dart';
import 'package:wallet_app/ui/core/ui/index.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key, required this.walletAddress});
  final String walletAddress;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const AppImage(imageUri: 'app_logo.png', width: 25, height: 25),
        Column(
          children: [
            const AppText(
              text: "Wallet 1",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            AppText(
              text: walletAddress,
              style: const TextStyle(color: Colors.blueGrey),
            ),
          ],
        ),
        const Icon(Icons.notifications_none_rounded),
      ],
    );
  }
}
