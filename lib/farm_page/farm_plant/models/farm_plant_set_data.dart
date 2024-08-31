import 'package:dst_helper/farm_page/farm_plant/models/farm_plant_data.dart';
import 'package:dst_helper/models/v1/season.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'farm_plant_set_data.g.dart';

enum FarmPlantSetStyle {
  single,
  double,
  square;
}

@JsonSerializable()
class FarmPlantSetData {
  @visibleForTesting
  FarmPlantSetData({
    required this.farmPlantSetStyle,
    required this.farmPlantsCount,
    required this.farmPlantDataList,
  });

  final FarmPlantSetStyle farmPlantSetStyle;
  final int farmPlantsCount;
  List<FarmPlantData> farmPlantDataList;

  factory FarmPlantSetData.single({required FarmPlantData farmPlantData}) {
    return FarmPlantSetData(
      farmPlantSetStyle: FarmPlantSetStyle.single,
      farmPlantsCount: 1,
      farmPlantDataList: [farmPlantData],
    );
  }

  factory FarmPlantSetData.double({
    required FarmPlantData left,
    required FarmPlantData right,
  }) {
    return FarmPlantSetData(
      farmPlantSetStyle: FarmPlantSetStyle.double,
      farmPlantsCount: 2,
      farmPlantDataList: [left, right],
    );
  }

  factory FarmPlantSetData.square({
    required FarmPlantData topLeft,
    required FarmPlantData topRight,
    required FarmPlantData bottomLeft,
    required FarmPlantData bottomRight,
  }) {
    return FarmPlantSetData(
      farmPlantSetStyle: FarmPlantSetStyle.square,
      farmPlantsCount: 4,
      farmPlantDataList: [
        topLeft,
        topRight,
        bottomLeft,
        bottomRight,
      ],
    );
  }

  factory FarmPlantSetData.fromJson(Map<String, dynamic> json) => _$FarmPlantSetDataFromJson(json);

  Seasons get suitableSeasons {
    Seasons seasons = {
      Season.spring,
      Season.summer,
      Season.autumn,
      Season.winter,
    };
    for (final farmPlant in farmPlantDataList) {
      for (final plant in farmPlant.plants) {
        if (plant == null) continue;
        seasons = seasons.intersection(plant.seasons);
      }
    }
    return seasons;
  }

  Map<String, dynamic> toJson() => _$FarmPlantSetDataToJson(this);
}

// @freezed
// class FarmPlantSetData with _$FarmPlantSetData {
//   @visibleForTesting
//   const factory FarmPlantSetData({
//     required FarmPlantSetStyle farmPlantSetStyle,
//     required int farmPlantsCount,
//     required List<FarmPlantData> farmPlantDataList,
//   }) = _FarmPlantSetData;
//   const FarmPlantSetData._();

//   factory FarmPlantSetData.single({required FarmPlantData farmPlantData}) {
//     return FarmPlantSetData(
//       farmPlantSetStyle: FarmPlantSetStyle.single,
//       farmPlantsCount: 1,
//       farmPlantDataList: [farmPlantData],
//     );
//   }

//   factory FarmPlantSetData.double({
//     required FarmPlantData left,
//     required FarmPlantData right,
//   }) {
//     return FarmPlantSetData(
//       farmPlantSetStyle: FarmPlantSetStyle.double,
//       farmPlantsCount: 2,
//       farmPlantDataList: [left, right],
//     );
//   }

//   factory FarmPlantSetData.square({
//     required FarmPlantData topLeft,
//     required FarmPlantData topRight,
//     required FarmPlantData bottomLeft,
//     required FarmPlantData bottomRight,
//   }) {
//     return FarmPlantSetData(
//       farmPlantSetStyle: FarmPlantSetStyle.square,
//       farmPlantsCount: 4,
//       farmPlantDataList: [
//         topLeft,
//         topRight,
//         bottomLeft,
//         bottomRight,
//       ],
//     );
//   }

//   Seasons get suitableSeasons {
//     Seasons seasons = {
//       Season.spring,
//       Season.summer,
//       Season.autumn,
//       Season.winter,
//     };
//     for (final farmPlant in farmPlantDataList) {
//       for (final plant in farmPlant.plants) {
//         if (plant == null) continue;
//         seasons = seasons.intersection(plant.seasons);
//       }
//     }
//     return seasons;
//   }

//   factory FarmPlantSetData.fromJson(Map<String, dynamic> json) => _$FarmPlantSetDataFromJson(json);
// }
