import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_app/data/models/wallet_model.dart';
import 'package:wallet_app/data/services/wallet_service.dart';

class WalletRepository {
  WalletRepository(this._walletService);

  final WalletService _walletService;
  bool _showException = true;

  Future<WalletModel> getWalletInfo(String fileName) async {
    final response = await _walletService.fetchWalletInfo(walletfile: fileName);
    final walletmodel = WalletModel.fromJson(jsonDecode(response));
    if (_showException) {
      throw Exception('not found');
    } else {
      return walletmodel;
    }
  }

  void disableShowException() {
    _showException = false;
  }
}

final walletRepositoryProvider = Provider<WalletRepository>((ref) {
  final walletService = WalletServiceImp();

  return WalletRepository(walletService);
});
