import 'package:flutter/material.dart';
import 'package:wallet_app/ui/core/ui/index.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({super.key, this.text = '', this.style, this.onTap});
  final String? text;
  final TextStyle? style;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: AppText(text: text ?? '', style: style),
      ),
    );
  }
}
