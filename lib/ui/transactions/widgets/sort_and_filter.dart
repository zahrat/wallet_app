import 'package:flutter/material.dart';
import 'package:wallet_app/data/models/currency.dart';
import 'package:wallet_app/ui/core/theme/sort_and_filter_theme.dart';
import 'package:wallet_app/ui/transactions/constants/sort_enum.dart';

class SortAndFilter extends StatelessWidget {
  const SortAndFilter({
    super.key,
    required this.onSortTap,
    this.selectedSort = Sort.newest,
    this.selectedAsset,
    this.onAssetChanged,
  });

  final void Function(String sort) onSortTap;
  final Sort selectedSort;
  final Currency? selectedAsset;
  final void Function(Currency? asset)? onAssetChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _FilterMenu<Sort>(
          label: selectedSort.label,
          icon: Icons.swap_vert_rounded,
          selectedValue: selectedSort,
          values: Sort.values,
          labelFor: (sort) => sort.label,
          onChanged: (sort) => onSortTap(sort.name),
        ),
        _FilterMenu<Currency?>(
          label: selectedAsset?.name.toUpperCase() ?? 'All assets',
          icon: Icons.toll_rounded,
          selectedValue: selectedAsset,
          values: const [null, ...Currency.values],
          labelFor: (asset) => asset?.name.toUpperCase() ?? 'All assets',
          onChanged: onAssetChanged,
        ),
      ],
    );
  }
}

class _FilterMenu<T> extends StatelessWidget {
  const _FilterMenu({
    required this.label,
    required this.icon,
    required this.selectedValue,
    required this.values,
    required this.labelFor,
    this.onChanged,
    this.onOpen,
  });

  final String label;
  final IconData icon;
  final T selectedValue;
  final List<T> values;
  final String Function(T value) labelFor;
  final void Function(T value)? onChanged;
  final VoidCallback? onOpen;

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<SortAndFilterTheme>();

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
              Icon(icon, color: styles?.sortIconColor),
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
