import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../farm_grid/farm_group/farm_group.dart';
import '../farm_group_editor_model.dart';

/// The place where users can set plants.
class FarmGroupCanvas extends StatelessWidget {
  const FarmGroupCanvas({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<FarmGroupEditorModel>();

    return Container(
      width: 384,
      height: 384,
      color: Colors.black54,
      child: Center(
        child: FarmGroup(
          model: controller.farmGroupModel,
          onPressed: (farmIndex) => (plantIndex) => () {
                controller.setPlant(
                  controller.selectedCrop,
                  farmIndex: farmIndex,
                  plantIndex: plantIndex,
                );
              },
        ),
      ),
    );
  }
}
