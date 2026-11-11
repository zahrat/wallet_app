import 'package:flutter/material.dart';
import 'package:wallet_app/data/models/currency.dart';
import 'package:wallet_app/ui/core/ui/index.dart';
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
        AppAnchorMenu<Sort>(
          label: selectedSort.label,
          icon: Icons.swap_vert_rounded,
          selectedValue: selectedSort,
          values: Sort.values,
          labelFor: (sort) => sort.label,
          onChanged: (sort) => onSortTap(sort.name),
        ),
        AppAnchorMenu<Currency?>(
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
