import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:wallet_app/data/models/asset.dart';
import 'package:wallet_app/data/services/currency_service.dart';
import 'package:wallet_app/l10n/app_localizations.dart';
import 'package:wallet_app/ui/asset_detail/view_models/asset_view_model.dart';
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
    final getAssetBalance = ref
        .read(transactionViewModelProvider.notifier)
        .getAssetBalance;
    final balance = getAssetBalance(asset.currency);
    final transactions = ref
        .watch(transactionViewModelProvider.notifier)
        .getTransactions(currency: asset.currency);

    final localizations = AppLocalizations.of(context);

    return AppContainer(
      body: SingleChildScrollView(
        child: Column(
          spacing: Spacing.xxl,
          children: [
            AssetDetailHeader(asset: asset),
            AssetInfo(
              balance: balance,
              currentPrice: AssetViewModel.getAssetPrice(asset.currency),
            ),
            TransactionList(
              transactions: transactions,
              walletAddress: wallet?.value?.address ?? '',
              getAssetBalance: getAssetBalance,
              label: localizations!.transactions,
            ),
          ],
        ),
      ),
    );
  }
}
