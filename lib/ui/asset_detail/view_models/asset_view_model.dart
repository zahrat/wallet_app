import 'package:wallet_app/data/models/currency.dart';
import 'package:wallet_app/data/services/currency_service.dart';

class AssetViewModel {
  static double getAssetPrice(Currency currency) {
    switch (currency) {
      case Currency.btc:
        return CurrencyService.fetchBtcCurrentPrice();
      case Currency.eth:
        return CurrencyService.fetchEthCurrentPrice();
      default:
        return CurrencyService.fetchUsdtPrice();
    }
  }
}
