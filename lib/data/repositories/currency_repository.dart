import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_app/data/models/currency.dart';
import 'package:wallet_app/data/services/currency_service.dart';

final currencyRepositoryProvider = FutureProvider.family<double, Currency>((
  ref,
  currency,
) async {
  final price = switch (currency) {
    Currency.eth => await CurrencyService.fetchEthCurrentPrice(),
    Currency.btc => await CurrencyService.fetchBtcCurrentPrice(),
    Currency.usdt => await CurrencyService.fetchUsdtPrice(),
  };
  return price;
});
