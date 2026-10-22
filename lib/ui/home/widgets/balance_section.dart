import 'package:flutter/material.dart';
import 'package:wallet_app/ui/core/theme/index.dart';
import 'package:wallet_app/ui/core/ui/app_text.dart';

class BalanceSection extends StatelessWidget {
  const BalanceSection({super.key, required this.balance});
  final double balance;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: AppPadding.cardPadding,
      decoration: RoundedCard.card,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: Spacing.sm,
            children: [
              AppText(text: "Total balance", style: textTheme.titleMedium),
              const Icon(Icons.remove_red_eye_outlined, size: 15),
            ],
          ),
          AppText(text: '\$${balance.toString()}', style: textTheme.titleLarge),
        ],
      ),
    );
  }
}
