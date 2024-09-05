import 'package:dst_helper/farm_page/farm_list/farm_plant/farm_plant_model.dart';
import 'package:dst_helper/models/v1/season.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'farm_plant_set_model.g.dart';

enum FarmPlantSetStyle {
  single,
  double,
  square;
}

@JsonSerializable()
class FarmPlantSetModel extends ChangeNotifier {
  @visibleForTesting
  FarmPlantSetModel({
    required this.farmPlantSetStyle,
    required this.farmPlantsCount,
    required this.farmPlantModelList,
  });

  final FarmPlantSetStyle farmPlantSetStyle;
  final int farmPlantsCount;
  List<FarmPlantModel> farmPlantModelList;

  factory FarmPlantSetModel.single({required FarmPlantModel farmPlantModel}) {
    return FarmPlantSetModel(
      farmPlantSetStyle: FarmPlantSetStyle.single,
      farmPlantsCount: 1,
      farmPlantModelList: [farmPlantModel],
    );
  }

  factory FarmPlantSetModel.double({
    required FarmPlantModel left,
    required FarmPlantModel right,
  }) {
    return FarmPlantSetModel(
      farmPlantSetStyle: FarmPlantSetStyle.double,
      farmPlantsCount: 2,
      farmPlantModelList: [left, right],
    );
  }

  factory FarmPlantSetModel.square({
    required FarmPlantModel topLeft,
    required FarmPlantModel topRight,
    required FarmPlantModel bottomLeft,
    required FarmPlantModel bottomRight,
  }) {
    return FarmPlantSetModel(
      farmPlantSetStyle: FarmPlantSetStyle.square,
      farmPlantsCount: 4,
      farmPlantModelList: [
        topLeft,
        topRight,
        bottomLeft,
        bottomRight,
      ],
    );
  }

  Seasons get suitableSeasons {
    Seasons seasons = {
      Season.spring,
      Season.summer,
      Season.autumn,
      Season.winter,
    };
    for (final farmPlant in farmPlantModelList) {
      for (final plant in farmPlant.plantCellModels.map((e) => e.plant)) {
        if (plant == null) continue;
        seasons = seasons.intersection(plant.seasons);
      }
    }
    return seasons;
  }

  factory FarmPlantSetModel.fromJson(Map<String, dynamic> json) => _$FarmPlantSetModelFromJson(json);
  Map<String, dynamic> toJson() => _$FarmPlantSetModelToJson(this);

  @override
  bool operator ==(Object other) {
    return other is FarmPlantSetModel &&
        farmPlantSetStyle == other.farmPlantSetStyle &&
        farmPlantsCount == other.farmPlantsCount &&
        listEquals(farmPlantModelList, other.farmPlantModelList);
  }

  @override
  int get hashCode => Object.hash(
        farmPlantSetStyle,
        farmPlantsCount,
        farmPlantModelList,
      );
}
