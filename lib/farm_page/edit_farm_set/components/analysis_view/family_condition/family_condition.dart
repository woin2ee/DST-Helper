import 'package:flutter/material.dart';

import '../../../../../models/v2/item/categories.dart';
import '../../../../../utils/union_find.dart';
import '../../../../farm_grid/farm_group/farm_group_model.dart';
import '../../../../farm_grid/farm_view/farm_view_model.dart';
import 'basic_farm_family_condition.dart';
import 'dense_farm_family_condition.dart';

mixin PlantData {
  Plant? get plant;
}

abstract class FamilyCondition {
  @visibleForTesting
  const FamilyCondition({
    required this.farmGroupModel,
  });

  factory FamilyCondition.withModel(FarmGroupModel model) {
    final farmType = model.farmViewModels[0].farmType;
    switch (farmType) {
      case FarmType.basic:
        return BasicFarmFamilyCondition.withModel(model);
      case FarmType.dense || FarmType.reverseDense:
        return DenseFarmFamilyCondition.withModel(model);
    }
  }

  static const requiredCount = 4;

  final FarmGroupModel farmGroupModel;

  bool get isSatisfied;

  Map<T, int> countByRoot<T extends PlantData>(List<T> elements, UnionFind<T> unionFind) {
    final Map<T, int> countByRoot = {};
    for (final element in elements) {
      final root = unionFind.find(element);
      if (root.plant != null) {
        countByRoot.update(root, (value) => value + 1, ifAbsent: () => 1);
      }
    }
    return countByRoot;
  }
}
