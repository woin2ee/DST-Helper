import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        ChangeNotifierProvider.value(
          value: _notifier,
          child: const _FertilizerSelectionBody(),
        ),
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
  const _FertilizerSelectionBody();

  final double _hSpacing = 34;
  final double _vSpacing = 16;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: _hSpacing,
      children: [
        Column(
          spacing: _vSpacing,
          children: [
            const _FertilizersRow(type: _FertilizerType.compost),
            const _FertilizersRow(type: _FertilizerType.growthFormula),
          ],
        ),
        Column(
          spacing: _vSpacing,
          children: [
            const _FertilizersRow(type: _FertilizerType.manure),
            const _FertilizersRow(type: _FertilizerType.mix),
          ],
        ),
      ],
    );
  }
}

class _FertilizersRow extends StatelessWidget {
  const _FertilizersRow({
    required this.type,
  });

  final _FertilizerType type;

  List<Fertilizer> get _fertilizers {
    switch (type) {
      case _FertilizerType.compost:
        return Items.compostList;
      case _FertilizerType.growthFormula:
        return Items.growthFormulaList;
      case _FertilizerType.manure:
        return Items.manureList;
      case _FertilizerType.mix:
        return Items.mixList;
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedFertilizer = context.watch<SelectedFertilizerNotifier>();

    return Column(
      spacing: 2,
      children: [
        Text(
          L10ns.of(context).localized(type.name),
          style: const TextStyle(
            fontFamily: FontFamily.pretendard,
            fontSize: 14,
          ),
        ),
        Row(
          spacing: 4,
          children: [
            ..._fertilizers.map((fertilizer) => IconButton(
                  onPressed: () {
                    selectedFertilizer.value = fertilizer;
                  },
                  icon: Image(
                    image: AssetImage('assets/images/items/${fertilizer.assetName}.png'),
                    width: 40,
                    height: 40,
                  ),
                  style: IconButton.styleFrom(
                    backgroundColor: selectedFertilizer.value == fertilizer ? Colors.blue.shade100 : Colors.transparent,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: selectedFertilizer.value == fertilizer ? Colors.blue : Colors.grey.shade400,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                )),
          ],
        ),
      ],
    );
  }
}

enum _FertilizerType {
  compost,
  growthFormula,
  manure,
  mix,
}
