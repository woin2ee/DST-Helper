import 'package:dst_helper/models/v2/item/item.dart';
import 'package:flutter/material.dart';

class CropSelectionTable extends StatelessWidget {
  CropSelectionTable({
    super.key,
    ValueNotifier<Crop?>? selectedCropController,
  }) : selectedCropController = selectedCropController ?? ValueNotifier(null);

  final int countOfRow = 7;
  int get countOfColumn => (Crops.crops.length / countOfRow).ceil();
  final double spacing = 4;

  final ValueNotifier<Crop?> selectedCropController;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: spacing,
      children: [
        for (int column = 0; column < countOfColumn; column++)
          Row(
            spacing: spacing,
            children: [
              for (int row = 0; row < countOfRow; row++)
                if (Crops.crops.elementAtOrNull(countOfRow * column + row) != null)
                  ValueListenableBuilder(
                      valueListenable: selectedCropController,
                      builder: (context, selectedCrop, child) {
                        return IconButton(
                          onPressed: () {
                            selectedCropController.value = Crops.crops[countOfRow * column + row];
                          },
                          icon: Image(
                            image: AssetImage(
                                'assets/images/items/${Crops.crops[countOfRow * column + row].assetName}.png'),
                            width: 40,
                            height: 40,
                          ),
                          style: IconButton.styleFrom(
                            backgroundColor: selectedCrop == Crops.crops[countOfRow * column + row]
                                ? Colors.blue.shade100
                                : Colors.transparent,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: selectedCrop == Crops.crops[countOfRow * column + row]
                                    ? Colors.blue
                                    : Colors.grey.shade400,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        );
                      }),
            ],
          ),
      ],
    );
  }
}
