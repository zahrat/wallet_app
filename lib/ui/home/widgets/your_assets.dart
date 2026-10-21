import 'package:flutter/material.dart';
import 'package:wallet_app/ui/core/theme/index.dart';
import 'package:wallet_app/ui/home/widgets/section_label.dart';

import '../../core/ui/index.dart';

class YourAssets extends StatelessWidget {
  const YourAssets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: Spacing.md,
      children: [
        const SectionLabel(label: "Your Assets"),
        Container(
          padding: AppPadding.cardPadding,
          decoration: RoundedCard.card,
          child: Row(
            spacing: Spacing.sm,
            children: [
              CircleAvatar(
                backgroundColor: Colors.blueAccent,
                child: Icon(Icons.zoom_out_sharp),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppText(
                    text: "Ethereum",
                    style: TextStyles.listItemTitle,
                  ),
                  const AppText(
                    text: "2.0 ETH",
                    style: TextStyles.listItemDescription,
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,

                  children: [
                    const AppText(text: "\$6,000.00"),
                    const AppText(
                      text: "+3.4%",
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.keyboard_arrow_right_outlined,
                color: Colors.blueGrey,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
