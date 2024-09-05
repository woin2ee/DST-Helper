import 'package:dst_helper/farm_page/farm_list/plant_cell/plant_cell.dart';
import 'package:flutter/material.dart';

import 'farm_plant_model.dart';

export 'farm_plant_model.dart';

class FarmPlant extends StatelessWidget {
  FarmPlant({
    super.key,
    FarmPlantModel? model,
    this.onPressedByIndex,
  }) : model = model ?? FarmPlantModel.empty(FarmPlantStyle.basic);

  final FarmPlantModel model;
  final PlantCallBack Function(int index)? onPressedByIndex;

  @override
  Widget build(BuildContext context) {
    return switch (model.farmPlantStyle) {
      FarmPlantStyle.basic => SizedBox(
          width: 180,
          height: 180,
          child: Column(
            children: [
              Row(
                children: [
                  PlantCell(
                    model: model.plantCellModels[0],
                    onPressed: onPressedByIndex?.call(0),
                  ),
                  PlantCell(
                    model: model.plantCellModels[1],
                    onPressed: onPressedByIndex?.call(1),
                  ),
                  PlantCell(
                    model: model.plantCellModels[2],
                    onPressed: onPressedByIndex?.call(2),
                  ),
                ],
              ),
              Row(
                children: [
                  PlantCell(
                    model: model.plantCellModels[3],
                    onPressed: onPressedByIndex?.call(3),
                  ),
                  PlantCell(
                    model: model.plantCellModels[4],
                    onPressed: onPressedByIndex?.call(4),
                  ),
                  PlantCell(
                    model: model.plantCellModels[5],
                    onPressed: onPressedByIndex?.call(5),
                  ),
                ],
              ),
              Row(
                children: [
                  PlantCell(
                    model: model.plantCellModels[6],
                    onPressed: onPressedByIndex?.call(6),
                  ),
                  PlantCell(
                    model: model.plantCellModels[7],
                    onPressed: onPressedByIndex?.call(7),
                  ),
                  PlantCell(
                    model: model.plantCellModels[8],
                    onPressed: onPressedByIndex?.call(8),
                  ),
                ],
              ),
            ],
          ),
        ),
      FarmPlantStyle.dense => SizedBox(
          width: 180,
          height: 220,
          child: Column(
            children: [
              Flexible(
                child: Row(
                  children: [
                    PlantCell(
                      model: model.plantCellModels[0],
                      onPressed: onPressedByIndex?.call(0),
                    ),
                    PlantCell(
                      model: model.plantCellModels[1],
                      onPressed: onPressedByIndex?.call(1),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  children: [
                    PlantCell(
                      model: model.plantCellModels[2],
                      onPressed: onPressedByIndex?.call(2),
                    ),
                    PlantCell(
                      model: model.plantCellModels[3],
                      onPressed: onPressedByIndex?.call(3),
                    ),
                    PlantCell(
                      model: model.plantCellModels[4],
                      onPressed: onPressedByIndex?.call(4),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  children: [
                    PlantCell(
                      model: model.plantCellModels[5],
                      onPressed: onPressedByIndex?.call(5),
                    ),
                    PlantCell(
                      model: model.plantCellModels[6],
                      onPressed: onPressedByIndex?.call(6),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  children: [
                    PlantCell(
                      model: model.plantCellModels[7],
                      onPressed: onPressedByIndex?.call(7),
                    ),
                    PlantCell(
                      model: model.plantCellModels[8],
                      onPressed: onPressedByIndex?.call(8),
                    ),
                    PlantCell(
                      model: model.plantCellModels[9],
                      onPressed: onPressedByIndex?.call(9),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      FarmPlantStyle.reverseDense => SizedBox(
          width: 180,
          height: 220,
          child: Column(
            children: [
              Flexible(
                child: Row(
                  children: [
                    PlantCell(
                      model: model.plantCellModels[0],
                      onPressed: onPressedByIndex?.call(0),
                    ),
                    PlantCell(
                      model: model.plantCellModels[1],
                      onPressed: onPressedByIndex?.call(1),
                    ),
                    PlantCell(
                      model: model.plantCellModels[2],
                      onPressed: onPressedByIndex?.call(2),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  children: [
                    PlantCell(
                      model: model.plantCellModels[3],
                      onPressed: onPressedByIndex?.call(3),
                    ),
                    PlantCell(
                      model: model.plantCellModels[4],
                      onPressed: onPressedByIndex?.call(4),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  children: [
                    PlantCell(
                      model: model.plantCellModels[5],
                      onPressed: onPressedByIndex?.call(5),
                    ),
                    PlantCell(
                      model: model.plantCellModels[6],
                      onPressed: onPressedByIndex?.call(6),
                    ),
                    PlantCell(
                      model: model.plantCellModels[7],
                      onPressed: onPressedByIndex?.call(7),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  children: [
                    PlantCell(
                      model: model.plantCellModels[8],
                      onPressed: onPressedByIndex?.call(8),
                    ),
                    PlantCell(
                      model: model.plantCellModels[9],
                      onPressed: onPressedByIndex?.call(9),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
    };
  }
}
