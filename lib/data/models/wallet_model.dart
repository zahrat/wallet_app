import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wallet_app/data/models/asset.dart';
import 'package:wallet_app/data/models/transaction.dart';

part 'wallet_model.freezed.dart';
part 'wallet_model.g.dart';

@freezed
abstract class WalletModel with _$WalletModel {
  const factory WalletModel({
    required String address,
    required List<Asset> assets,
    required List<Transaction> transactions,
  }) = _WalletModel;

  factory WalletModel.fromJson(Map<String, dynamic> json) =>
      _$WalletModelFromJson(json);
}
