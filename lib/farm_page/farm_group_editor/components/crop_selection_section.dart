import 'package:flutter/material.dart';

import '../../../l10n/l10ns.dart';
import '../../../models/v2/item/item.dart';
import '../../../utils/font_family.dart';

typedef SelectedCropNotifier = ValueNotifier<Crop?>;

class CropSelectionSection extends StatelessWidget {
  CropSelectionSection({
    super.key,
    required SelectedCropNotifier? notifier,
  }) : _notifier = notifier ?? SelectedCropNotifier(null);

  final SelectedCropNotifier _notifier;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 6,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _CropSelectionHeader(),
        _CropSelectionBody(notifier: _notifier),
      ],
    );
  }
}

class _CropSelectionHeader extends StatelessWidget {
  const _CropSelectionHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Text(
        L10ns.of(context).localized('crops'),
        style: const TextStyle(
          fontFamily: FontFamily.pretendard,
          fontVariations: [FontVariation.weight(500)],
          fontSize: 16,
        ),
      ),
    );
  }
}

class _CropSelectionBody extends StatelessWidget {
  const _CropSelectionBody({
    required SelectedCropNotifier notifier,
  }) : _notifier = notifier;

  final int countOfRow = 7;
  int get countOfColumn => (Items.crops.length / countOfRow).ceil();
  final double _spacing = 4;

  final ValueNotifier<Crop?> _notifier;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: _spacing,
      children: [
        for (int column = 0; column < countOfColumn; column++)
          Row(
            spacing: _spacing,
            children: [
              for (int row = 0; row < countOfRow; row++)
                if (Items.crops.elementAtOrNull(countOfRow * column + row) != null)
                  ValueListenableBuilder(
                      valueListenable: _notifier,
                      builder: (context, selectedCrop, child) {
                        return IconButton(
                          onPressed: () {
                            _notifier.value = Items.crops[countOfRow * column + row];
                          },
                          icon: Image(
                            image: AssetImage(
                                'assets/images/items/${Items.crops[countOfRow * column + row].assetName}.png'),
                            width: 40,
                            height: 40,
                          ),
                          style: IconButton.styleFrom(
                            backgroundColor: selectedCrop == Items.crops[countOfRow * column + row]
                                ? Colors.blue.shade100
                                : Colors.transparent,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: selectedCrop == Items.crops[countOfRow * column + row]
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
