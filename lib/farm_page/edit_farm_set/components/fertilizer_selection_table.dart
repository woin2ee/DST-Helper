import 'package:dst_helper/models/v2/item/item.dart';
import 'package:flutter/material.dart';

class FertilizerSelectionTable extends StatelessWidget {
  FertilizerSelectionTable({
    super.key,
    FertilizerSelectionTableController? controller,
  }) : controller = controller ?? FertilizerSelectionTableController(null);

  final double spacing = 4;
  final List<List<Fertilizer>> fertilizerList = const [
    Items.compostList,
    Items.growthFormulaList,
    Items.manureList,
    Items.mixList,
  ];

  final FertilizerSelectionTableController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: spacing,
      children: [
        ...fertilizerList.map((fertilizers) => Row(
              spacing: spacing,
              children: [
                ...fertilizers.map((fertilizer) => ValueListenableBuilder(
                    valueListenable: controller,
                    builder: (context, selectedFertilizer, child) {
                      return IconButton(
                        onPressed: () => controller.selectFertilizer(fertilizer),
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

class FertilizerSelectionTableController extends ValueNotifier<Fertilizer?> {
  FertilizerSelectionTableController(super.value);

  Fertilizer? get selectedFertilizer => value;

  void selectFertilizer(Fertilizer fertilizer) {
    if (fertilizer == value) {
      value = null;
    } else {
      value = fertilizer;
    }
  }
}
