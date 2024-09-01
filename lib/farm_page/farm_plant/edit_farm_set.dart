import 'package:dst_helper/farm_page/farm_plant/farm_plant_set.dart';
import 'package:dst_helper/farm_page/farm_plant/models/farm_plant_card_model.dart';
import 'package:dst_helper/farm_page/farm_plant/models/farm_plant_model.dart';
import 'package:dst_helper/farm_page/farm_plant/models/farm_plant_set_model.dart';
import 'package:dst_helper/farm_page/side_info_box/crops_info_box.dart';
import 'package:dst_helper/farm_page/side_info_box/fertilizers_info_box.dart';
import 'package:dst_helper/localization/text_localizations.dart';
import 'package:dst_helper/models/v2/item/item.dart';
import 'package:dst_helper/models/v2/localization.dart';
import 'package:flutter/material.dart';

class EditFarmSet extends StatefulWidget {
  const EditFarmSet({super.key});

  @override
  State<EditFarmSet> createState() => _EditFarmSetState();
}

class _EditFarmSetState extends State<EditFarmSet> {
  Crop? _selectedCrop;
  Fertilizer? _selectedFertilizer;
  final TextEditingController _titleTextEditingController = TextEditingController();
  FarmPlantSetStyle _selectedFarmPlantSetStyle = FarmPlantSetStyle.single;
  FarmPlantStyle _selectedFarmPlantStyle = FarmPlantStyle.basic;
  bool _hasChanges = false;

  FarmPlantSetModel _farmPlantSetData =
      FarmPlantSetModel.single(farmPlantModel: FarmPlantModel.empty(FarmPlantStyle.basic));

  bool get _anyPlantIsPlaced {
    return _farmPlantSetData.farmPlantModelList.any((e) => e.plants.any((plant) => plant is Crop));
  }

  bool get _everyFarmPlantHasBalancedNutrients {
    return _farmPlantSetData.farmPlantModelList.every((farmPlant) => farmPlant.hasBalancedNutrients);
  }

  int? _calculateCountOfFertilizerNeeded() {
    final selectedFertilizer = _selectedFertilizer;
    if (selectedFertilizer == null) return null;

    var totalNutrientsByFarmPlant =
        _farmPlantSetData.farmPlantModelList.map((farmPlantData) => farmPlantData.totalNutrient);

    bool allNutrientsValid() {
      return totalNutrientsByFarmPlant
          .every((nutrient) => nutrient.compost >= 0 && nutrient.growthFormula >= 0 && nutrient.manure >= 0);
    }

    if (allNutrientsValid()) {
      return 0;
    }

    // The max count is 10, because a farm plant can have a maximum of 10 plants and its maximum negative value is -80.
    // And a minimum amount of nutrient's positive value is 8, thus it is.
    for (var i = 0; i < 10; i++) {
      totalNutrientsByFarmPlant = totalNutrientsByFarmPlant.map((nutrient) => nutrient + selectedFertilizer.nutrient);
      if (allNutrientsValid()) {
        return i + 1;
      }
    }

    return null;
  }

  Column buildCropSelectionTable() {
    const int countOfRow = 7;
    final int countOfColumn = (Crops.crops.length / countOfRow).ceil();
    const double spacing = 4;

    final cropSelectionTable = Column(
      spacing: spacing,
      children: [
        for (int column = 0; column < countOfColumn; column++)
          Row(
            spacing: spacing,
            children: [
              for (int row = 0; row < countOfRow; row++)
                if (Crops.crops.elementAtOrNull(countOfRow * column + row) != null)
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _selectedCrop = Crops.crops[countOfRow * column + row];
                      });
                    },
                    icon: Image(
                      image: AssetImage('assets/images/items/${Crops.crops[countOfRow * column + row].assetName}.png'),
                      width: 40,
                      height: 40,
                    ),
                    style: IconButton.styleFrom(
                      backgroundColor: _selectedCrop == Crops.crops[countOfRow * column + row]
                          ? Colors.blue.shade100
                          : Colors.transparent,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: _selectedCrop == Crops.crops[countOfRow * column + row]
                              ? Colors.blue
                              : Colors.grey.shade400,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
            ],
          ),
      ],
    );
    return cropSelectionTable;
  }

  Column buildFertilizerSelectionTable() {
    const double spacing = 4;
    const List<List<Fertilizer>> fertilizerList = [
      Fertilizers.compostList,
      Fertilizers.growthFormulaList,
      Fertilizers.manureList,
      Fertilizers.mixList,
    ];
    return Column(
      spacing: spacing,
      children: [
        ...fertilizerList.map((fertilizers) => Row(
              spacing: spacing,
              children: [
                ...fertilizers.map((fertilizer) => IconButton(
                      onPressed: () {
                        setState(() {
                          _selectedFertilizer = (_selectedFertilizer == fertilizer) ? null : fertilizer;
                        });
                      },
                      icon: Image(
                        image: AssetImage('assets/images/items/${fertilizer.assetName}.png'),
                        width: 40,
                        height: 40,
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: _selectedFertilizer == fertilizer ? Colors.blue.shade100 : Colors.transparent,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: _selectedFertilizer == fertilizer ? Colors.blue : Colors.grey.shade400,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    )),
              ],
            )),
      ],
    );
  }

  Text? get nutrientsText {
    if (_everyFarmPlantHasBalancedNutrients && _anyPlantIsPlaced) {
      return Text('${TextLocalizations.of(context)!.localized('balanced_nutrients')}!');
    }

    final countOfFertilizerNeeded = _calculateCountOfFertilizerNeeded();
    if (countOfFertilizerNeeded != null) {
      return Text('영양소 충족! (성장 단계 마다 각 밭에 $countOfFertilizerNeeded번 비료를 줘야합니다.)');
    }

    return null;
  }

  /// Shows a dialog and resolves to true when the user has indicated that they
  /// want to pop.
  ///
  /// A return value of null indicates a desire not to pop, such as when the
  /// user has dismissed the modal without tapping a button.
  Future<bool?> _showBackDialog() {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are you sure?'),
          content: const Text(
            'Are you sure you want to leave this page?',
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Nevermind'),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Leave'),
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _titleTextEditingController.addListener(() {
      _hasChanges = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final farmPlantSetStyleSelectionBox = Row(
      spacing: 10.0,
      children: [
        ...FarmPlantSetStyle.values.map((style) => OutlinedButton(
              onPressed: () {
                switch (style) {
                  case FarmPlantSetStyle.single:
                    setState(() {
                      _selectedFarmPlantSetStyle = FarmPlantSetStyle.single;
                      _farmPlantSetData =
                          FarmPlantSetModel.single(farmPlantModel: _farmPlantSetData.farmPlantModelList[0]);
                    });
                  case FarmPlantSetStyle.double:
                    setState(() {
                      _selectedFarmPlantSetStyle = FarmPlantSetStyle.double;
                      _farmPlantSetData = FarmPlantSetModel.double(
                        left: _farmPlantSetData.farmPlantModelList[0],
                        right: _farmPlantSetData.farmPlantModelList.elementAtOrNull(1) ??
                            _selectedFarmPlantStyle.emptyData,
                      );
                    });
                  case FarmPlantSetStyle.square:
                    setState(() {
                      _selectedFarmPlantSetStyle = FarmPlantSetStyle.square;

                      if (_selectedFarmPlantStyle == FarmPlantStyle.basic) {
                        _farmPlantSetData = FarmPlantSetModel.square(
                          topLeft: FarmPlantModel.basicWithPlants(_farmPlantSetData.farmPlantModelList[0].plants),
                          topRight: FarmPlantModel.basicWithPlants(
                              _farmPlantSetData.farmPlantModelList.elementAtOrNull(1)?.plants ??
                                  _selectedFarmPlantStyle.emptyData.plants),
                          bottomLeft: FarmPlantModel.basicWithPlants(
                              _farmPlantSetData.farmPlantModelList.elementAtOrNull(2)?.plants ??
                                  _selectedFarmPlantStyle.emptyData.plants),
                          bottomRight: FarmPlantModel.basicWithPlants(
                              _farmPlantSetData.farmPlantModelList.elementAtOrNull(3)?.plants ??
                                  _selectedFarmPlantStyle.emptyData.plants),
                        );
                      } else {
                        _selectedFarmPlantStyle = FarmPlantStyle.basic;
                        _farmPlantSetData = FarmPlantSetModel.square(
                          topLeft: FarmPlantModel.empty(FarmPlantStyle.basic),
                          topRight: FarmPlantModel.empty(FarmPlantStyle.basic),
                          bottomLeft: FarmPlantModel.empty(FarmPlantStyle.basic),
                          bottomRight: FarmPlantModel.empty(FarmPlantStyle.basic),
                        );
                      }
                    });
                }
              },
              child: Text(style.name),
            )),
      ],
    );

    final farmPlantStyleSelectionBox = Row(
      spacing: 10,
      children: <Widget>[
        ...FarmPlantStyle.values.map((style) => OutlinedButton(
              onPressed: switch (_selectedFarmPlantSetStyle) {
                FarmPlantSetStyle.single => () {
                    setState(() {
                      if (_selectedFarmPlantStyle == style) return;
                      _selectedFarmPlantStyle = style;
                      _farmPlantSetData = FarmPlantSetModel.single(farmPlantModel: FarmPlantModel.empty(style));
                    });
                  },
                FarmPlantSetStyle.double => () {
                    setState(() {
                      if (_selectedFarmPlantStyle == style) return;
                      _selectedFarmPlantStyle = style;
                      _farmPlantSetData = FarmPlantSetModel.double(
                        left: FarmPlantModel.empty(style),
                        right: FarmPlantModel.empty(style),
                      );
                    });
                  },
                FarmPlantSetStyle.square => switch (style) {
                    FarmPlantStyle.basic => () {},
                    FarmPlantStyle.dense => null,
                    FarmPlantStyle.reverseDense => null,
                  },
              },
              child: Text(style.name),
            )),
      ],
    );

    return FittedBox(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18.0),
        ),
        padding: const EdgeInsets.all(18.0),
        child: Row(
          spacing: 26,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              spacing: 30,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FertilizersInfoBox(),
                CropsInfoBox(),
              ],
            ),
            Column(
              spacing: 10,
              children: [
                Container(
                  color: Colors.black54,
                  width: 380,
                  height: 380,
                  child: Center(
                    child: FarmPlantSet(
                      farmPlantSetData: _farmPlantSetData,
                      onPressed: (farmPlantIndex, plantIndex) {
                        final Plant? currentPlant =
                            _farmPlantSetData.farmPlantModelList[farmPlantIndex].plants[plantIndex];
                        _hasChanges = true;
                        setState(() {
                          _farmPlantSetData.farmPlantModelList[farmPlantIndex].plants[plantIndex] =
                              currentPlant == _selectedCrop ? null : _selectedCrop;
                        });
                      },
                    ),
                  ),
                ),
                if (_anyPlantIsPlaced)
                  Text(
                      '${TextLocalizations.of(context)!.localized('suitable_seasons')}: ${_farmPlantSetData.suitableSeasons.map((season) => season.localizedName(context))}'),
                if (nutrientsText != null) nutrientsText!,
              ],
            ),
            Column(
              spacing: 16.0,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 8.0),
                  width: 400,
                  child: TextField(
                    controller: _titleTextEditingController,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: 'Name',
                      hintText: (_anyPlantIsPlaced)
                          ? '${_farmPlantSetData.suitableSeasons.map((season) => season.localizedName(context))}'
                          : '',
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                farmPlantStyleSelectionBox,
                farmPlantSetStyleSelectionBox,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text(
                        TextLocalizations.of(context)!.localized('crops'),
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    buildCropSelectionTable(),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Row(
                        spacing: 10,
                        children: [
                          Text(
                            TextLocalizations.of(context)!.localized('fertilizers'),
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                          const Text(
                            '(모든 밭에 같은 비료를 사용한다고 가정합니다.)',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    buildFertilizerSelectionTable(),
                  ],
                ),
                Row(
                  spacing: 18,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    PopScope(
                      canPop: !_hasChanges,
                      onPopInvokedWithResult: (didPop, result) async {
                        if (didPop) return;
                        final bool shouldPop = await _showBackDialog() ?? false;
                        if (context.mounted && shouldPop) {
                          Navigator.pop(context);
                        }
                      },
                      child: ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.red),
                          foregroundColor: WidgetStatePropertyAll(Colors.white),
                        ),
                        onPressed: () {
                          _hasChanges ? Navigator.maybePop(context) : Navigator.pop(context);
                        },
                        child: Text(
                          TextLocalizations.of(context)!.localized('cancel'),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.blue),
                        foregroundColor: WidgetStatePropertyAll(Colors.white),
                      ),
                      onPressed: () {
                        final model = FarmPlantCardModel(
                          title: _titleTextEditingController.text.isNotEmpty
                              ? _titleTextEditingController.text
                              : '${_farmPlantSetData.suitableSeasons.map((season) => season.localizedName(context))}',
                          farmPlantSetModel: _farmPlantSetData,
                        );
                        Navigator.pop(context, model);
                      },
                      child: Text(
                        TextLocalizations.of(context)!.localized('add'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

extension on FarmPlantStyle {
  FarmPlantModel get emptyData {
    switch (this) {
      case FarmPlantStyle.basic:
        return FarmPlantModel.empty(FarmPlantStyle.basic);
      case FarmPlantStyle.dense:
        return FarmPlantModel.empty(FarmPlantStyle.dense);
      case FarmPlantStyle.reverseDense:
        return FarmPlantModel.empty(FarmPlantStyle.dense);
    }
  }
}
