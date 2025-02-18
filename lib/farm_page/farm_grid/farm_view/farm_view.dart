import 'package:flutter/material.dart';

import '../plant_cell/plant_cell.dart';
import 'farm_view_model.dart';

export 'farm_view_model.dart';

/// A widget that plant cells are placed.
///
/// The index order of the plant cells are top-left to bottom-right and direction is horizontal.
class FarmView extends StatelessWidget {
  FarmView({
    super.key,
    FarmViewModel? model,
    this.onPressedByIndex,
  }) : model = model ?? FarmViewModel.empty(FarmType.basic);

  final FarmViewModel model;
  final VoidCallback Function(int index)? onPressedByIndex;

  @override
  Widget build(BuildContext context) {
    return switch (model.farmType) {
      FarmType.basic => _basicFarmView(),
      FarmType.dense => _denseFarmView(),
      FarmType.reverseDense => _reverseDenseFarmView(),
    };
  }

  SizedBox _reverseDenseFarmView() {
    const double width = 180;
    const double height = 220;

    return SizedBox(
      width: width,
      height: height,
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
    );
  }

  SizedBox _denseFarmView() {
    const double width = 180;
    const double height = 220;

    return SizedBox(
      width: width,
      height: height,
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
    );
  }

  Widget _basicFarmView() {
    const double width = 180;
    const row = 3;
    const column = 3;

    return SizedBox(
      width: width,
      height: width,
      child: Column(
        children: List.generate(
          row,
          (i) => Row(
            children: List.generate(
              column,
              (j) {
                final index = i * column + j;
                return PlantCell(
                  model: model.plantCellModels[index],
                  onPressed: onPressedByIndex?.call(index),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
