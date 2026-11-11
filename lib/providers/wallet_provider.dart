import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_app/data/models/wallet_model.dart';
import 'package:wallet_app/data/repositories/wallet_repository.dart';

class WalletFileNameNotifier extends Notifier<String> {
  @override
  String build() => 'data';

  void select(String fileName) {
    state = fileName;
  }
}

final walletFileNameProvider = NotifierProvider<WalletFileNameNotifier, String>(
  WalletFileNameNotifier.new,
);

final walletProvider = FutureProvider<WalletModel>((ref) {
  final fileName = ref.watch(walletFileNameProvider);
  return ref.watch(walletRepositoryProvider).getWalletInfo(fileName);
});
