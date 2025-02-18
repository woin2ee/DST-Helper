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

  int get plantCount {
    switch (this) {
      case FarmType.basic:
        return 9;
      case FarmType.dense:
      case FarmType.reverseDense:
        return 10;
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

  /// {@template dst_helper/farm_page/farm_grid/farm_view/farm_view_model/basic}
  /// (top) 3 : 3 : 3 (bottom)
  ///
  /// ```
  /// -------------------
  /// |  0  |  1  |  2  |
  /// -------------------
  /// |  3  |  4  |  5  |
  /// -------------------
  /// |  6  |  7  |  8  |
  /// -------------------
  /// ```
  /// {@endtemplate}
  factory FarmViewModel.basic(
    Plant? p0,
    Plant? p1,
    Plant? p2,
    Plant? p3,
    Plant? p4,
    Plant? p5,
    Plant? p6,
    Plant? p7,
    Plant? p8, {
    bool darkTheme = false,
  }) {
    return FarmViewModel(
      plantCellModels: [
        PlantCellModel(plant: p0, darkTheme: darkTheme),
        PlantCellModel(plant: p1, darkTheme: darkTheme),
        PlantCellModel(plant: p2, darkTheme: darkTheme),
        PlantCellModel(plant: p3, darkTheme: darkTheme),
        PlantCellModel(plant: p4, darkTheme: darkTheme),
        PlantCellModel(plant: p5, darkTheme: darkTheme),
        PlantCellModel(plant: p6, darkTheme: darkTheme),
        PlantCellModel(plant: p7, darkTheme: darkTheme),
        PlantCellModel(plant: p8, darkTheme: darkTheme),
      ],
      farmType: FarmType.basic,
      plantCount: 9,
    );
  }

  /// {@macro dst_helper/farm_page/farm_grid/farm_view/farm_view_model/basic}
  factory FarmViewModel.basicWithTable(
    List<Plant?> p012,
    List<Plant?> p345,
    List<Plant?> p678, {
    bool darkTheme = false,
  }) {
    assert(p012.length == 3 && p345.length == 3 && p678.length == 3);
    return FarmViewModel(
      plantCellModels: [
        PlantCellModel(plant: p012[0], darkTheme: darkTheme),
        PlantCellModel(plant: p012[1], darkTheme: darkTheme),
        PlantCellModel(plant: p012[2], darkTheme: darkTheme),
        PlantCellModel(plant: p345[0], darkTheme: darkTheme),
        PlantCellModel(plant: p345[1], darkTheme: darkTheme),
        PlantCellModel(plant: p345[2], darkTheme: darkTheme),
        PlantCellModel(plant: p678[0], darkTheme: darkTheme),
        PlantCellModel(plant: p678[1], darkTheme: darkTheme),
        PlantCellModel(plant: p678[2], darkTheme: darkTheme),
      ],
      farmType: FarmType.basic,
      plantCount: 9,
    );
  }

  /// {@template dst_helper/farm_page/farm_grid/farm_view/farm_view_model/dense}
  /// (top) 2 : 3 : 2 : 3 (bottom)
  ///
  /// ```
  /// -------------------
  /// |   0    |    1   |
  /// -------------------
  /// |  2  |  3  |  4  |
  /// -------------------
  /// |   5    |    6   |
  /// -------------------
  /// |  7  |  8  |  9  |
  /// -------------------
  /// ```
  /// {@endtemplate}
  factory FarmViewModel.dense(
    Plant? p0,
    Plant? p1,
    Plant? p2,
    Plant? p3,
    Plant? p4,
    Plant? p5,
    Plant? p6,
    Plant? p7,
    Plant? p8,
    Plant? p9, {
    bool darkTheme = false,
  }) {
    return FarmViewModel(
      plantCellModels: [
        PlantCellModel(plant: p0, darkTheme: darkTheme),
        PlantCellModel(plant: p1, darkTheme: darkTheme),
        PlantCellModel(plant: p2, darkTheme: darkTheme),
        PlantCellModel(plant: p3, darkTheme: darkTheme),
        PlantCellModel(plant: p4, darkTheme: darkTheme),
        PlantCellModel(plant: p5, darkTheme: darkTheme),
        PlantCellModel(plant: p6, darkTheme: darkTheme),
        PlantCellModel(plant: p7, darkTheme: darkTheme),
        PlantCellModel(plant: p8, darkTheme: darkTheme),
        PlantCellModel(plant: p9, darkTheme: darkTheme),
      ],
      farmType: FarmType.dense,
      plantCount: 10,
    );
  }

  /// {@macro dst_helper/farm_page/farm_grid/farm_view/farm_view_model/dense}
  factory FarmViewModel.denseWithTable(
    List<Plant?> p01,
    List<Plant?> p234,
    List<Plant?> p56,
    List<Plant?> p789, {
    bool darkTheme = false,
  }) {
    assert(p01.length == 2 && p234.length == 3 && p56.length == 2 && p789.length == 3);
    return FarmViewModel(
      plantCellModels: [
        PlantCellModel(plant: p01[0], darkTheme: darkTheme),
        PlantCellModel(plant: p01[1], darkTheme: darkTheme),
        PlantCellModel(plant: p234[0], darkTheme: darkTheme),
        PlantCellModel(plant: p234[1], darkTheme: darkTheme),
        PlantCellModel(plant: p234[2], darkTheme: darkTheme),
        PlantCellModel(plant: p56[0], darkTheme: darkTheme),
        PlantCellModel(plant: p56[1], darkTheme: darkTheme),
        PlantCellModel(plant: p789[0], darkTheme: darkTheme),
        PlantCellModel(plant: p789[1], darkTheme: darkTheme),
        PlantCellModel(plant: p789[2], darkTheme: darkTheme),
      ],
      farmType: FarmType.dense,
      plantCount: 10,
    );
  }

  /// {@template dst_helper/farm_page/farm_grid/farm_view/farm_view_model/reverse_dense}
  /// (top) 3 : 2 : 3 : 2 (bottom)
  ///
  /// ```
  /// -------------------
  /// |  0  |  1  |  2  |
  /// -------------------
  /// |   3    |    4   |
  /// -------------------
  /// |  5  |  6  |  7  |
  /// -------------------
  /// |   8    |   9    |
  /// -------------------
  /// ```
  /// {@endtemplate}
  factory FarmViewModel.reverseDense(
    Plant? p0,
    Plant? p1,
    Plant? p2,
    Plant? p3,
    Plant? p4,
    Plant? p5,
    Plant? p6,
    Plant? p7,
    Plant? p8,
    Plant? p9, {
    bool darkTheme = false,
  }) {
    return FarmViewModel(
      plantCellModels: [
        PlantCellModel(plant: p0, darkTheme: darkTheme),
        PlantCellModel(plant: p1, darkTheme: darkTheme),
        PlantCellModel(plant: p2, darkTheme: darkTheme),
        PlantCellModel(plant: p3, darkTheme: darkTheme),
        PlantCellModel(plant: p4, darkTheme: darkTheme),
        PlantCellModel(plant: p5, darkTheme: darkTheme),
        PlantCellModel(plant: p6, darkTheme: darkTheme),
        PlantCellModel(plant: p7, darkTheme: darkTheme),
        PlantCellModel(plant: p8, darkTheme: darkTheme),
        PlantCellModel(plant: p9, darkTheme: darkTheme),
      ],
      farmType: FarmType.reverseDense,
      plantCount: 10,
    );
  }

  /// {@macro dst_helper/farm_page/farm_grid/farm_view/farm_view_model/reverse_dense}
  factory FarmViewModel.reverseDenseWithTable(
    List<Plant?> p012,
    List<Plant?> p34,
    List<Plant?> p567,
    List<Plant?> p89, {
    bool darkTheme = false,
  }) {
    assert(p012.length == 3 && p34.length == 2 && p567.length == 3 && p89.length == 2);
    return FarmViewModel(
      plantCellModels: [
        PlantCellModel(plant: p012[0], darkTheme: darkTheme),
        PlantCellModel(plant: p012[1], darkTheme: darkTheme),
        PlantCellModel(plant: p012[2], darkTheme: darkTheme),
        PlantCellModel(plant: p34[0], darkTheme: darkTheme),
        PlantCellModel(plant: p34[1], darkTheme: darkTheme),
        PlantCellModel(plant: p567[0], darkTheme: darkTheme),
        PlantCellModel(plant: p567[1], darkTheme: darkTheme),
        PlantCellModel(plant: p567[2], darkTheme: darkTheme),
        PlantCellModel(plant: p89[0], darkTheme: darkTheme),
        PlantCellModel(plant: p89[1], darkTheme: darkTheme),
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
