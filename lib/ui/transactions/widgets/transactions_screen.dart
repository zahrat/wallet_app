import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_app/data/models/currency.dart';
import 'package:wallet_app/data/models/transaction.dart';
import 'package:wallet_app/ui/core/theme/index.dart';
import 'package:wallet_app/ui/core/ui/index.dart';
import 'package:wallet_app/ui/transactions/constants/sort_enum.dart';
import 'package:wallet_app/ui/transactions/constants/transaction_type_enum.dart';
import 'package:wallet_app/ui/transactions/view_models/transaction_view_model.dart';
import 'package:wallet_app/ui/transactions/widgets/sort_and_filter.dart';
import 'package:wallet_app/ui/transactions/widgets/tabs_header.dart';

class TransactionsScreen extends ConsumerStatefulWidget {
  const TransactionsScreen({super.key});
  final List<Transaction> transactions = const [];

  @override
  ConsumerState<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends ConsumerState<TransactionsScreen> {
  TransactionTypeEnum selectedTab = TransactionTypeEnum.all;
  Sort selectedSort = Sort.none;
  Currency? selectedAsset;
  @override
  Widget build(BuildContext context) {
    final wallet = ref.watch(transactionViewModelProvider);
    final getAssetBalance = ref
        .read(transactionViewModelProvider.notifier)
        .getAssetBalance;
    final transactions = ref
        .watch(transactionViewModelProvider.notifier)
        .getTransactions(selectedAsset, selectedSort, selectedTab);

    void onTap(TransactionTypeEnum type) {
      setState(() {
        selectedTab = type;
      });
    }

    return AppContainer(
      body: SingleChildScrollView(
        child: Column(
          spacing: Spacing.lg,
          children: [
            TabsHeader(selectedTab: selectedTab, onTap: onTap),
            const SizedBox(height: 8),
            SortAndFilter(
              selectedAsset: selectedAsset,
              onAssetChanged: (asset) {
                setState(() {
                  selectedAsset = asset;
                });
              },
              selectedSort: selectedSort,
              onSortTap: (sort) {
                setState(() {
                  selectedSort = Sort.values.byName(sort);
                });
              },
            ),
            TransactionList(
              transactions: transactions,
              walletAddress: wallet.value?.address ?? '',
              getAssetBalance: getAssetBalance,
              label: "Transactions",
            ),
          ],
        ),
      ),
    );
  }
}
