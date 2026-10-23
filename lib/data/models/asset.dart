import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wallet_app/data/models/currency.dart';

part 'asset.freezed.dart';
part 'asset.g.dart';

@freezed
abstract class Asset with _$Asset {
  const factory Asset({required Currency currency, required double balance}) =
      _Asset;

  factory Asset.fromJson(Map<String, dynamic> json) => _$AssetFromJson(json);
}
