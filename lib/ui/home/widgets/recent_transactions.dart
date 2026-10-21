import 'package:flutter/material.dart';
import 'package:wallet_app/ui/core/theme/index.dart';
import 'package:wallet_app/ui/home/widgets/section_label.dart';

import '../../core/ui/index.dart';

class RecentTransactions extends StatelessWidget {
  const RecentTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionLabel(label: "Recent Transactions"),
        Container(
          padding: AppPadding.cardPadding,
          decoration: RoundedCard.card,
          child: Row(
            spacing: Spacing.sm,
            children: [
              CircleAvatar(
                backgroundColor: Colors.red[100],
                child: Icon(Icons.arrow_outward, color: Colors.red),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppText(
                    text: "Sent Btc",
                    style: TextStyles.listItemTitle,
                  ),
                  const AppText(
                    text: "To 0x122222",
                    style: TextStyles.listItemDescription,
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,

                  children: [
                    const AppText(text: "-0.01BTC"),
                    const AppText(
                      text: "\$900.00",
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
