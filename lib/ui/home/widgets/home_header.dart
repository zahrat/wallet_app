import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_app/providers/wallet_provider.dart';
import 'package:wallet_app/ui/core/ui/index.dart';

class AnchorMenu {
  AnchorMenu({required this.label, required this.value});
  final String value;
  final String label;
}

class HomeHeader extends ConsumerStatefulWidget {
  const HomeHeader({
    super.key,
    required this.walletAddress,
    required this.onSelectWallet,
  });
  final String walletAddress;
  final void Function(String value) onSelectWallet;

  @override
  ConsumerState<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends ConsumerState<HomeHeader> {
  final items = [
    AnchorMenu(label: "wallet1", value: "data"),
    AnchorMenu(label: "wallet2", value: "wallet2"),
  ];
  AnchorMenu selectedValue = AnchorMenu(label: "wallet1", value: "wallet1");

  @override
  void initState() {
    final currentItem = ref.watch(walletFileNameProvider);
    setState(() {
      selectedValue = items.firstWhere((item) => item.value == currentItem);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const AppImage(imageUri: 'app_logo.png', width: 25, height: 25),
        Column(
          children: [
            AppAnchorMenu<AnchorMenu>(
              label: selectedValue.label,
              selectedValue: selectedValue,
              values: items,
              labelFor: (item) => item.label,
              onChanged: (item) {
                widget.onSelectWallet(item.value);
                setState(() {
                  selectedValue = item;
                });
              },
            ),
            // AppText(text: "Wallet 1", style: textTheme.titleSmall),
            AppText(text: widget.walletAddress, style: textTheme.bodySmall),
          ],
        ),
        const Icon(Icons.notifications_none_rounded),
      ],
    );
  }
}
