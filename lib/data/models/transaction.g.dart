// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Transaction _$TransactionFromJson(Map<String, dynamic> json) => _Transaction(
  from: json['from'] as String,
  to: json['to'] as String,
  currency: $enumDecode(_$CurrencyEnumMap, json['currency']),
  status: $enumDecode(_$StatusEnumMap, json['status']),
  date: (json['date'] as num).toInt(),
);

Map<String, dynamic> _$TransactionToJson(_Transaction instance) =>
    <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'currency': _$CurrencyEnumMap[instance.currency]!,
      'status': _$StatusEnumMap[instance.status]!,
      'date': instance.date,
    };

const _$CurrencyEnumMap = {
  Currency.eth: 'eth',
  Currency.btc: 'btc',
  Currency.usdt: 'usdt',
};

const _$StatusEnumMap = {
  Status.pending: 'pending',
  Status.completed: 'completed',
  Status.failed: 'failed',
};
