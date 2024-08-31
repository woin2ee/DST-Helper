import 'package:dst_helper/models/v2/item/item.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'farm_plant_data.g.dart';

enum FarmPlantStyle {
  basic,
  dense,
  reverseDense,
}

@JsonSerializable()
class FarmPlantData {
  @visibleForTesting
  FarmPlantData({
    required this.plants,
    required this.farmPlantStyle,
    required this.countOfPlants,
  });

  List<Plant?> plants;
  final FarmPlantStyle farmPlantStyle;
  final int countOfPlants;

  /// (top) 3 : 3 : 3 (bottom)
  factory FarmPlantData.basic(
    Plant? c1,
    Plant? c2,
    Plant? c3,
    Plant? c4,
    Plant? c5,
    Plant? c6,
    Plant? c7,
    Plant? c8,
    Plant? c9,
  ) {
    return FarmPlantData(
      plants: [c1, c2, c3, c4, c5, c6, c7, c8, c9],
      farmPlantStyle: FarmPlantStyle.basic,
      countOfPlants: 9,
    );
  }

  /// (top) 2 : 3 : 2 : 3 (bottom)
  factory FarmPlantData.dense(
    Plant? c1,
    Plant? c2,
    Plant? c3,
    Plant? c4,
    Plant? c5,
    Plant? c6,
    Plant? c7,
    Plant? c8,
    Plant? c9,
    Plant? c10,
  ) {
    return FarmPlantData(
      plants: [c1, c2, c3, c4, c5, c6, c7, c8, c9, c10],
      farmPlantStyle: FarmPlantStyle.dense,
      countOfPlants: 10,
    );
  }

  /// (top) 3 : 2 : 3 : 2 (bottom)
  factory FarmPlantData.reverseDense(
    Plant? c1,
    Plant? c2,
    Plant? c3,
    Plant? c4,
    Plant? c5,
    Plant? c6,
    Plant? c7,
    Plant? c8,
    Plant? c9,
    Plant? c10,
  ) {
    return FarmPlantData(
      plants: [c1, c2, c3, c4, c5, c6, c7, c8, c9, c10],
      farmPlantStyle: FarmPlantStyle.reverseDense,
      countOfPlants: 10,
    );
  }

  factory FarmPlantData.empty(FarmPlantStyle farmPlantStyle) {
    final countOfPlants = switch (farmPlantStyle) {
      FarmPlantStyle.basic => 9,
      FarmPlantStyle.dense || FarmPlantStyle.reverseDense => 10,
    };
    return FarmPlantData(
      plants: List.filled(countOfPlants, null),
      farmPlantStyle: farmPlantStyle,
      countOfPlants: countOfPlants,
    );
  }

  factory FarmPlantData.basicWithPlants(List<Plant?> plants) {
    return FarmPlantData(
      plants: plants,
      farmPlantStyle: FarmPlantStyle.basic,
      countOfPlants: 9,
    );
  }

  factory FarmPlantData.fromJson(Map<String, dynamic> json) => _$FarmPlantDataFromJson(json);

  bool get hasBalancedNutrients => totalNutrient.equalsOfValue(Nutrient.zero());
  Nutrient get totalNutrient =>
      plants.fold(Nutrient.zero(), (partial, next) => partial + (next?.nutrient ?? Nutrient.zero()));

  Map<String, dynamic> toJson() => _$FarmPlantDataToJson(this);
}
