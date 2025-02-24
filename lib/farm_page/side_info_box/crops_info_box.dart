import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/l10ns.dart';
import '../../models/v1/season.dart';
import '../../models/v2/item/item.dart';
import '../../utils/font_family.dart';

class CropsInfoBox extends StatefulWidget {
  const CropsInfoBox({
    super.key,
  });

  static const double horizontalSpacing = 4;
  static const double imageWidth = 40;
  static const double amountWidth = 70;
  static const double seasonWidth = 50;

  @override
  State<CropsInfoBox> createState() => _CropsInfoBoxState();
}

class _CropsInfoBoxState extends State<CropsInfoBox> {
  final _viewModel = _ViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _viewModel,
      builder: (context, child) {
        context.watch<_ViewModel>();
        return FittedBox(
          child: Column(
            children: [
              const _Header(),
              Column(
                spacing: 2,
                children: ListTile.divideTiles(
                  context: context,
                  color: Colors.grey.shade300,
                  tiles: <Widget>[
                    ..._viewModel.sortedCropList.map((crop) => Row(
                          spacing: CropsInfoBox.horizontalSpacing,
                          children: [
                            Image(
                              image: AssetImage('assets/images/items/${crop.assetName}.png'),
                              width: CropsInfoBox.imageWidth,
                            ),
                            ...[crop.nutrient.compost, crop.nutrient.growthFormula, crop.nutrient.manure]
                                .map((nutrient) => SizedBox(
                                      width: CropsInfoBox.amountWidth,
                                      child: Text(
                                        nutrient > 0 ? '+${nutrient.toString()}' : nutrient.toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: FontFamily.pretendard,
                                          fontVariations: const [FontVariation.weight(550)],
                                          fontSize: 15,
                                          color: nutrient > 0 ? Colors.green.shade700 : Colors.red,
                                        ),
                                      ),
                                    )),
                            Container(
                              padding: const EdgeInsets.all(4),
                              width: CropsInfoBox.seasonWidth,
                              height: CropsInfoBox.seasonWidth,
                              child: _SeasonColumn(
                                seasonSet: crop.seasons,
                                sortingSeason: _viewModel._sortingSeason,
                              ),
                            ),
                          ],
                        )),
                  ],
                ).toList(),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  final _textStyle = const TextStyle(
    fontFamily: FontFamily.pretendard,
    fontSize: 12,
  );

  static const double _imageSize = 30;
  static const double _textHeight = 20;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<_ViewModel>();

    return Container(
      margin: const EdgeInsets.only(left: CropsInfoBox.imageWidth),
      child: Row(
        spacing: CropsInfoBox.horizontalSpacing,
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => viewModel.didTapHeaderOf(_SortingType.compost),
              child: SizedBox(
                width: CropsInfoBox.amountWidth,
                child: Column(
                  children: [
                    const Image(
                      image: AssetImage('assets/images/nutrients_compost_icon.png'),
                      height: _imageSize,
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: SizedBox(
                        height: _textHeight,
                        child: Text(
                          L10ns.of(context).localized('compost'),
                          style: _textStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => viewModel.didTapHeaderOf(_SortingType.growthFormula),
              child: SizedBox(
                width: CropsInfoBox.amountWidth,
                child: Column(
                  children: [
                    const Image(
                      image: AssetImage('assets/images/nutrients_growth_formula_icon.png'),
                      height: _imageSize,
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: SizedBox(
                        height: _textHeight,
                        child: Text(
                          L10ns.of(context).localized('growthFormula'),
                          style: _textStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => viewModel.didTapHeaderOf(_SortingType.manure),
              child: SizedBox(
                width: CropsInfoBox.amountWidth,
                child: Column(
                  children: [
                    const Image(
                      image: AssetImage('assets/images/nutrients_manure_icon.png'),
                      height: _imageSize,
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: SizedBox(
                        height: _textHeight,
                        child: Text(
                          L10ns.of(context).localized('manure'),
                          style: _textStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => viewModel.didTapHeaderOfSeason(),
              child: SizedBox(
                width: CropsInfoBox.seasonWidth,
                child: Column(
                  children: [
                    const Image(
                      image: AssetImage('assets/images/season_table.png'),
                      height: _imageSize,
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: SizedBox(
                        height: _textHeight,
                        child: Text(
                          L10ns.of(context).localized('season'),
                          style: _textStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SeasonColumn extends StatelessWidget {
  const _SeasonColumn({
    required this.seasonSet,
    required this.sortingSeason,
  });

  final Set<Season> seasonSet;
  final Season? sortingSeason;

  static const double _boxSize = 50.0;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<_ViewModel>();
    viewModel._sortingSeason;

    return FittedBox(
      child: SizedBox(
        width: 100,
        height: 100,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  color: _decideColor(Season.summer),
                  width: _boxSize,
                  height: _boxSize,
                ),
                Container(
                  color: _decideColor(Season.autumn),
                  width: _boxSize,
                  height: _boxSize,
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  color: _decideColor(Season.spring),
                  width: _boxSize,
                  height: _boxSize,
                ),
                Container(
                  color: _decideColor(Season.winter),
                  width: _boxSize,
                  height: _boxSize,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _decideColor(Season season) {
    if (!seasonSet.contains(season)) {
      return Colors.transparent;
    }

    if (sortingSeason == null || season == sortingSeason) {
      return season.personalColor;
    }

    return Colors.grey.shade300;
  }
}

enum _SortingType {
  compost,
  growthFormula,
  manure,
}

class _SortingRule {
  _SortingRule({
    required this.type,
    this.isAscending = false,
  });

  final _SortingType type;
  final bool isAscending;
}

class _ViewModel with ChangeNotifier {
  Season? _sortingSeason;

  _SortingRule? _sortingRule;

  List<Crop> get sortedCropList {
    final cropList = Items.crops.toList();

    final sortingSeason = _sortingSeason;
    if (sortingSeason != null) {
      cropList._sortBySeason(sortingSeason);
    }

    final sortingRule = _sortingRule;
    if (sortingRule == null) {
      return cropList;
    }

    final seasonMatchedList = cropList.takeWhile((e) => e.seasons.contains(sortingSeason)).toList();
    final remainList = cropList.skip(seasonMatchedList.length).toList();

    seasonMatchedList._sortByNutrientValueOf(sortingRule.type, ascending: sortingRule.isAscending);
    remainList._sortByNutrientValueOf(sortingRule.type, ascending: sortingRule.isAscending);

    return [...seasonMatchedList, ...remainList];
  }

  void didTapHeaderOf(_SortingType type) {
    final sortingRule = _sortingRule;
    if (sortingRule == null || sortingRule.type != type) {
      _sortingRule = _SortingRule(type: type);
    } else {
      _sortingRule = _SortingRule(type: type, isAscending: !sortingRule.isAscending);
    }
    notifyListeners();
  }

  void didTapHeaderOfSeason() {
    final sortingSeason = _sortingSeason;
    final currentIndex = (sortingSeason != null) ? Season.values.indexOf(sortingSeason) : -1;

    if (currentIndex == Season.values.length - 1) {
      _sortingSeason = null;
    } else {
      _sortingSeason = Season.values[currentIndex + 1];
    }

    notifyListeners();
  }
}

extension on List<Crop> {
  void _sortBySeason(Season season) {
    sort((a, b) {
      final aSeason = a.seasons.contains(season);
      final bSeason = b.seasons.contains(season);
      if (aSeason && !bSeason) {
        return -1;
      } else if (!aSeason && bSeason) {
        return 1;
      } else {
        return 0;
      }
    });
  }

  void _sortByNutrientValueOf(_SortingType type, {bool ascending = false}) {
    sort((a, b) {
      final aValue = a._nutrientValueBy(type);
      final bValue = b._nutrientValueBy(type);
      if (ascending) {
        return aValue.compareTo(bValue);
      } else {
        return bValue.compareTo(aValue);
      }
    });
  }
}

extension on Crop {
  int _nutrientValueBy(_SortingType type) {
    switch (type) {
      case _SortingType.compost:
        return nutrient.compost;
      case _SortingType.growthFormula:
        return nutrient.growthFormula;
      case _SortingType.manure:
        return nutrient.manure;
    }
  }
}
