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
  DenseFarmFamilyCondition.withModel({
    required super.farmGroupModel,
  })  : assert((farmGroupModel.farmViewModels[0].farmType != FarmType.basic) &&
            (farmGroupModel.groupType != FarmGroupType.square)),
        super();

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
      [6, 8] // 9번 노드와 연결된 노드들
    ],

    // single(flip)
    // -------------------
    // |  1  |  2  |  3  |
    // -------------------
    // |   4    |    5   |
    // -------------------
    // |  6  |  7  |  8  |
    // -------------------
    // |   9    |   10   |
    // -------------------
    (FarmGroupType.single, FarmType.reverseDense): [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9],
    ],

    // double(normal)
    // -------------------------------------
    // |   1    |   2    |  3  |  4  |  5  |
    // -------------------------------------
    // |  3  |  4  |  5  |   1    |   2    |
    // -------------------------------------
    // |   6    |   7    |  3  |  4  |  5  |
    // -------------------------------------
    // |  8  |  9  | 10  |   6    |   7    |
    // -------------------------------------
    (FarmGroupType.double, FarmType.dense): [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9],
    ],

    // double(flip)
    // -------------------------------------
    // |  1  |  2  |  3  |   1    |    2   |
    // -------------------------------------
    // |   4    |    5   |  3  |  4  |  5  |
    // -------------------------------------
    // |  6  |  7  |  8  |   6    |    7   |
    // -------------------------------------
    // |   9    |   10   |  8  |  9  | 10  |
    // -------------------------------------
    (FarmGroupType.double, FarmType.reverseDense): [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9],
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

      // No needs the case of empty plant.
      if (currentPlant == null) continue;

      final adjacentNodeIds = adjacencyList[node.id];
      for (final adjacentNodeId in adjacentNodeIds) {
        final adjacentNode = plantNodeList.firstWhere((e) => e.id == adjacentNodeId);

        // No needs the previous nodes.
        if (adjacentNodeId > node.id && adjacentNode.plant != null && currentPlant == adjacentNode.plant) {
          unionFind.union(node, adjacentNode);
        }
      }
    }

    final countByRoot = super.countByRoot(plantNodeList, unionFind);

    if (countByRoot.isEmpty) return false;
    return countByRoot.entries.every((entry) => entry.value >= 4);
  }

  List<_PlantNode> _initPlantNodeList() {
    // farmGroupModel.farmViewModels[0].plants;
    // farmGroupModel.farmViewModels[1];
    // farmGroupModel.farmViewModels[2];
    // farmGroupModel.farmViewModels[3];

    switch (_farmType) {
      case FarmType.basic:
        assert(false, 'The [farmType] should not be [FarmType.basic]');
        // TODO: Send a proper error message and Error type. Maybe a critical error that should be reported.
        throw ErrorDescription('');

      case FarmType.dense:
        farmGroupModel.farmCount;
        final plants = farmGroupModel.farmViewModels[0].plants;
        farmGroupModel.farmViewModels[0].plantCount;

        return plants.asMap().entries.map((e) => _PlantNode(id: e.key, plant: e.value)).toList();

      case FarmType.reverseDense:
        throw UnimplementedError();
    }
  }
}
