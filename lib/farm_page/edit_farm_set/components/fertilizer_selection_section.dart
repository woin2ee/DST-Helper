import 'package:flutter/material.dart';

import '../../../l10n/l10ns.dart';
import '../../../models/v2/item/categories.dart';
import '../../../models/v2/item/items.dart';
import '../../../utils/font_family.dart';

typedef SelectedFertilizerNotifier = ValueNotifier<Fertilizer?>;

class FertilizerSelectionSection extends StatelessWidget {
  FertilizerSelectionSection({
    super.key,
    SelectedFertilizerNotifier? notifier,
  }) : _notifier = notifier ?? SelectedFertilizerNotifier(null);

  final SelectedFertilizerNotifier _notifier;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 6,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _FertilizerSelectionHeader(),
        _FertilizerSelectionBody(notifier: _notifier),
      ],
    );
  }
}

class _FertilizerSelectionHeader extends StatelessWidget {
  const _FertilizerSelectionHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Row(
        spacing: 4,
        children: [
          Text(
            L10ns.of(context).localized('fertilizers'),
            style: const TextStyle(
              fontFamily: FontFamily.pretendard,
              fontVariations: [FontVariation.weight(500)],
              fontSize: 16,
            ),
          ),
          Tooltip(
            message: L10ns.of(context).localized('fertilizer_selection_tooltip'),
            textStyle: const TextStyle(
              fontFamily: FontFamily.pretendard,
              fontSize: 13,
              color: Colors.white,
            ),
            decoration: const BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            verticalOffset: 15,
            padding: const EdgeInsets.only(top: 4, left: 10, right: 10, bottom: 4),
            enableTapToDismiss: false,
            preferBelow: false,
            waitDuration: const Duration(milliseconds: 200),
            child: const Icon(Icons.info_outline_rounded),
          ),
        ],
      ),
    );
  }
}

class _FertilizerSelectionBody extends StatelessWidget {
  const _FertilizerSelectionBody({
    required SelectedFertilizerNotifier notifier,
  }) : _notifier = notifier;

  final double _spacing = 4;
  final List<List<Fertilizer>> _fertilizerList = const [
    Items.compostList,
    Items.growthFormulaList,
    Items.manureList,
    Items.mixList,
  ];

  final SelectedFertilizerNotifier _notifier;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: _spacing,
      children: [
        ..._fertilizerList.map((fertilizers) => Row(
              spacing: _spacing,
              children: [
                ...fertilizers.map((fertilizer) => ValueListenableBuilder(
                    valueListenable: _notifier,
                    builder: (context, selectedFertilizer, child) {
                      return IconButton(
                        onPressed: () => _notifier.value = fertilizer,
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
