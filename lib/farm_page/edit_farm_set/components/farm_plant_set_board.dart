import 'package:dst_helper/farm_page/edit_farm_set/edit_farm_set_controller.dart';
import 'package:dst_helper/farm_page/farm_list/farm_plant_set/farm_plant_set.dart';
import 'package:dst_helper/models/v2/item/item.dart';
import 'package:flutter/material.dart';

class FarmPlantSetBoard extends StatelessWidget {
  const FarmPlantSetBoard({
    super.key,
    required this.controller,
    required this.width,
    required this.height,
  });

  final EditFarmSetController controller;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      width: width,
      height: height,
      child: Center(
        child: ListenableBuilder(
            listenable: controller.farmPlantSetModelController,
            builder: (context, child) {
              return FarmPlantSet(
                farmPlantSetModel: controller.farmPlantSetModel,
                onPressed: (farmPlantIndex) => (plantIndex) => () {
                      final Plant? placedPlant =
                          controller.farmPlantSetModel.farmPlantModelList[farmPlantIndex].plants[plantIndex];
                      final selectedCrop = controller.selectedCrop;
                      controller.setPlant(
                        placedPlant == selectedCrop ? null : selectedCrop,
                        farmPlantIndex: farmPlantIndex,
                        plantIndex: plantIndex,
                      );
                    },
              );
            }),
      ),
    );
  }
}
