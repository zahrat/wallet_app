import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_app/data/models/wallet_model.dart';
import 'package:wallet_app/data/services/wallet_service.dart';

class WalletRepository {
  WalletRepository(this._walletService);
  final WalletService _walletService;

  Future<WalletModel> getWalletInfo() async {
    final response = await _walletService.fetchWalletInfo();
    final walletmodel = WalletModel.fromJson(jsonDecode(response));

    return walletmodel;
  }
}

final walletRepositoryProvider = Provider<WalletRepository>((ref) {
  final walletService = WalletServiceImp();

  return WalletRepository(walletService);
});
