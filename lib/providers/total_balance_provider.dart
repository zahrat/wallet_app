import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_app/data/models/currency.dart';
import 'package:wallet_app/data/services/currency_service.dart';
import 'package:wallet_app/providers/wallet_provider.dart';

final totalBalanceProvider = Provider<AsyncValue<double>>((ref) {
  return ref.watch(walletProvider).whenData((wallet) {
    var totalBalance = 0.0;
    wallet.assets.forEach((asset) {
      final price = switch (asset.currency) {
        Currency.eth => CurrencyService.fetchEthCurrentPrice(),
        Currency.btc => CurrencyService.fetchBtcCurrentPrice(),
        Currency.usdt => CurrencyService.fetchUsdtPrice(),
      };

      totalBalance += asset.balance * price;
    });
    return totalBalance;
  });
});
