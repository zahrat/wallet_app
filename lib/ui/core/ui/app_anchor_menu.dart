import 'package:flutter/material.dart';
import 'package:wallet_app/ui/core/theme/anchor_menu_theme.dart';

class AppAnchorMenu<T> extends StatefulWidget {
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
  State<AppAnchorMenu<T>> createState() => _AppAnchorMenuState<T>();
}

class _AppAnchorMenuState<T> extends State<AppAnchorMenu<T>> {
  IconData arrow = (Icons.keyboard_arrow_down_rounded);

  void _animate() {
    setState(() {
      arrow = arrow == Icons.keyboard_arrow_down_rounded
          ? Icons.keyboard_arrow_up_rounded
          : Icons.keyboard_arrow_down_rounded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AnchorMenuTheme>();

    return MenuAnchor(
      style: styles?.menuStyle,
      menuChildren: [
        for (final value in widget.values)
          MenuItemButton(
            style: widget.selectedValue == value
                ? styles?.selectedItemStyle
                : styles?.itemStyle,
            trailingIcon: widget.selectedValue == value
                ? const Icon(Icons.check_rounded)
                : const SizedBox(width: 18),
            onPressed: widget.onChanged == null
                ? null
                : () => widget.onChanged!(value),
            child: Text(widget.labelFor(value)),
          ),
      ],
      builder: (context, controller, child) {
        return TextButton(
          style: styles?.buttonStyle,
          onPressed: () {
            _animate();
            if (controller.isOpen) {
              controller.close();
            } else {
              widget.onOpen?.call();
              controller.open();
            }
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null)
                Icon(widget.icon, color: styles?.sortIconColor),
              const SizedBox(width: 8),
              Text(widget.label),
              const SizedBox(width: 8),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 4000),
                child: Icon(arrow),
              ),
            ],
          ),
        );
      },
    );
  }
}
