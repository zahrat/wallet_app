class CurrencyService {
  static Future<double> fetchEthCurrentPrice() {
    return Future.delayed(Duration(seconds: 5), () => 2700);
  }

  static Future<double> fetchBtcCurrentPrice() {
    return Future.delayed(Duration(seconds: 5), () => 85000);
  }

  static Future<double> fetchUsdtPrice() {
    return Future.delayed(Duration(seconds: 5), () => 0.9999);
  }
}
