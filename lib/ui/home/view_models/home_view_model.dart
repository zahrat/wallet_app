import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_app/data/models/wallet_model.dart';
import 'package:wallet_app/providers/wallet_provider.dart';

class HomeViewModel extends AsyncNotifier<WalletModel> {
  @override
  FutureOr<WalletModel> build() async {
    return ref.watch(walletProvider.future);
  }
}

final homeViewModelProvider = AsyncNotifierProvider<HomeViewModel, WalletModel>(
  HomeViewModel.new,
);
