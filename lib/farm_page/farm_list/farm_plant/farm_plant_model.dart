import 'dart:collection';

import 'package:built_collection/built_collection.dart';
import 'package:dst_helper/farm_page/farm_list/plant_cell/plant_cell_model.dart';
import 'package:dst_helper/localization/text_localizations.dart';
import 'package:dst_helper/models/v2/item/categories.dart';
import 'package:dst_helper/models/v2/item/nutrient.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'farm_plant_model.g.dart';

enum FarmPlantStyle {
  basic,
  dense,
  reverseDense;

  String localizedName(BuildContext context) {
    switch (this) {
      case FarmPlantStyle.basic:
        return TextLocalizations.of(context)!.localized('basic');
      case FarmPlantStyle.dense:
        return TextLocalizations.of(context)!.localized('dense');
      case FarmPlantStyle.reverseDense:
        return TextLocalizations.of(context)!.localized('reverse_dense');
    }
  }
}

@JsonSerializable()
class FarmPlantModel extends ChangeNotifier {
  @visibleForTesting
  FarmPlantModel({
    required List<PlantCellModel> plantCellModels,
    required this.farmPlantStyle,
    required this.countOfPlants,
  }) : _plantCellModels = plantCellModels;

  /// (top) 3 : 3 : 3 (bottom)
  factory FarmPlantModel.basic(
    Plant? c1,
    Plant? c2,
    Plant? c3,
    Plant? c4,
    Plant? c5,
    Plant? c6,
    Plant? c7,
    Plant? c8,
    Plant? c9, {
    bool darkTheme = false,
  }) {
    return FarmPlantModel(
      plantCellModels: [
        PlantCellModel(plant: c1, darkTheme: darkTheme),
        PlantCellModel(plant: c2, darkTheme: darkTheme),
        PlantCellModel(plant: c3, darkTheme: darkTheme),
        PlantCellModel(plant: c4, darkTheme: darkTheme),
        PlantCellModel(plant: c5, darkTheme: darkTheme),
        PlantCellModel(plant: c6, darkTheme: darkTheme),
        PlantCellModel(plant: c7, darkTheme: darkTheme),
        PlantCellModel(plant: c8, darkTheme: darkTheme),
        PlantCellModel(plant: c9, darkTheme: darkTheme),
      ],
      farmPlantStyle: FarmPlantStyle.basic,
      countOfPlants: 9,
    );
  }

  /// (top) 2 : 3 : 2 : 3 (bottom)
  factory FarmPlantModel.dense(
    Plant? c1,
    Plant? c2,
    Plant? c3,
    Plant? c4,
    Plant? c5,
    Plant? c6,
    Plant? c7,
    Plant? c8,
    Plant? c9,
    Plant? c10, {
    bool darkTheme = false,
  }) {
    return FarmPlantModel(
      plantCellModels: [
        PlantCellModel(plant: c1, darkTheme: darkTheme),
        PlantCellModel(plant: c2, darkTheme: darkTheme),
        PlantCellModel(plant: c3, darkTheme: darkTheme),
        PlantCellModel(plant: c4, darkTheme: darkTheme),
        PlantCellModel(plant: c5, darkTheme: darkTheme),
        PlantCellModel(plant: c6, darkTheme: darkTheme),
        PlantCellModel(plant: c7, darkTheme: darkTheme),
        PlantCellModel(plant: c8, darkTheme: darkTheme),
        PlantCellModel(plant: c9, darkTheme: darkTheme),
        PlantCellModel(plant: c10, darkTheme: darkTheme),
      ],
      farmPlantStyle: FarmPlantStyle.dense,
      countOfPlants: 10,
    );
  }

  /// (top) 3 : 2 : 3 : 2 (bottom)
  factory FarmPlantModel.reverseDense(
    Plant? c1,
    Plant? c2,
    Plant? c3,
    Plant? c4,
    Plant? c5,
    Plant? c6,
    Plant? c7,
    Plant? c8,
    Plant? c9,
    Plant? c10, {
    bool darkTheme = false,
  }) {
    return FarmPlantModel(
      plantCellModels: [
        PlantCellModel(plant: c1, darkTheme: darkTheme),
        PlantCellModel(plant: c2, darkTheme: darkTheme),
        PlantCellModel(plant: c3, darkTheme: darkTheme),
        PlantCellModel(plant: c4, darkTheme: darkTheme),
        PlantCellModel(plant: c5, darkTheme: darkTheme),
        PlantCellModel(plant: c6, darkTheme: darkTheme),
        PlantCellModel(plant: c7, darkTheme: darkTheme),
        PlantCellModel(plant: c8, darkTheme: darkTheme),
        PlantCellModel(plant: c9, darkTheme: darkTheme),
        PlantCellModel(plant: c10, darkTheme: darkTheme),
      ],
      farmPlantStyle: FarmPlantStyle.reverseDense,
      countOfPlants: 10,
    );
  }

  factory FarmPlantModel.empty(FarmPlantStyle farmPlantStyle, {bool darkTheme = false}) {
    final countOfPlants = switch (farmPlantStyle) {
      FarmPlantStyle.basic => 9,
      FarmPlantStyle.dense || FarmPlantStyle.reverseDense => 10,
    };
    return FarmPlantModel(
      plantCellModels: List.generate(countOfPlants, (_) => PlantCellModel(plant: null, darkTheme: darkTheme)),
      farmPlantStyle: farmPlantStyle,
      countOfPlants: countOfPlants,
    );
  }

  factory FarmPlantModel.basicWithPlants(List<Plant?> plants, {bool darkTheme = false}) {
    assert(plants.length == 9);
    return FarmPlantModel(
      plantCellModels: plants.map((plant) => PlantCellModel(plant: plant, darkTheme: darkTheme)).toList(),
      farmPlantStyle: FarmPlantStyle.basic,
      countOfPlants: 9,
    );
  }

  final List<PlantCellModel> _plantCellModels;
  BuiltList<PlantCellModel> get plantCellModels => BuiltList(_plantCellModels);

  final FarmPlantStyle farmPlantStyle;

  final int countOfPlants;

  bool get hasBalancedNutrients => totalNutrient.equalsOfValue(Nutrient.zero());
  Nutrient get totalNutrient => _plantCellModels
      .map((e) => e.plant)
      .fold(Nutrient.zero(), (partial, next) => partial + (next?.nutrient ?? Nutrient.zero()));
  UnmodifiableListView<Plant?> get plants => UnmodifiableListView(_plantCellModels.map((model) => model.plant));

  void setPlant(Plant? plant, {required int index}) {
    assert(index <= _plantCellModels.length);
    _plantCellModels[index].plant = plant;
  }

  FarmPlantModel copyWith({bool? darkTheme}) {
    return FarmPlantModel(
      plantCellModels: _plantCellModels.map((model) => model.copyWith(darkTheme: darkTheme)).toList(),
      farmPlantStyle: farmPlantStyle,
      countOfPlants: countOfPlants,
    );
  }

  factory FarmPlantModel.fromJson(Map<String, dynamic> json) => _$FarmPlantModelFromJson(json);
  Map<String, dynamic> toJson() => _$FarmPlantModelToJson(this);

  @override
  bool operator ==(Object other) {
    return other is FarmPlantModel &&
        other.runtimeType == runtimeType &&
        listEquals(other._plantCellModels, _plantCellModels) &&
        other.farmPlantStyle == farmPlantStyle &&
        other.countOfPlants == countOfPlants;
  }

  @override
  int get hashCode => Object.hash(
        _plantCellModels,
        farmPlantStyle,
        countOfPlants,
      );
}
