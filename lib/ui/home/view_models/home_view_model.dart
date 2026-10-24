import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_app/data/models/asset.dart';
import 'package:wallet_app/data/models/currency.dart';
import 'package:wallet_app/data/models/wallet_model.dart';
import 'package:wallet_app/data/services/currency_service.dart';
import 'package:wallet_app/providers/wallet_provider.dart';

class HomeViewModel extends AsyncNotifier<WalletModel> {
  @override
  FutureOr<WalletModel> build() async {
    final wallet = await ref.watch(walletProvider.future);
    return wallet;
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

final homeViewModelProvider = AsyncNotifierProvider<HomeViewModel, WalletModel>(
  HomeViewModel.new,
);
