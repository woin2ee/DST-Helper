import 'package:dst_helper/farm_page/farm_plant/models/farm_plant_set_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'farm_plant_card_model.g.dart';

@JsonSerializable()
class FarmPlantCardModel {
  const FarmPlantCardModel({
    this.title,
    required this.farmPlantSetModel,
    this.favorite = false,
  });

  final String? title;
  final FarmPlantSetModel farmPlantSetModel;
  final bool favorite;

  factory FarmPlantCardModel.fromJson(Map<String, dynamic> json) => _$FarmPlantCardModelFromJson(json);
  Map<String, dynamic> toJson() => _$FarmPlantCardModelToJson(this);
}
