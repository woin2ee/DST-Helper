import 'package:dst_helper/farm_page/farm_list/models/farm_plant_set_model.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'farm_plant_card_model.g.dart';

@JsonSerializable()
class FarmPlantCardModel {
  FarmPlantCardModel({
    this.title,
    required this.farmPlantSetModel,
    bool favorite = false,
  }) : favorite = ValueNotifier(favorite);

  final String? title;
  final FarmPlantSetModel farmPlantSetModel;

  @BooleanValueNotifierConverter()
  final ValueNotifier<bool> favorite;

  FarmPlantCardModel copyWith(bool? favorite) {
    return FarmPlantCardModel(
      title: title,
      farmPlantSetModel: farmPlantSetModel,
      favorite: favorite ?? this.favorite.value,
    );
  
  }

  factory FarmPlantCardModel.fromJson(Map<String, dynamic> json) => _$FarmPlantCardModelFromJson(json);
  Map<String, dynamic> toJson() => _$FarmPlantCardModelToJson(this);

  @override
  bool operator ==(Object other) {
    return other is FarmPlantCardModel &&
        title == other.title &&
        farmPlantSetModel == other.farmPlantSetModel &&
        favorite == other.favorite;
  }

  @override
  int get hashCode => Object.hash(
        title,
        farmPlantSetModel,
        favorite,
      );
}

class BooleanValueNotifierConverter implements JsonConverter<ValueNotifier<bool>, bool> {
  const BooleanValueNotifierConverter();

  @override
  ValueNotifier<bool> fromJson(bool json) => ValueNotifier(json);

  @override
  bool toJson(ValueNotifier<bool> object) => object.value;
}
