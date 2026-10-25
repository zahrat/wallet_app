import 'package:flutter/material.dart';
import 'package:wallet_app/l10n/app_localizations.dart';
import 'package:wallet_app/ui/core/theme/spacing.dart';
import 'package:wallet_app/ui/core/ui/index.dart';
import 'package:wallet_app/ui/transactions/constants/transaction_type_enum.dart';

class TabsHeader extends StatelessWidget {
  const TabsHeader({super.key, required this.selectedTab, required this.onTap});
  final TransactionTypeEnum selectedTab;
  final void Function(TransactionTypeEnum type) onTap;

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);

    return Row(
      spacing: Spacing.sm,
      children: [
        TabItem(
          text: appLocalizations?.all,
          selectedTab: selectedTab,
          type: TransactionTypeEnum.all,
          onTap: onTap,
        ),
        TabItem(
          text: appLocalizations?.recieve,
          selectedTab: selectedTab,
          type: TransactionTypeEnum.recieve,
          onTap: onTap,
        ),
        TabItem(
          text: appLocalizations?.send,
          selectedTab: selectedTab,
          type: TransactionTypeEnum.send,
          onTap: onTap,
        ),
      ],
    );
  }
}

class TabItem extends StatelessWidget {
  const TabItem({
    super.key,
    required this.text,
    required this.selectedTab,
    required this.type,
    required this.onTap,
  });

  final String? text;
  final TransactionTypeEnum selectedTab;
  final TransactionTypeEnum type;
  final void Function(TransactionTypeEnum type) onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Expanded(
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
        decoration: BoxDecoration(
          color: selectedTab.name == type.name
              ? const Color.fromARGB(128, 222, 221, 221)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: AppTextButton(
          text: text,
          style: textTheme.titleMedium,
          onTap: () => onTap(type),
        ),
      ),
    );
  }
}
