import 'package:flutter/material.dart';

import '../../farm_list/farm_plant_set/farm_plant_set.dart';
import '../edit_farm_set_controller.dart';

/// The place where users can set plants.
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
            listenable: controller.farmPlantSetModelNotifier,
            builder: (context, child) {
              return FarmPlantSet(
                farmPlantSetModel: controller.farmPlantSetModel,
                onPressed: (farmPlantIndex) => (plantIndex) => () {
                      final selectedCrop = controller.selectedCrop;
                      controller.setPlant(
                        selectedCrop,
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
