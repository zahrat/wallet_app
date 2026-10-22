import 'package:flutter/material.dart';
import 'package:wallet_app/ui/core/theme/index.dart';

class RoundedCard extends StatelessWidget {
  const RoundedCard({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.cardPadding,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
      child: child,
    );
  }
}
