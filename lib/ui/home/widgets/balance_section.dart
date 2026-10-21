import 'package:flutter/material.dart';
import 'package:wallet_app/ui/core/theme/spacing.dart';
import 'package:wallet_app/ui/core/ui/app_text.dart';

class BalanceSection extends StatelessWidget {
  const BalanceSection({super.key, required this.balance});
  final double balance;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            spacing: Spacing.sm,
            children: [
              AppText(text: "Total balance"),
              Icon(Icons.remove_red_eye_outlined, size: 15),
            ],
          ),
          AppText(
            text: '\$${balance.toString()}',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
