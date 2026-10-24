import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_app/data/models/wallet_model.dart';
import 'package:wallet_app/data/repositories/wallet_repository.dart';

final walletProvider = FutureProvider<WalletModel>((ref) {
  return ref.watch(walletRepositoryProvider).getWalletInfo();
});
