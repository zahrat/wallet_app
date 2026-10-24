// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Asset _$AssetFromJson(Map<String, dynamic> json) => _Asset(
  currency: $enumDecode(_$CurrencyEnumMap, json['currency']),
  balance: (json['balance'] as num).toDouble(),
  icon: json['icon'] as String,
);

Map<String, dynamic> _$AssetToJson(_Asset instance) => <String, dynamic>{
  'currency': _$CurrencyEnumMap[instance.currency]!,
  'balance': instance.balance,
  'icon': instance.icon,
};

const _$CurrencyEnumMap = {
  Currency.eth: 'eth',
  Currency.btc: 'btc',
  Currency.usdt: 'usdt',
};
