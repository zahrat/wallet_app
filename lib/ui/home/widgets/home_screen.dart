import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:wallet_app/providers/total_balance_provider.dart';
import 'package:wallet_app/ui/core/theme/spacing.dart';
import 'package:wallet_app/ui/core/ui/index.dart';
import 'package:wallet_app/ui/home/view_models/home_view_model.dart';
import 'package:wallet_app/ui/home/widgets/balance_section.dart';
import 'package:wallet_app/ui/home/widgets/home_header.dart';
import 'package:wallet_app/ui/home/widgets/your_assets.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wallet = ref.watch(homeViewModelProvider);

    final getAssetBalance = ref
        .read(homeViewModelProvider.notifier)
        .getAssetBalance;
    final totalBalance = ref.watch(totalBalanceProvider);

    return AppContainer(
      body: SingleChildScrollView(
        child: Column(
          spacing: Spacing.lg,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HomeHeader(walletAddress: wallet.value?.address ?? ''),
            AsyncValueView<double>(
              value: totalBalance,
              data: (balance) => BalanceSection(balance: balance),
            ),
            YourAssets(
              assets: wallet.value?.assets ?? [],
              getAssetBalance: getAssetBalance,
            ),
            TransactionList(
              transactions: wallet.value?.transactions?.sublist(0, 3) ?? [],
              walletAddress: wallet.value?.address ?? '',
              getAssetBalance: getAssetBalance,
              onSeeAll: () => context.go('home/transactions'),
            ),
          ],
        ),
      ),
    );
  }
}
