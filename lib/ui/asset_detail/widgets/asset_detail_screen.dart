import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:wallet_app/data/models/asset.dart';
import 'package:wallet_app/data/repositories/currency_repository.dart';
import 'package:wallet_app/l10n/app_localizations.dart';
import 'package:wallet_app/ui/asset_detail/widgets/asset_detail_header.dart';
import 'package:wallet_app/ui/asset_detail/widgets/asset_info.dart';
import 'package:wallet_app/ui/core/theme/index.dart';
import 'package:wallet_app/ui/core/ui/index.dart';
import 'package:wallet_app/ui/transactions/view_models/transaction_view_model.dart';

class AssetDetailScreen extends ConsumerStatefulWidget {
  const AssetDetailScreen({super.key});

  @override
  ConsumerState<AssetDetailScreen> createState() => _AssetDetailScreenState();
}

class _AssetDetailScreenState extends ConsumerState<AssetDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final Asset asset = GoRouterState.of(context).extra! as Asset;
    final wallet = ref.watch(transactionViewModelProvider);
    final localizations = AppLocalizations.of(context);

    return AppContainer(
      pageTitle: localizations!.assetDetail,
      body: AsyncValueView(
        value: wallet,
        data: (loadedWallet) {
          final viewModel = ref.read(transactionViewModelProvider.notifier);
          final currencyProvider = ref.watch(
            currencyRepositoryProvider(asset.currency),
          );
          final getAssetBalance = viewModel.getAssetBalance;
          final transactions = viewModel.getTransactions(
            currency: asset.currency,
          );

          return SingleChildScrollView(
            child: Column(
              spacing: Spacing.xxl,
              children: [
                AssetDetailHeader(asset: asset),
                FutureBuilder(
                  future: getAssetBalance(asset.currency),
                  builder: ((context, snapshot) {
                    return AssetInfo(
                      balance: snapshot.hasData ? snapshot.data ?? 0 : 0,
                      currentPrice: currencyProvider.whenOrNull(),
                    );
                  }),
                ),
                TransactionList(
                  transactions: transactions,
                  walletAddress: loadedWallet.address,
                  getAssetBalance: getAssetBalance,
                  label: localizations!.transactions,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
