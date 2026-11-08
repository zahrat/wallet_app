import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_app/data/models/currency.dart';
import 'package:wallet_app/data/services/currency_service.dart';

final currencyRepositoryProvider = Provider<CurrencyRepository>((ref) {
  return CurrencyRepository();
});

class CurrencyRepository {
  CurrencyRepository();

  FutureOr<double> fetchCurryncyPrice(Currency currency) async {
    final price = switch (currency) {
      Currency.eth => await CurrencyService.fetchEthCurrentPrice(),
      Currency.btc => await CurrencyService.fetchBtcCurrentPrice(),
      Currency.usdt => await CurrencyService.fetchUsdtPrice(),
    };
    return price;
  }
}
