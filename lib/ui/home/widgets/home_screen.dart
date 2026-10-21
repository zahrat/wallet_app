import 'package:flutter/material.dart';
import 'package:wallet_app/ui/core/theme/spacing.dart';
import 'package:wallet_app/ui/core/ui/app_container.dart';
import 'package:wallet_app/ui/home/widgets/balance_section.dart';
import 'package:wallet_app/ui/home/widgets/home_header.dart';
import 'package:wallet_app/ui/home/widgets/recent_transactions.dart';
import 'package:wallet_app/ui/home/widgets/your_assets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppContainer(
      body: SingleChildScrollView(
        child: Column(
          spacing: Spacing.lg,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HomeHeader(walletAddress: "0x12345678901234"),
            BalanceSection(balance: 170000),
            YourAssets(),
            RecentTransactions(),
          ],
        ),
      ),
    );
  }
}
