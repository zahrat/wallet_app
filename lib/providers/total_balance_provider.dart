import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_app/data/repositories/currency_repository.dart';
import 'package:wallet_app/providers/wallet_provider.dart';

final totalBalanceProvider = FutureProvider<double>((ref) async {
  final wallet = await ref.watch(walletProvider.future);

  var totalBalance = 0.0;
  final assets = wallet.assets;
  if (assets.isEmpty) return 0;
  for (final asset in assets) {
    final price = await ref.watch(
      currencyRepositoryProvider(asset.currency).future,
    );

    totalBalance += asset.balance * price;
  }

  return totalBalance;
});
