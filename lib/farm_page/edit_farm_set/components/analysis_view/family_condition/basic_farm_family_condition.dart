import 'dart:math';

import '../../../../../../models/v2/item/categories.dart';
import '../../../../../../utils/union_find.dart';
import '../../../../farm_grid/farm_group/farm_group_model.dart';
import '../../../../farm_grid/farm_view/farm_view_model.dart';
import 'family_condition.dart';

class _PlantInfo with PlantData {
  _PlantInfo({
    this.plant,
    required this.point,
  });

  @override
  final Plant? plant;

  final Point<int> point;
}

class BasicFarmFamilyCondition extends FamilyCondition {
  BasicFarmFamilyCondition.withModel(
    FarmGroupModel farmGroupModel,
  )   : assert(farmGroupModel.farmViewModels[0].farmType == FarmType.basic),
        super(farmGroupModel: farmGroupModel);

  @override
  bool get isSatisfied {
    final rowCount = switch (farmGroupModel.groupType) {
      FarmGroupType.single => 3,
      FarmGroupType.double || FarmGroupType.square => 6,
    };

    final colCount = switch (farmGroupModel.groupType) {
      FarmGroupType.single || FarmGroupType.double => 3,
      FarmGroupType.square => 6,
    };

    final List<List<_PlantInfo>> plantArray2D = switch (farmGroupModel.groupType) {
      FarmGroupType.single => List.generate(
          colCount,
          (col) => List.generate(
            rowCount,
            (row) => _PlantInfo(
              plant: farmGroupModel.farmViewModels[0].plants[col * 3 + row],
              point: Point(col, row),
            ),
            growable: false,
          ),
          growable: false,
        ),
      FarmGroupType.double => List.generate(
          colCount,
          (col) => List.generate(
            rowCount,
            (row) {
              if (row < 3) {
                return _PlantInfo(
                  plant: farmGroupModel.farmViewModels[0].plants[col * 3 + row],
                  point: Point(col, row),
                );
              } else {
                return _PlantInfo(
                  plant: farmGroupModel.farmViewModels[1].plants[col * 3 + row - 3],
                  point: Point(col, row),
                );
              }
            },
            growable: false,
          ),
          growable: false,
        ),
      FarmGroupType.square => List.generate(
          colCount,
          (col) => List.generate(
            rowCount,
            (row) {
              if (col < 3) {
                if (row < 3) {
                  return _PlantInfo(
                    plant: farmGroupModel.farmViewModels[0].plants[col * 3 + row],
                    point: Point(col, row),
                  );
                } else {
                  return _PlantInfo(
                    plant: farmGroupModel.farmViewModels[1].plants[col * 3 + row - 3],
                    point: Point(col, row),
                  );
                }
              } else {
                if (row < 3) {
                  return _PlantInfo(
                    plant: farmGroupModel.farmViewModels[2].plants[(col - 3) * 3 + row],
                    point: Point(col, row),
                  );
                } else {
                  return _PlantInfo(
                    plant: farmGroupModel.farmViewModels[3].plants[(col - 3) * 3 + row - 3],
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
    final flatPlantArray2D = plantArray2D.expand((e) => e).toList();
    final unionFind = UnionFind<_PlantInfo>();

    unionFind.initialize(flatPlantArray2D.toList());

    for (int col = 0; col < colCount; col++) {
      for (int row = 0; row < rowCount; row++) {
        final currentPlant = plantArray2D[col][row];
        if (currentPlant.plant == null) continue;

        final nextPlant = plantArray2D.elementAtOrNull(col)?.elementAtOrNull(row + 1);
        if (nextPlant != null && currentPlant.plant == nextPlant.plant) {
          unionFind.union(currentPlant, nextPlant);
        }

        final belowPlant = plantArray2D.elementAtOrNull(col + 1)?.elementAtOrNull(row);
        if (belowPlant != null && currentPlant.plant == belowPlant.plant) {
          unionFind.union(currentPlant, belowPlant);
        }
      }
    }

    final countByRoot = super.countByRoot(flatPlantArray2D, unionFind);

    if (countByRoot.isEmpty) return false;
    return countByRoot.entries.every((entry) => entry.value >= FamilyCondition.requiredCount);
  }
}
