import 'package:flutter/material.dart';
import 'package:wallet_app/ui/core/ui/index.dart';

enum ButtonTypes { error, normal }

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.text = '',
    this.style,
    this.onTap,
    this.type = ButtonTypes.error,
  });
  final String? text;
  final TextStyle? style;
  final VoidCallback? onTap;
  final ButtonTypes? type;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final bgColor = type == ButtonTypes.error
        ? Theme.of(context).colorScheme.error
        : Theme.of(context).colorScheme.primary;

    double screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onTap,

      child: Ink(
        width: screenWidth * 0.5,
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Center(
          child: AppText(
            text: text ?? '',
            style: style ?? textTheme.titleSmall!.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
