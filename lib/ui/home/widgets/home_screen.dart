import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:wallet_app/l10n/app_localizations.dart';
import 'package:wallet_app/data/repositories/wallet_repository.dart';
import 'package:wallet_app/providers/total_balance_provider.dart';
import 'package:wallet_app/providers/wallet_provider.dart';
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
    final localization = AppLocalizations.of(context);
    final textTitleStyle = Theme.of(context).textTheme.titleMedium;

    final wallet = ref.watch(homeViewModelProvider);
    final getAssetBalance = ref
        .read(homeViewModelProvider.notifier)
        .getAssetBalance;
    final onWalletSelect = ref
        .read(homeViewModelProvider.notifier)
        .changeWalletFileName;
    final totalBalance = ref.watch(totalBalanceProvider);

    return AppContainer(
      body: SingleChildScrollView(
        child: AsyncValueView(
          value: wallet,
          onRetry: () {
            ref.read(walletRepositoryProvider).disableShowException();
            ref.invalidate(walletProvider);
            ref.invalidate(homeViewModelProvider);
          },
          loadWidget: Column(
            spacing: Spacing.lg,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              SpinKitFoldingCube(color: Colors.blue, size: 25),
              AppText(
                text: localization!.loadingWalletData,
                style: textTitleStyle,
              ),
            ],
          ),
          data: (wallet) => Column(
            spacing: Spacing.lg,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HomeHeader(
                walletAddress: wallet?.address ?? '',
                onSelectWallet: onWalletSelect,
              ),
              BalanceSection(balanceAsync: totalBalance),
              YourAssets(
                assets: wallet?.assets ?? [],
                getAssetBalance: getAssetBalance,
              ),
              TransactionList(
                transactions: wallet.transactions.isNotEmpty
                    ? wallet.transactions.take(3).toList()
                    : [],
                walletAddress: wallet?.address ?? '',
                getAssetBalance: getAssetBalance,
                onSeeAll: () => StatefulNavigationShell.of(context).goBranch(1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
