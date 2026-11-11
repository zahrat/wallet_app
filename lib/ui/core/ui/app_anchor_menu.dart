import 'package:flutter/material.dart';
import 'package:wallet_app/ui/core/theme/anchor_menu_theme.dart';

class AppAnchorMenu<T> extends StatelessWidget {
  const AppAnchorMenu({
    required this.label,
    this.icon,
    required this.selectedValue,
    required this.values,
    required this.labelFor,
    this.onChanged,
    this.onOpen,
    super.key,
  });
  final String label;
  final IconData? icon;
  final T selectedValue;
  final List<T> values;
  final String Function(T value) labelFor;
  final void Function(T value)? onChanged;
  final VoidCallback? onOpen;

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AnchorMenuTheme>();

    return MenuAnchor(
      style: styles?.menuStyle,
      menuChildren: [
        for (final value in values)
          MenuItemButton(
            style: selectedValue == value
                ? styles?.selectedItemStyle
                : styles?.itemStyle,
            trailingIcon: selectedValue == value
                ? const Icon(Icons.check_rounded)
                : const SizedBox(width: 18),
            onPressed: onChanged == null ? null : () => onChanged!(value),
            child: Text(labelFor(value)),
          ),
      ],
      builder: (context, controller, child) {
        return TextButton(
          style: styles?.buttonStyle,
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              onOpen?.call();
              controller.open();
            }
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) Icon(icon, color: styles?.sortIconColor),
              const SizedBox(width: 8),
              Text(label),
              const SizedBox(width: 8),
              const Icon(Icons.keyboard_arrow_down_rounded),
            ],
          ),
        );
      },
    );
  }
}
