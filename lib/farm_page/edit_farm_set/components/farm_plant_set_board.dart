import 'package:flutter/material.dart';

import '../../farm_list/farm_group/farm_group.dart';
import '../farm_group_edit_controller.dart';

/// The place where users can set plants.
class FarmCanvas extends StatelessWidget {
  const FarmCanvas({
    super.key,
    required this.controller,
    required this.width,
    required this.height,
  });

  final FarmGroupEditController controller;
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
            listenable: controller.farmGroupModelNotifier,
            builder: (context, child) {
              return FarmGroup(
                model: controller.farmGroupModel,
                onPressed: (farmIndex) => (plantIndex) => () {
                      controller.setPlant(
                        controller.selectedCrop,
                        farmIndex: farmIndex,
                        plantIndex: plantIndex,
                      );
                    },
              );
            }),
      ),
    );
  }
}
