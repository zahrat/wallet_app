import 'package:flutter/services.dart';

abstract interface class WalletService {
  Future<dynamic> fetchWalletInfo({String walletfile});
}

class WalletServiceImp implements WalletService {
  @override
  Future<dynamic> fetchWalletInfo({String walletfile = 'data'}) async {
    final response = await rootBundle.loadString(
      'assets/data/$walletfile.json',
    );
    return Future.delayed(Duration(seconds: 5), () => response);
  }
}
