import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_app/data/models/asset.dart';
import 'package:wallet_app/data/models/currency.dart';
import 'package:wallet_app/data/models/wallet_model.dart';
import 'package:wallet_app/providers/total_balance_provider.dart';
import 'package:wallet_app/providers/wallet_provider.dart';

void main() {
  group("totalBalanceProvider", () {
    test('is total balance calculated correctly', () async {
      final wallet = WalletModel(
        address: '0x123',
        assets: [
          const Asset(
            currency: Currency.eth,
            balance: 2,
            label: 'Ethereum',
            icon: 'eth',
          ),
          const Asset(
            currency: Currency.btc,
            balance: 0.5,
            label: 'Bitcoin',
            icon: 'btc',
          ),
          const Asset(
            currency: Currency.usdt,
            balance: 100,
            label: 'Tether',
            icon: 'usdt',
          ),
        ],
        transactions: [],
      );

      final container = ProviderContainer(
        overrides: [walletProvider.overrideWith((ref) async => wallet)],
      );
      addTearDown(container.dispose);

      await container.read(walletProvider.future);

      final result = container.read(totalBalanceProvider);
      expect(result, isA<AsyncData<double>>());
      expect(result.requireValue, closeTo(47999.99, 0.001));
    });

    test(
      'is totalBalance equal zero with empty assets and transactions',
      () async {
        final wallet = WalletModel(
          address: '0x1234',
          assets: [],
          transactions: [],
        );

        final container = ProviderContainer(
          overrides: [walletProvider.overrideWith(((ref) => wallet))],
        );
        addTearDown(container.dispose);

        await container.read(walletProvider.future);
        final result = container.read(totalBalanceProvider);

        expect(result.requireValue, equals(0));
      },
    );
  });
}
