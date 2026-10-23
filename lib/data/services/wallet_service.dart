import 'package:flutter/services.dart';

abstract interface class WalletService {
  Future<dynamic> fetchWalletInfo();
}

class WalletServiceImp implements WalletService {
  @override
  Future<dynamic> fetchWalletInfo() async {
    final response = await rootBundle.loadString('assets/data/data.json');
    return response;
  }
}
