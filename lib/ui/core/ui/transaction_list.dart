import 'package:flutter/material.dart';
import 'package:wallet_app/data/models/currency.dart';
import 'package:wallet_app/data/models/transaction.dart';
import 'package:wallet_app/l10n/app_localizations.dart';
import 'package:wallet_app/ui/core/theme/index.dart';
import 'package:wallet_app/ui/home/widgets/section_label.dart';

import '../../core/ui/index.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({
    super.key,
    required this.transactions,
    required this.walletAddress,
    required this.getAssetBalance,
    this.label,
    this.onSeeAll,
  });
  final List<Transaction> transactions;
  final String walletAddress;
  final double Function(Currency currency) getAssetBalance;
  final String? label;
  final void Function()? onSeeAll;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionLabel(
          label: label ?? localizations!.recentTransactions,
          onSeeAll: onSeeAll,
        ),
        RoundedCard(
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: transactions.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              final transaction = transactions[index];
              final isSent = transaction.from == walletAddress;
              final balance = getAssetBalance(transaction.currency);

              return TransactionItem(
                transaction: transaction,
                isSent: isSent,
                balance: balance,
              );
            },
          ),
        ),
      ],
    );
  }
}

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
    required this.transaction,
    required this.isSent,
    required this.balance,
  });

  final Transaction transaction;
  final bool isSent;
  final double balance;

  @override
  Widget build(BuildContext context) {
    final listItemStyles = Theme.of(context).extension<ListItemTextStyles>();

    return Row(
      spacing: Spacing.sm,
      children: [
        CircleAvatar(
          backgroundColor: isSent ? Colors.red[100] : Colors.green[100],
          child: Icon(
            Icons.arrow_outward,
            color: isSent ? Colors.red : Colors.green,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text:
                  "${isSent ? 'Sent' : 'Recieved'} ${transaction.currency.name.toUpperCase()}",
              style: listItemStyles!.listItemTitle,
            ),
            AppText(
              text: isSent
                  ? "To ${transaction.to}"
                  : "From ${transaction.from}",
              style: listItemStyles.listItemDescription,
            ),
          ],
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,

            children: [
              AppText(
                text:
                    "${isSent ? '-' : '+'}${transaction.value} ${transaction.currency.name.toUpperCase()}",
              ),
              AppText(
                text: "\$${balance.toStringAsFixed(2)}",
                style: TextStyle(color: Colors.blueGrey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
