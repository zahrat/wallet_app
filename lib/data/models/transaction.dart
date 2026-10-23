import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wallet_app/data/models/currency.dart';
import 'package:wallet_app/data/models/status.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

@freezed
abstract class Transaction with _$Transaction {
  const factory Transaction({
    required String from,
    required String to,
    required Currency currency,
    required Status status,
    required int date,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
}
