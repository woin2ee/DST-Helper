import 'package:built_collection/built_collection.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../models/v1/season.dart';
import '../../../models/v2/item/categories.dart';
import '../../../models/v2/item/items.dart';
import '../farm_plant/farm_view_model.dart';

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
    required this.count,
    required List<FarmViewModel> farmViewModels,
  }) : _farmViewModels = farmViewModels;

  final FarmGroupType groupType;

  /// The number of farms in the group.
  final int count;

  List<FarmViewModel> _farmViewModels;

  /// The list of [FarmViewModel] in the group.
  ///
  /// Indexes are ordered as `top-left`, `top-right`, `bottom-left`, `bottom-right`.
  BuiltList<FarmViewModel> get farmViewModels => BuiltList(_farmViewModels);

  factory FarmGroupModel.single({required FarmViewModel farmViewModel}) {
    return FarmGroupModel(
      groupType: FarmGroupType.single,
      count: 1,
      farmViewModels: [farmViewModel],
    );
  }

  factory FarmGroupModel.double({
    required FarmViewModel left,
    required FarmViewModel right,
  }) {
    return FarmGroupModel(
      groupType: FarmGroupType.double,
      count: 2,
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
      count: 4,
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
        count == other.count &&
        listEquals(_farmViewModels, other._farmViewModels);
  }

  @override
  int get hashCode => Object.hash(
        groupType,
        count,
        farmViewModels,
      );

  FarmGroupModel copy() {
    return FarmGroupModel(
      groupType: groupType,
      count: count,
      farmViewModels: farmViewModels.map((e) => e.copyWith()).toList(),
    );
  }
}

class SampleFarmGroupModel {
  SampleFarmGroupModel._();

  static BuiltList<FarmGroupModel> get preDefinedList {
    return BuiltList.of([
      preDefined1,
      preDefined2,
      preDefined3,
      preDefined4,
      preDefined5,
      preDefined6,
      preDefined7,
      preDefined8,
      preDefined9,
      preDefined10,
      preDefined11,
      // preDefined12,
      // preDefined13,
      // preDefined14,
      // preDefined15,
      // preDefined16,
    ]);
  }

  static FarmGroupModel get preDefined1 {
    return FarmGroupModel.single(
      farmViewModel: FarmViewModel.basic(
        Items.potato,
        Items.potato,
        Items.potato,
        Items.potato,
        null,
        Items.tomaRoot,
        Items.tomaRoot,
        Items.tomaRoot,
        Items.tomaRoot,
      ),
    );
  }

  static FarmGroupModel get preDefined2 {
    return FarmGroupModel.double(
      left: FarmViewModel.basic(
        Items.dragonFruit,
        Items.dragonFruit,
        Items.dragonFruit,
        Items.tomaRoot,
        Items.tomaRoot,
        Items.tomaRoot,
        Items.tomaRoot,
        Items.tomaRoot,
        Items.tomaRoot,
      ),
      right: FarmViewModel.basic(
        Items.dragonFruit,
        Items.dragonFruit,
        Items.dragonFruit,
        Items.tomaRoot,
        Items.tomaRoot,
        Items.tomaRoot,
        Items.tomaRoot,
        Items.tomaRoot,
        Items.tomaRoot,
      ),
    );
  }

  static FarmGroupModel get preDefined3 {
    return FarmGroupModel.double(
      left: FarmViewModel.dense(
        Items.pumpkin,
        Items.garlic,
        Items.pumpkin,
        Items.pumpkin,
        Items.garlic,
        Items.pumpkin,
        Items.potato,
        Items.potato,
        Items.potato,
        Items.potato,
      ),
      right: FarmViewModel.reverseDense(
        Items.garlic,
        Items.pumpkin,
        Items.pumpkin,
        Items.garlic,
        Items.pumpkin,
        Items.potato,
        Items.potato,
        Items.pumpkin,
        Items.potato,
        Items.potato,
      ),
    );
  }

  static FarmGroupModel get preDefined4 {
    return FarmGroupModel.double(
      left: FarmViewModel.basic(
        Items.onion,
        Items.onion,
        Items.onion,
        Items.garlic,
        Items.garlic,
        Items.garlic,
        Items.dragonFruit,
        Items.dragonFruit,
        Items.dragonFruit,
      ),
      right: FarmViewModel.basic(
        Items.onion,
        Items.onion,
        Items.onion,
        Items.garlic,
        Items.garlic,
        Items.garlic,
        Items.dragonFruit,
        Items.dragonFruit,
        Items.dragonFruit,
      ),
    );
  }

  static FarmGroupModel get preDefined5 {
    return FarmGroupModel.double(
      left: FarmViewModel.basic(
        Items.onion,
        Items.onion,
        Items.onion,
        Items.watermelon,
        Items.watermelon,
        Items.watermelon,
        Items.watermelon,
        Items.watermelon,
        Items.watermelon,
      ),
      right: FarmViewModel.basic(
        Items.onion,
        Items.onion,
        Items.onion,
        Items.watermelon,
        Items.watermelon,
        Items.watermelon,
        Items.watermelon,
        Items.watermelon,
        Items.watermelon,
      ),
    );
  }

  static FarmGroupModel get preDefined6 {
    return FarmGroupModel.double(
      left: FarmViewModel.basic(
        Items.potato,
        Items.potato,
        Items.garlic,
        Items.potato,
        null,
        Items.garlic,
        Items.potato,
        Items.onion,
        Items.onion,
      ),
      right: FarmViewModel.basic(
        Items.garlic,
        Items.potato,
        Items.potato,
        Items.garlic,
        null,
        Items.potato,
        Items.onion,
        Items.onion,
        Items.potato,
      ),
    );
  }

  static FarmGroupModel get preDefined7 {
    return FarmGroupModel.double(
      left: FarmViewModel.basic(
        Items.asparagus,
        Items.asparagus,
        Items.asparagus,
        Items.potato,
        Items.potato,
        Items.potato,
        Items.pumpkin,
        Items.pumpkin,
        Items.pumpkin,
      ),
      right: FarmViewModel.basic(
        Items.asparagus,
        Items.asparagus,
        Items.asparagus,
        Items.potato,
        Items.potato,
        Items.potato,
        Items.pumpkin,
        Items.pumpkin,
        Items.pumpkin,
      ),
    );
  }

  static FarmGroupModel get preDefined8 {
    return FarmGroupModel.single(
      farmViewModel: FarmViewModel.basic(
        Items.watermelon,
        Items.watermelon,
        Items.watermelon,
        Items.watermelon,
        null,
        Items.carrot,
        Items.carrot,
        Items.carrot,
        Items.carrot,
      ),
    );
  }

  static FarmGroupModel get preDefined9 {
    return FarmGroupModel.single(
      farmViewModel: FarmViewModel.basic(
        Items.onion,
        Items.onion,
        Items.onion,
        Items.garlic,
        Items.garlic,
        Items.garlic,
        Items.pepper,
        Items.pepper,
        Items.pepper,
      ),
    );
  }

  static FarmGroupModel get preDefined10 {
    return FarmGroupModel.square(
      topLeft: FarmViewModel.basic(
        null,
        null,
        Items.potato,
        null,
        null,
        Items.potato,
        Items.pumpkin,
        Items.pumpkin,
        Items.garlic,
      ),
      topRight: FarmViewModel.basic(
        Items.potato,
        null,
        null,
        Items.potato,
        null,
        null,
        Items.garlic,
        Items.pumpkin,
        Items.pumpkin,
      ),
      bottomLeft: FarmViewModel.basic(
        Items.pumpkin,
        Items.pumpkin,
        Items.garlic,
        null,
        null,
        Items.potato,
        null,
        null,
        Items.potato,
      ),
      bottomRight: FarmViewModel.basic(
        Items.garlic,
        Items.pumpkin,
        Items.pumpkin,
        Items.potato,
        null,
        null,
        Items.potato,
        null,
        null,
      ),
    );
  }

  static FarmGroupModel get preDefined11 {
    return FarmGroupModel.square(
      topLeft: FarmViewModel.basic(
        Items.potato,
        Items.potato,
        Items.onion,
        Items.potato,
        Items.potato,
        Items.onion,
        Items.asparagus,
        Items.asparagus,
        Items.garlic,
      ),
      topRight: FarmViewModel.basic(
        Items.onion,
        Items.potato,
        Items.potato,
        Items.onion,
        Items.potato,
        Items.potato,
        Items.garlic,
        Items.asparagus,
        Items.asparagus,
      ),
      bottomLeft: FarmViewModel.basic(
        Items.asparagus,
        Items.asparagus,
        Items.garlic,
        Items.potato,
        Items.potato,
        Items.onion,
        Items.potato,
        Items.potato,
        Items.onion,
      ),
      bottomRight: FarmViewModel.basic(
        Items.garlic,
        Items.asparagus,
        Items.asparagus,
        Items.onion,
        Items.potato,
        Items.potato,
        Items.onion,
        Items.potato,
        Items.potato,
      ),
    );
  }
}
