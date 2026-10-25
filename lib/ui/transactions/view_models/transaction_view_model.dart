import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_app/data/models/asset.dart';
import 'package:wallet_app/data/models/currency.dart';
import 'package:wallet_app/data/models/transaction.dart';
import 'package:wallet_app/data/models/wallet_model.dart';
import 'package:wallet_app/data/services/currency_service.dart';
import 'package:wallet_app/providers/wallet_provider.dart';
import 'package:wallet_app/ui/transactions/constants/sort_enum.dart';
import 'package:wallet_app/ui/transactions/constants/transaction_type_enum.dart';

class TransactionViewModel extends AsyncNotifier<WalletModel> {
  @override
  FutureOr<WalletModel> build() async {
    final wallet = await ref.watch(walletProvider.future);
    return wallet;
  }

  FutureOr<List<Asset>?> getAssets() async {
    return state.value?.assets ?? [];
  }

  List<Transaction> getTransactions({
    Currency? currency,
    Sort? sort,
    TransactionTypeEnum? type,
  }) {
    var transactions = state.value?.transactions ?? [];
    var sortedTransactions = List<Transaction>.from(transactions);

    if (sort != Sort.none) {
      sortedTransactions.sort(
        (a, b) => sort == Sort.newest
            ? a.date.compareTo(b.date)
            : b.date.compareTo(a.date),
      );
    }

    if (currency != null) {
      sortedTransactions = sortedTransactions
          .where((transaction) => transaction.currency == currency)
          .toList();
    }

    if (type != null && type != TransactionTypeEnum.all) {
      sortedTransactions = sortedTransactions
          .where(
            (transaction) => type == TransactionTypeEnum.recieve
                ? transaction.to == state.value?.address
                : transaction.from == state.value?.address,
          )
          .toList();
    }
    return sortedTransactions;
  }

  double getAssetBalance(Currency currency) {
    final wallet = state.value;
    if (wallet == null) {
      throw Exception('Wallet not loaded');
    }

    final asset = wallet.assets.firstWhere(
      (asset) => asset.currency == currency,
      orElse: () => throw Exception('Asset not found'),
    );
    switch (currency) {
      case Currency.eth:
        return asset.balance * CurrencyService.fetchEthCurrentPrice();
      case Currency.btc:
        return asset.balance * CurrencyService.fetchBtcCurrentPrice();
      case Currency.usdt:
        return asset.balance * CurrencyService.fetchUsdtPrice();
    }
  }
}

final transactionViewModelProvider =
    AsyncNotifierProvider<TransactionViewModel, WalletModel>(
      TransactionViewModel.new,
    );
