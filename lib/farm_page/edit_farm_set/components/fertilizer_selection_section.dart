import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../l10n/l10ns.dart';
import '../../../models/v2/item/categories.dart';
import '../../../models/v2/item/items.dart';
import '../../../utils/font_family.dart';
import '../farm_group_edit_window.dart';

typedef SelectedFertilizerNotifier = ValueNotifier<Fertilizer?>;

enum _FertilizerType {
  compost,
  growthFormula,
  manure,
  mix,
}

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
            ..._fertilizers.map((fertilizer) {
              if (fertilizer == Items.growthFormulaStarter) {
                final currentSelectedFertilizer = selectedFertilizer.value;
                if (Items.growthFormulaVariants.contains(currentSelectedFertilizer)) {
                  return _GrowthFormulaButton(initialValue: currentSelectedFertilizer);
                }
                return const _GrowthFormulaButton();
              }
              return _FertilizerIconButton(
                fertilizer: fertilizer,
                onPressed: () => selectedFertilizer.value = fertilizer,
              );
            }),
          ],
        ),
      ],
    );
  }
}

class _FertilizerIconButton extends StatelessWidget {
  const _FertilizerIconButton({
    required this.fertilizer,
    this.onPressed,
  });

  final Fertilizer fertilizer;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final selectedFertilizer = context.watch<SelectedFertilizerNotifier>().value;

    return IconButton(
      onPressed: onPressed,
      icon: Image(
        image: AssetImage('assets/images/items/${fertilizer.assetName}.png'),
        width: 40,
        height: 40,
      ),
      style: IconButton.styleFrom(
        backgroundColor: selectedFertilizer == fertilizer ? Colors.blue.shade100 : Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: selectedFertilizer == fertilizer ? Colors.blue : Colors.grey.shade400,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

/// A specially widget only for `Growth Formula`.
class _GrowthFormulaButton extends StatefulWidget {
  const _GrowthFormulaButton({
    this.initialValue,
  }) : assert(initialValue == null ||
            (initialValue == Items.growthFormulaStarter ||
                initialValue == Items.fermentingGrowthFormula ||
                initialValue == Items.fermentedGrowthFormula ||
                initialValue == Items.superGrowthFormula));

  final Fertilizer? initialValue;

  @override
  State<_GrowthFormulaButton> createState() => _GrowthFormulaButtonState();
}

class _GrowthFormulaButtonState extends State<_GrowthFormulaButton> {
  final _overlayController = OverlayPortalController();

  Fertilizer _lastSelected = Items.growthFormulaStarter;

  @override
  void initState() {
    super.initState();
    _initLastSelectedFertilizer();
  }

  void _initLastSelectedFertilizer() {
    final initialValue = widget.initialValue;
    if (initialValue != null) {
      _lastSelected = initialValue;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    MediaQuery.of(context);
  }

  double get _selectableGrowthFormulaBoxWidth {
    final FarmGroupEditWindow? editWindow = context.findAncestorWidgetOfExactType();
    final renderObject = (editWindow?.key as GlobalKey).currentContext?.findRenderObject();
    if (renderObject == null) return 0;
    final renderBox = renderObject as RenderBox;
    final scale = 7.1;
    return renderBox.size.width / scale;
  }

  @override
  Widget build(BuildContext context) {
    final selectedFertilizer = context.watch<SelectedFertilizerNotifier>();

    return OverlayPortal(
      controller: _overlayController,
      overlayChildBuilder: (context) {
        return Positioned(
          top: _computeOverlayOffset(context).dy,
          left: _computeOverlayOffset(context).dx,
          child: SizedBox(
            width: _selectableGrowthFormulaBoxWidth,
            child: FittedBox(
              child: Row(
                spacing: 3,
                children: [
                  ...Items.growthFormulaVariants.map((fertilizer) {
                    return _FertilizerIconButton(
                      fertilizer: fertilizer,
                      onPressed: () {
                        selectedFertilizer.value = fertilizer;
                        _overlayController.hide();
                        setState(() {
                          _lastSelected = fertilizer;
                        });
                      },
                    );
                  }),
                ],
              ),
            ),
          ),
        );
      },
      child: _FertilizerIconButton(
        fertilizer: _lastSelected,
        onPressed: _overlayController.toggle,
      ),
    );
  }

  Offset _computeOverlayOffset(BuildContext context) {
    final overlayState = Overlay.of(context, debugRequiredFor: widget);
    final RenderBox box = this.context.findRenderObject()! as RenderBox;
    final Offset offset = box.localToGlobal(
      box.size.center(Offset.zero),
      ancestor: overlayState.context.findRenderObject(),
    );

    final dyScale = 2.7;
    return offset.translate(-_selectableGrowthFormulaBoxWidth / 2, -_selectableGrowthFormulaBoxWidth / dyScale);
  }
}
