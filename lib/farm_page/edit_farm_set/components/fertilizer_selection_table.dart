import 'package:dst_helper/models/v2/item/item.dart';
import 'package:flutter/material.dart';

class FertilizerSelectionTable extends StatelessWidget {
  FertilizerSelectionTable({
    super.key,
    ValueNotifier<Fertilizer?>? selectedFertilizerController,
  }) : selectedFertilizerController = selectedFertilizerController ?? ValueNotifier(null);

  final double spacing = 4;
  final List<List<Fertilizer>> fertilizerList = const [
    Fertilizers.compostList,
    Fertilizers.growthFormulaList,
    Fertilizers.manureList,
    Fertilizers.mixList,
  ];

  final ValueNotifier<Fertilizer?> selectedFertilizerController;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: spacing,
      children: [
        ...fertilizerList.map((fertilizers) => Row(
              spacing: spacing,
              children: [
                ...fertilizers.map((fertilizer) => ValueListenableBuilder(
                    valueListenable: selectedFertilizerController,
                    builder: (context, selectedFertilizer, child) {
                      return IconButton(
                        onPressed: () {
                          final currentSelectedFertilizer = selectedFertilizerController.value;
                          selectedFertilizerController.value =
                              (currentSelectedFertilizer == fertilizer) ? null : fertilizer;
                        },
                        icon: Image(
                          image: AssetImage('assets/images/items/${fertilizer.assetName}.png'),
                          width: 40,
                          height: 40,
                        ),
                        style: IconButton.styleFrom(
                          backgroundColor: selectedFertilizer == fertilizer ? Colors.blue.shade100 : Colors.transparent,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: selectedFertilizer == fertilizer ? Colors.blue : Colors.grey.shade400,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      );
                    })),
              ],
            )),
      ],
    );
  }
}
