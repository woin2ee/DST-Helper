import 'package:built_collection/built_collection.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../models/v1/season.dart';
import '../../../models/v2/item/categories.dart';
import '../farm_view/farm_view_model.dart';

part 'farm_group_model.g.dart';

enum FarmGroupType {
  single,
  double,
  square;
}

@JsonSerializable()
class FarmGroupModel extends ChangeNotifier {
  @visibleForTesting
  FarmGroupModel({
    required this.groupType,
    required this.farmCount,
    required List<FarmViewModel> farmViewModels,
  }) : _farmViewModels = farmViewModels;

  final FarmGroupType groupType;

  /// The number of farms in the group.
  final int farmCount;

  List<FarmViewModel> _farmViewModels;

  /// The list of [FarmViewModel] in the group.
  ///
  /// Indexes are ordered as `top-left`, `top-right`, `bottom-left`, `bottom-right`.
  BuiltList<FarmViewModel> get farmViewModels => BuiltList(_farmViewModels);

  factory FarmGroupModel.single({required FarmViewModel farmViewModel}) {
    return FarmGroupModel(
      groupType: FarmGroupType.single,
      farmCount: 1,
      farmViewModels: [farmViewModel],
    );
  }

  factory FarmGroupModel.double({
    required FarmViewModel left,
    required FarmViewModel right,
  }) {
    return FarmGroupModel(
      groupType: FarmGroupType.double,
      farmCount: 2,
      farmViewModels: [left, right],
    );
  }

  factory FarmGroupModel.square({
    required FarmViewModel topLeft,
    required FarmViewModel topRight,
    required FarmViewModel bottomLeft,
    required FarmViewModel bottomRight,
  }) {
    return FarmGroupModel(
      groupType: FarmGroupType.square,
      farmCount: 4,
      farmViewModels: [
        topLeft,
        topRight,
        bottomLeft,
        bottomRight,
      ],
    );
  }

  Seasons get suitableSeasons {
    if (!hasAnyPlant) return {};
    Seasons seasons = {
      Season.spring,
      Season.summer,
      Season.autumn,
      Season.winter,
    };
    for (final farm in farmViewModels) {
      for (final plant in farm.plantCellModels.map((e) => e.plant)) {
        if (plant == null) continue;
        seasons = seasons.intersection(plant.seasons);
      }
    }
    return seasons;
  }

  bool get hasAnyPlant {
    return farmViewModels.any((model) => model.plants.any((plant) => plant != null));
  }

  bool get hasBalancedNutrients {
    return farmViewModels.every((model) => model.hasBalancedNutrients);
  }

  void setPlant(Plant? plant, {required int farmIndex, required int plantIndex}) {
    farmViewModels[farmIndex].plantCellModels[plantIndex].plant = plant;
    notifyListeners();
  }

  factory FarmGroupModel.fromJson(Map<String, dynamic> json) => _$FarmGroupModelFromJson(json);
  Map<String, dynamic> toJson() => _$FarmGroupModelToJson(this);

  @override
  bool operator ==(Object other) {
    return other is FarmGroupModel &&
        groupType == other.groupType &&
        farmCount == other.farmCount &&
        listEquals(_farmViewModels, other._farmViewModels);
  }

  @override
  int get hashCode => Object.hash(
        groupType,
        farmCount,
        farmViewModels,
      );

  FarmGroupModel copy() {
    return FarmGroupModel(
      groupType: groupType,
      farmCount: farmCount,
      farmViewModels: farmViewModels.map((e) => e.copyWith()).toList(),
    );
  }
}
