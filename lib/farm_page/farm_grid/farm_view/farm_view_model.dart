import 'dart:collection';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../l10n/l10ns.dart';
import '../../../models/v2/item/categories.dart';
import '../../../models/v2/item/nutrient.dart';
import '../plant_cell/plant_cell_model.dart';

part 'farm_view_model.g.dart';

enum FarmType {
  basic,
  dense,
  reverseDense;

  String localizedName(BuildContext context) {
    switch (this) {
      case FarmType.basic:
        return L10ns.of(context).localized('basic');
      case FarmType.dense:
        return L10ns.of(context).localized('dense');
      case FarmType.reverseDense:
        return L10ns.of(context).localized('reverse_dense');
    }
  }
}

@JsonSerializable()
class FarmViewModel extends ChangeNotifier {
  @visibleForTesting
  FarmViewModel({
    required List<PlantCellModel> plantCellModels,
    required this.farmType,
    required this.plantCount,
  }) : _plantCellModels = plantCellModels;

  /// (top) 3 : 3 : 3 (bottom)
  factory FarmViewModel.basic(
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
    return FarmViewModel(
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
      farmType: FarmType.basic,
      plantCount: 9,
    );
  }

  /// (top) 2 : 3 : 2 : 3 (bottom)
  factory FarmViewModel.dense(
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
    return FarmViewModel(
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
      farmType: FarmType.dense,
      plantCount: 10,
    );
  }

  /// (top) 3 : 2 : 3 : 2 (bottom)
  factory FarmViewModel.reverseDense(
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
    return FarmViewModel(
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
      farmType: FarmType.reverseDense,
      plantCount: 10,
    );
  }

  factory FarmViewModel.empty(FarmType farmType, {bool darkTheme = false}) {
    final plantCount = switch (farmType) {
      FarmType.basic => 9,
      FarmType.dense || FarmType.reverseDense => 10,
    };
    return FarmViewModel(
      plantCellModels: List.generate(plantCount, (_) => PlantCellModel(plant: null, darkTheme: darkTheme)),
      farmType: farmType,
      plantCount: plantCount,
    );
  }

  factory FarmViewModel.basicWithPlants(List<Plant?> plants, {bool darkTheme = false}) {
    assert(plants.length == 9);
    return FarmViewModel(
      plantCellModels: plants.map((plant) => PlantCellModel(plant: plant, darkTheme: darkTheme)).toList(),
      farmType: FarmType.basic,
      plantCount: 9,
    );
  }

  final List<PlantCellModel> _plantCellModels;
  BuiltList<PlantCellModel> get plantCellModels => BuiltList(_plantCellModels);

  final FarmType farmType;

  final int plantCount;

  bool get hasBalancedNutrients => totalNutrient == Nutrient.zero();
  Nutrient get totalNutrient => _plantCellModels
      .map((e) => e.plant)
      .fold(Nutrient.zero(), (partial, next) => partial + (next?.nutrient ?? Nutrient.zero()));
  UnmodifiableListView<Plant?> get plants => UnmodifiableListView(_plantCellModels.map((model) => model.plant));

  void setPlant(Plant? plant, {required int index}) {
    assert(index <= _plantCellModels.length);
    _plantCellModels[index].plant = plant;
  }

  FarmViewModel copyWith({
    FarmType? farmType,
    bool? darkTheme,
  }) {
    return FarmViewModel(
      plantCellModels: _plantCellModels.map((model) => model.copyWith(darkTheme: darkTheme)).toList(),
      farmType: farmType ?? this.farmType,
      plantCount: plantCount,
    );
  }

  factory FarmViewModel.fromJson(Map<String, dynamic> json) => _$FarmViewModelFromJson(json);
  Map<String, dynamic> toJson() => _$FarmViewModelToJson(this);

  @override
  bool operator ==(Object other) {
    return other is FarmViewModel &&
        other.runtimeType == runtimeType &&
        listEquals(other._plantCellModels, _plantCellModels) &&
        other.farmType == farmType &&
        other.plantCount == plantCount;
  }

  @override
  int get hashCode => Object.hash(
        _plantCellModels,
        farmType,
        plantCount,
      );

  FarmViewModel get reversed {
    switch (farmType) {
      case FarmType.basic:
        return this;
      case FarmType.dense:
        return copyWith(farmType: FarmType.reverseDense);
      case FarmType.reverseDense:
        return copyWith(farmType: FarmType.dense);
    }
  }
}
