import 'dart:math';

import 'package:dst_helper/farm_page/farm_list/farm_plant_set/farm_plant_set.dart';
import 'package:dst_helper/models/v2/item/categories.dart';
import 'package:dst_helper/utils/union_find.dart';

class FamilyCondition {
  const FamilyCondition._({
    required this.rowCount,
    required this.colCount,
    required List<List<_PlantInfo>> plantArray,
    required Iterable<_PlantInfo> flatPlantArray,
    required UnionFind<_PlantInfo> unionFind,
  })  : _unionFind = unionFind,
        _plantArray = plantArray,
        _flatPlantArray = flatPlantArray;

  factory FamilyCondition.withModel(FarmPlantSetModel model) {
    final rowCount = switch (model.farmPlantSetStyle) {
      FarmPlantSetStyle.single => 3,
      FarmPlantSetStyle.double || FarmPlantSetStyle.square => 6,
    };

    final colCount = switch (model.farmPlantSetStyle) {
      FarmPlantSetStyle.single || FarmPlantSetStyle.double => 3,
      FarmPlantSetStyle.square => 6,
    };

    final List<List<_PlantInfo>> plantArray = switch (model.farmPlantSetStyle) {
      FarmPlantSetStyle.single => List.generate(
          colCount,
          (col) => List.generate(
            rowCount,
            (row) => _PlantInfo(
              plant: model.farmPlantModelList[0].plants[col * 3 + row],
              point: Point(col, row),
            ),
            growable: false,
          ),
          growable: false,
        ),
      FarmPlantSetStyle.double => List.generate(
          colCount,
          (col) => List.generate(
            rowCount,
            (row) {
              if (row < 3) {
                return _PlantInfo(
                  plant: model.farmPlantModelList[0].plants[col * 3 + row],
                  point: Point(col, row),
                );
              } else {
                return _PlantInfo(
                  plant: model.farmPlantModelList[1].plants[col * 3 + row - 3],
                  point: Point(col, row),
                );
              }
            },
            growable: false,
          ),
          growable: false,
        ),
      FarmPlantSetStyle.square => List.generate(
          colCount,
          (col) => List.generate(
            rowCount,
            (row) {
              if (col < 3) {
                if (row < 3) {
                  return _PlantInfo(
                    plant: model.farmPlantModelList[0].plants[col * 3 + row],
                    point: Point(col, row),
                  );
                } else {
                  return _PlantInfo(
                    plant: model.farmPlantModelList[1].plants[col * 3 + row - 3],
                    point: Point(col, row),
                  );
                }
              } else {
                if (row < 3) {
                  return _PlantInfo(
                    plant: model.farmPlantModelList[2].plants[(col - 3) * 3 + row],
                    point: Point(col, row),
                  );
                } else {
                  return _PlantInfo(
                    plant: model.farmPlantModelList[3].plants[(col - 3) * 3 + row - 3],
                    point: Point(col, row),
                  );
                }
              }
            },
            growable: false,
          ),
          growable: false,
        ),
    };
    final unionFind = UnionFind<_PlantInfo>();
    final Iterable<_PlantInfo> flatPlantArray = plantArray.expand((e) => e.toList());
    unionFind.initialize(flatPlantArray.toList());

    return FamilyCondition._(
      rowCount: rowCount,
      colCount: colCount,
      plantArray: plantArray,
      flatPlantArray: flatPlantArray,
      unionFind: unionFind,
    );
  }

  final int rowCount;
  final int colCount;
  final List<List<_PlantInfo>> _plantArray;
  final Iterable<_PlantInfo> _flatPlantArray;
  final UnionFind<_PlantInfo> _unionFind;

  bool get isSatisfied {
    for (int col = 0; col < colCount; col++) {
      for (int row = 0; row < rowCount; row++) {
        final currentPlant = _plantArray[col][row];
        if (currentPlant.plant == null) continue;

        final nextPlant = _plantArray.elementAtOrNull(col)?.elementAtOrNull(row + 1);
        if (nextPlant != null && currentPlant.plant == nextPlant.plant) {
          _unionFind.union(currentPlant, nextPlant);
        }

        final belowPlant = _plantArray.elementAtOrNull(col + 1)?.elementAtOrNull(row);
        if (belowPlant != null && currentPlant.plant == belowPlant.plant) {
          _unionFind.union(currentPlant, belowPlant);
        }
      }
    }

    final Map<_PlantInfo, int> countByRoot = {};
    for (final i in _flatPlantArray) {
      final root = _unionFind.find(i);
      if (root.plant != null) {
        countByRoot.update(root, (value) => value + 1, ifAbsent: () => 1);
      }
    }
    return countByRoot.entries.every((entry) => entry.value >= 4);
  }
}

class _PlantInfo {
  _PlantInfo({
    this.plant,
    required this.point,
  });

  final Plant? plant;
  final Point<int> point;
}
