// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

import '../../../../../models/v2/item/categories.dart';
import '../../../../../utils/union_find.dart';
import '../../../../farm_grid/farm_group/farm_group_model.dart';
import '../../../../farm_grid/farm_view/farm_view_model.dart';
import 'family_condition.dart';

typedef AdjacencyList = List<List<int>>;

class _PlantNode with PlantData {
  _PlantNode({
    required this.id,
    this.plant,
  });

  final int id;

  @override
  final Plant? plant;
}

class DenseFarmFamilyCondition extends FamilyCondition {
  DenseFarmFamilyCondition.withModel(
    FarmGroupModel farmGroupModel,
  )   : assert((farmGroupModel.farmViewModels[0].farmType != FarmType.basic) &&
            (farmGroupModel.groupType != FarmGroupType.square)),
        super(farmGroupModel: farmGroupModel);

  static const Map<(FarmGroupType, FarmType), AdjacencyList> adjacencyListByType = {
    // single(normal)
    // -------------------
    // |   0    |    1   |
    // -------------------
    // |  2  |  3  |  4  |
    // -------------------
    // |   5    |    6   |
    // -------------------
    // |  7  |  8  |  9  |
    // -------------------
    (FarmGroupType.single, FarmType.dense): [
      [1, 2, 3], // 0번 노드와 연결된 노드들
      [0, 3, 4], // 1번 노드와 연결된 노드들...
      [0, 3, 5],
      [0, 1, 2, 4, 5, 6],
      [1, 3, 6],
      [2, 3, 6, 7, 8],
      [3, 4, 5, 8, 9],
      [5, 8],
      [5, 6, 7, 9],
      [6, 8], // 9번 노드와 연결된 노드들
    ],

    // single(flip)
    /// -------------------
    /// |  0  |  1  |  2  |
    /// -------------------
    /// |   3    |    4   |
    /// -------------------
    /// |  5  |  6  |  7  |
    /// -------------------
    /// |   8    |   9    |
    /// -------------------
    (FarmGroupType.single, FarmType.reverseDense): [
      [1, 3],
      [0, 2, 3, 4],
      [1, 4],
      [0, 1, 4, 5, 6],
      [1, 2, 3, 6, 7],
      [3, 6, 8],
      [3, 4, 5, 7, 8, 9],
      [4, 6, 9],
      [5, 6, 9],
      [6, 7, 8],
    ],

    // double(normal)
    // -------------------------------------              |--------------------------------|
    // |   0    |    1   |  10 |  11 |  12 |              |\\|  0  |  1  |  10 |  11 |  12 |
    // -------------------------------------              |--------------------------------|
    // |  2  |  3  |  4  |   13   |   14   |   actually   |  2  |  3  |  4  |  13 |  14 |\\|
    // -------------------------------------      =>      |--------------------------------|
    // |   5    |    6   |  15 |  16 |  17 |              |\\|  5  |  6  |  15 |  16 |  17 |
    // -------------------------------------              |--------------------------------|
    // |  7  |  8  |  9  |   18   |   19   |              |  7  |  8  |  9  |  18 |  19 |\\|
    // -------------------------------------              |--------------------------------|
    (FarmGroupType.double, FarmType.dense): [
      [1, 2, 3], // 0
      [0, 3, 4, 10], // 1
      [0, 3, 5], // 2
      [0, 1, 2, 4, 5, 6], // 3
      [1, 3, 6, 10, 13, 15], // 4
      [2, 3, 6, 7, 8], // 5
      [3, 4, 5, 8, 9, 15], // 6
      [5, 8], // 7
      [5, 6, 7, 9], // 8
      [6, 8, 15, 18], // 9
      [1, 4, 11, 13], // 10
      [10, 12, 13, 14], // 11
      [11, 14], // 12
      [4, 10, 11, 14, 15, 16], // 13
      [11, 12, 13, 16, 17], // 14
      [4, 6, 9, 13, 16, 18], // 15
      [13, 14, 15, 17, 18, 19], // 16
      [14, 16, 19], // 17
      [9, 15, 16, 19], // 18
      [16, 17, 18], // 19
    ],

    // double(flip)
    // -------------------------------------              |--------------------------------|
    // |  0  |  1  |  2  |   10   |   11   |              |  0  |  1  |  2  |  10 |  11 |\\|
    // -------------------------------------              |--------------------------------|
    // |   3    |    4   |  12 |  13 |  14 |   actually   |\\|  3  |  4  |  12 |  13 |  14 |
    // -------------------------------------      =>      |--------------------------------|
    // |  5  |  6  |  7  |   15   |   16   |              |  5  |  6  |  7  |  15 |  16 |\\|
    // -------------------------------------              |--------------------------------|
    // |   8    |   9    |  17 |  18 |  19 |              |\\|  8  |  9  |  17 |  18 |  19 |
    // -------------------------------------              |--------------------------------|
    (FarmGroupType.double, FarmType.reverseDense): [
      [1, 3], // 0
      [0, 2, 3, 4], // 1
      [1, 4, 10, 12], // 2
      [0, 1, 4, 5, 6], // 3
      [1, 2, 3, 6, 7, 12], // 4
      [3, 6, 8], // 5
      [3, 4, 5, 7, 8, 9], // 6
      [4, 6, 9, 12, 15, 17], // 7
      [5, 6, 9], // 8
      [6, 7, 8, 17], // 9
      [2, 11, 12, 13], // 10
      [10, 13, 14], // 11
      [2, 4, 7, 10, 13, 15], // 12
      [10, 11, 12, 14, 15, 16], // 13
      [11, 13, 16], // 14
      [7, 12, 13, 16, 17, 18], // 15
      [13, 14, 15, 18, 19], // 16
      [7, 9, 15, 18], // 17
      [15, 16, 17, 19], // 18
      [16, 18], // 19
    ],
  };

  FarmType get _farmType => farmGroupModel.farmViewModels[0].farmType;

  @override
  bool get isSatisfied {
    final groupType = farmGroupModel.groupType;
    final adjacencyList = adjacencyListByType[(groupType, _farmType)];

    if (adjacencyList == null) {
      assert(false, 'Invalid [groupType] or [farmType]');
      // TODO: Send a proper error message and Error type. Maybe a critical error that should be reported.
      throw ErrorDescription('');
    }

    final List<_PlantNode> plantNodeList = _initPlantNodeList();
    final unionFind = UnionFind<_PlantNode>();
    unionFind.initialize(plantNodeList);

    // Union all plants that are connected.
    for (final node in plantNodeList) {
      final currentPlant = node.plant;

      // No need to go for the case of empty plant.
      if (currentPlant == null) continue;

      final adjacentNodeIds = adjacencyList[node.id];
      for (final adjacentNodeId in adjacentNodeIds) {
        final adjacentNode = plantNodeList.firstWhere((e) => e.id == adjacentNodeId);

        // No need to union for the previous nodes.
        if (adjacentNodeId > node.id && adjacentNode.plant != null && currentPlant == adjacentNode.plant) {
          unionFind.union(node, adjacentNode);
        }
      }
    }

    final countByRoot = super.countByRoot(plantNodeList, unionFind);

    if (countByRoot.isEmpty) return false;
    return countByRoot.entries.every((entry) => entry.value >= FamilyCondition.requiredCount);
  }

  List<_PlantNode> _initPlantNodeList() {
    switch (_farmType) {
      case FarmType.basic:
        assert(false, 'The [farmType] should not be [FarmType.basic]');
        // TODO: Send a proper error message and Error type. Maybe a critical error that should be reported.
        throw ErrorDescription('');

      case FarmType.dense || FarmType.reverseDense:
        switch (farmGroupModel.groupType) {
          case FarmGroupType.single:
            final plants = farmGroupModel.farmViewModels[0].plants;
            return plants.asMap().entries.map((e) => _PlantNode(id: e.key, plant: e.value)).toList();
          case FarmGroupType.double:
            final leftPlants = farmGroupModel.farmViewModels[0].plants;
            final rightPlants = farmGroupModel.farmViewModels[1].plants;
            return [
              ...leftPlants.asMap().entries.map((e) => _PlantNode(id: e.key, plant: e.value)),
              ...rightPlants.asMap().entries.map((e) => _PlantNode(id: e.key + _farmType.plantCount, plant: e.value)),
            ];
          case FarmGroupType.square:
            assert(false,
                'The [groupType] should not be [FarmGroupType.square] because the [farmType] is [FarmType.dense]');
            // TODO: Send a proper error message and Error type. Maybe a critical error that should be reported.
            throw ErrorDescription('');
        }
    }
  }
}
