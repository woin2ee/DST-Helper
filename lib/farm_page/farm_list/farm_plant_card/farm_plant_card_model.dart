import 'package:dst_helper/farm_page/farm_list/farm_plant_set/farm_plant_set_model.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'farm_plant_card_model.g.dart';

enum CreateType {
  sample,
  userCustom,
}

@JsonSerializable()
class FarmPlantCardModel {
  FarmPlantCardModel({
    this.title,
    required this.farmPlantSetModel,
    bool favorite = false,
    required this.createType,
  }) : favorite = ValueNotifier(favorite);

  final String? title;
  final FarmPlantSetModel farmPlantSetModel;

  @BooleanValueNotifierConverter()
  final ValueNotifier<bool> favorite;

  final CreateType createType;

  FarmPlantCardModel copyWith(bool? favorite) {
    return FarmPlantCardModel(
      title: title,
      farmPlantSetModel: farmPlantSetModel,
      favorite: favorite ?? this.favorite.value,
      createType: createType,
    );
  }

  factory FarmPlantCardModel.fromJson(Map<String, dynamic> json) => _$FarmPlantCardModelFromJson(json);
  Map<String, dynamic> toJson() => _$FarmPlantCardModelToJson(this);

  @override
  bool operator ==(Object other) {
    return other is FarmPlantCardModel &&
        title == other.title &&
        farmPlantSetModel == other.farmPlantSetModel &&
        favorite.value == other.favorite.value &&
        createType == other.createType;
  }

  @override
  int get hashCode => Object.hash(
        title,
        farmPlantSetModel,
        favorite.value,
        createType,
      );
}

class BooleanValueNotifierConverter implements JsonConverter<ValueNotifier<bool>, bool> {
  const BooleanValueNotifierConverter();

  @override
  ValueNotifier<bool> fromJson(bool json) => ValueNotifier(json);

  @override
  bool toJson(ValueNotifier<bool> object) => object.value;
}
