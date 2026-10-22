import 'package:flutter/material.dart';
import 'package:wallet_app/ui/core/theme/app_colors.dart';
import 'package:wallet_app/ui/core/theme/spacing.dart';
import 'package:wallet_app/ui/core/ui/index.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final AppColors appColors = Theme.of(context).extension<AppColors>()!;

    return Column(
      spacing: Spacing.xxl,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(text: "Profile", style: textTheme.headlineLarge),
            Icon(Icons.settings_outlined, color: appColors.grayIcon),
          ],
        ),
        Container(
          padding: EdgeInsets.all(Spacing.lg),

          decoration: BoxDecoration(
            border: BoxBorder.all(color: appColors.borderColor),
            borderRadius: BorderRadius.all(Radius.circular(Spacing.lg)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            spacing: Spacing.md,
            children: [
              CircleAvatar(
                backgroundColor: colorScheme.secondary,
                radius: 30,
                child: const Icon(Icons.account_balance_wallet),
              ),
              Column(
                children: [
                  AppText(text: "Account 1", style: textTheme.titleMedium),
                  AppText(text: "0x8A...42F1", style: textTheme.bodySmall),
                ],
              ),
              const Expanded(flex: 1, child: SizedBox()),
              Icon(Icons.copy_outlined, color: colorScheme.primary),
            ],
          ),
        ),
      ],
    );
  }
}
