import 'package:flutter/material.dart';
import 'package:wallet_app/ui/core/theme/app_colors.dart';
import 'package:wallet_app/ui/core/theme/index.dart';
import 'package:wallet_app/ui/core/theme/rounded_view_theme.dart';

class RoundedCard extends StatelessWidget {
  const RoundedCard({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final bgColor = Theme.of(context).extension<AppColors>()!.secondView;

    return Container(
      padding: AppPadding.cardPadding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: bgColor,
      ),
      child: child,
    );
  }
}
