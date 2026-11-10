import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_app/data/models/currency.dart';
import 'package:wallet_app/data/models/wallet_model.dart';
import 'package:wallet_app/data/repositories/currency_repository.dart';
import 'package:wallet_app/providers/wallet_provider.dart';

class HomeViewModel extends AsyncNotifier<WalletModel> {
  @override
  FutureOr<WalletModel> build() async {
    final wallet = await ref.watch(walletProvider.future);
    return wallet;
  }

  Future<double> getAssetBalance(Currency currency) async {
    final wallet = state.value;
    if (wallet == null) {
      throw Exception('Wallet not loaded');
    }

    final asset = wallet.assets.firstWhere(
      (asset) => asset.currency == currency,
      orElse: () => throw Exception('Asset not found'),
    );

    final currencyPrice = await ref.watch(
      currencyRepositoryProvider(currency).future,
    );

    return asset.balance * currencyPrice;
  }
}

final homeViewModelProvider = AsyncNotifierProvider<HomeViewModel, WalletModel>(
  HomeViewModel.new,
);
