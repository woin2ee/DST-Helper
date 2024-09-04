import 'package:dst_helper/farm_page/farm_list/models/plant_cell_model.dart';
import 'package:dst_helper/models/v2/item/categories.dart';
import 'package:dst_helper/models/v2/item/nutrient.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'farm_plant_model.g.dart';

enum FarmPlantStyle {
  basic,
  dense,
  reverseDense,
}

@JsonSerializable()
class FarmPlantModel extends ChangeNotifier {
  @visibleForTesting
  FarmPlantModel({
    required this.plantCellModels,
    required this.farmPlantStyle,
    required this.countOfPlants,
  });

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
    Plant? c9,
  ) {
    return FarmPlantModel(
      plantCellModels: [
        PlantCellModel(plant: c1),
        PlantCellModel(plant: c2),
        PlantCellModel(plant: c3),
        PlantCellModel(plant: c4),
        PlantCellModel(plant: c5),
        PlantCellModel(plant: c6),
        PlantCellModel(plant: c7),
        PlantCellModel(plant: c8),
        PlantCellModel(plant: c9),
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
    Plant? c10,
  ) {
    return FarmPlantModel(
      plantCellModels: [
        PlantCellModel(plant: c1),
        PlantCellModel(plant: c2),
        PlantCellModel(plant: c3),
        PlantCellModel(plant: c4),
        PlantCellModel(plant: c5),
        PlantCellModel(plant: c6),
        PlantCellModel(plant: c7),
        PlantCellModel(plant: c8),
        PlantCellModel(plant: c9),
        PlantCellModel(plant: c10),
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
    Plant? c10,
  ) {
    return FarmPlantModel(
      plantCellModels: [
        PlantCellModel(plant: c1),
        PlantCellModel(plant: c2),
        PlantCellModel(plant: c3),
        PlantCellModel(plant: c4),
        PlantCellModel(plant: c5),
        PlantCellModel(plant: c6),
        PlantCellModel(plant: c7),
        PlantCellModel(plant: c8),
        PlantCellModel(plant: c9),
        PlantCellModel(plant: c10),
      ],
      farmPlantStyle: FarmPlantStyle.reverseDense,
      countOfPlants: 10,
    );
  }

  factory FarmPlantModel.empty(FarmPlantStyle farmPlantStyle) {
    final countOfPlants = switch (farmPlantStyle) {
      FarmPlantStyle.basic => 9,
      FarmPlantStyle.dense || FarmPlantStyle.reverseDense => 10,
    };
    return FarmPlantModel(
      plantCellModels: List.filled(countOfPlants, PlantCellModel(plant: null)),
      farmPlantStyle: farmPlantStyle,
      countOfPlants: countOfPlants,
    );
  }

  factory FarmPlantModel.basicWithPlants(List<Plant?> plants) {
    return FarmPlantModel(
      plantCellModels: plants.map((plant) => PlantCellModel(plant: plant)).toList(),
      farmPlantStyle: FarmPlantStyle.basic,
      countOfPlants: 9,
    );
  }

  final List<PlantCellModel> plantCellModels;
  final FarmPlantStyle farmPlantStyle;
  final int countOfPlants;

  bool get hasBalancedNutrients => totalNutrient.equalsOfValue(Nutrient.zero());
  Nutrient get totalNutrient => plantCellModels
      .map((e) => e.plant)
      .fold(Nutrient.zero(), (partial, next) => partial + (next?.nutrient ?? Nutrient.zero()));
  List<Plant?> get plants => plantCellModels.map((model) => model.plant).toList();

  void setPlant(Plant? plant, {required int index}) {
    assert(index <= plantCellModels.length);
    plantCellModels[index].plant = plant;
  }

  FarmPlantModel copyWith({bool? darkTheme}) {
    return FarmPlantModel(
      plantCellModels: plantCellModels.map((model) => model.copyWith(darkTheme: darkTheme)).toList(),
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
        listEquals(other.plantCellModels, plantCellModels) &&
        other.farmPlantStyle == farmPlantStyle &&
        other.countOfPlants == countOfPlants;
  }

  @override
  int get hashCode => Object.hash(
        plantCellModels,
        farmPlantStyle,
        countOfPlants,
      );
}
