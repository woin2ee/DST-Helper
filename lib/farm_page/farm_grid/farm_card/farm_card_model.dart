import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../../models/v2/item/categories.dart';
import '../farm_group/farm_group_model.dart';

part 'farm_card_model.freezed.dart';
part 'farm_card_model.g.dart';

enum CreateType {
  sample,
  userCustom,
}

@JsonSerializable()
class FarmCardModel extends ChangeNotifier {
  @visibleForTesting
  FarmCardModel({
    required this.id,
    required this.title,
    required this.farmGroupModel,
    required this.isFavorited,
    required this.createType,
    required bool isHidden,
    required this.linkedFertilizer,
  }) : _isHidden = isHidden;

  factory FarmCardModel.create({
    String? title,
    required FarmGroupModel farmGroupModel,
    required CreateType createType,
    required LinkedFertilizer? linkedFertilizer,
  }) {
    return FarmCardModel(
      id: const Uuid().v4(),
      title: title,
      farmGroupModel: farmGroupModel,
      createType: createType,
      isHidden: false,
      isFavorited: ValueNotifier(false),
      linkedFertilizer: linkedFertilizer,
    );
  }

  final String id;

  final String? title;

  final FarmGroupModel farmGroupModel;

  @BooleanValueNotifierConverter()
  final ValueNotifier<bool> isFavorited;

  final CreateType createType;

  bool _isHidden;
  bool get isHidden => _isHidden;
  set isHidden(bool value) {
    _isHidden = value;
    notifyListeners();
  }

  final LinkedFertilizer? linkedFertilizer;

  factory FarmCardModel.fromJson(Map<String, dynamic> json) => _$FarmCardModelFromJson(json);
  Map<String, dynamic> toJson() => _$FarmCardModelToJson(this);

  FarmCardModel copyWith({
    String? id,
    String? title,
    FarmGroupModel? farmGroupModel,
    bool? isFavorited,
    CreateType? createType,
    bool? isHidden,
    LinkedFertilizer? Function()? linkedFertilizer,
  }) {
    return FarmCardModel(
      id: id ?? this.id,
      title: title ?? this.title,
      farmGroupModel: farmGroupModel ?? this.farmGroupModel.copy(),
      isFavorited: isFavorited != null ? ValueNotifier(isFavorited) : ValueNotifier(this.isFavorited.value),
      createType: createType ?? this.createType,
      isHidden: isHidden ?? this.isHidden,
      linkedFertilizer: linkedFertilizer != null ? linkedFertilizer() : this.linkedFertilizer,
    );
  }
}

@freezed
class LinkedFertilizer with _$LinkedFertilizer {
  const factory LinkedFertilizer({
    required Fertilizer fertilizer,
    required int amount,
  }) = _LinkedFertilizer;

  factory LinkedFertilizer.fromJson(Map<String, dynamic> json) => _$LinkedFertilizerFromJson(json);
}

class BooleanValueNotifierConverter implements JsonConverter<ValueNotifier<bool>, bool> {
  const BooleanValueNotifierConverter();

  @override
  ValueNotifier<bool> fromJson(bool json) => ValueNotifier(json);

  @override
  bool toJson(ValueNotifier<bool> object) => object.value;
}
