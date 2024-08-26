import 'package:dst_helper/farm_page/farm_plant/farm_plant_data.dart';
import 'package:dst_helper/farm_page/farm_plant/farm_plant_set.dart';
import 'package:dst_helper/farm_page/farm_plant/farm_plant_set_data.dart';
import 'package:dst_helper/farm_page/side_info_box/fertilizers_info_box.dart';
import 'package:dst_helper/farm_page/side_info_box/nutrients_info_box.dart';
import 'package:dst_helper/models/dst_object.dart';
import 'package:dst_helper/models/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditFarmSet extends StatefulWidget {
  const EditFarmSet({super.key});

  @override
  State<EditFarmSet> createState() => _EditFarmSetState();
}

class _EditFarmSetState extends State<EditFarmSet> {
  CropObject? _selectedCrop;
  FertilizerObject? _selectedFertilizer;
  final TextEditingController _titleTextEditingController = TextEditingController();

  FarmPlantSetData _farmPlantSetData = SingleFarmPlantSetData(
    farmPlantData: BasicFarmPlantData.empty(),
  );

  bool get _anyPlantIsPlaced {
    return _farmPlantSetData.farmPlantDataList.any((e) => e.plants.any((plant) => plant is CropObject));
  }

  bool get _everyFarmPlantHasBalancedNutrients {
    return _farmPlantSetData.farmPlantDataList.every((farmPlant) => farmPlant.hasBalancedNutrients);
  }

  int? _calculateCountOfFertilizerNeeded() {
    final selectedFertilizer = _selectedFertilizer;
    if (selectedFertilizer == null) return null;

    var totalNutrientsByFarmPlant =
        _farmPlantSetData.farmPlantDataList.map((farmPlantData) => farmPlantData.totalNutrient);

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
    final int countOfColumn = (Plants.crops.length / countOfRow).ceil();
    const double spacing = 4;

    final cropSelectionTable = Column(
      spacing: spacing,
      children: [
        for (int column = 0; column < countOfColumn; column++)
          Row(
            spacing: spacing,
            children: [
              for (int row = 0; row < countOfRow; row++)
                if (Plants.crops.elementAtOrNull(countOfRow * column + row) != null)
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _selectedCrop = Plants.crops[countOfRow * column + row];
                      });
                    },
                    icon: Image(
                      image: AssetImage('assets/images/items/${Plants.crops[countOfRow * column + row].assetName}.png'),
                      width: 40,
                      height: 40,
                    ),
                    style: IconButton.styleFrom(
                      backgroundColor: _selectedCrop == Plants.crops[countOfRow * column + row]
                          ? Colors.blue.shade100
                          : Colors.transparent,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: _selectedCrop == Plants.crops[countOfRow * column + row]
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
    const List<List<FertilizerObject>> fertilizerList = [
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
      return const Text('영양소 충족!');
    }

    final countOfFertilizerNeeded = _calculateCountOfFertilizerNeeded();
    if (countOfFertilizerNeeded != null) {
      return Text('영양소 충족! (성장 단계 마다 각 밭에 $countOfFertilizerNeeded번 비료를 줘야합니다.)');
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
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
                NutrientsInfoBox(),
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
                        setState(() {
                          final PlantObject? currentPlant =
                              _farmPlantSetData.farmPlantDataList[farmPlantIndex].plants[plantIndex];
                          _farmPlantSetData.farmPlantDataList[farmPlantIndex].plants[plantIndex] =
                              currentPlant == _selectedCrop ? null : _selectedCrop;
                        });
                      },
                    ),
                  ),
                ),
                if (_anyPlantIsPlaced)
                  Text('적합 계절: ${_farmPlantSetData.suitableSeasons.map((season) => season.localizedName(context))}'),
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
                Row(
                  spacing: 10.0,
                  children: [
                    ...FarmPlantSetStyle.values.map((style) => OutlinedButton(
                          onPressed: () {
                            switch (style) {
                              case FarmPlantSetStyle.single:
                                setState(() {
                                  _farmPlantSetData = SingleFarmPlantSetData(
                                    farmPlantData: _farmPlantSetData.farmPlantDataList[0],
                                  );
                                });
                              case FarmPlantSetStyle.double:
                                setState(() {
                                  _farmPlantSetData = DoubleFarmPlantSetData(
                                    left: _farmPlantSetData.farmPlantDataList[0],
                                    right: _farmPlantSetData.farmPlantDataList.elementAtOrNull(1) ??
                                        BasicFarmPlantData.empty(),
                                  );
                                });
                              case FarmPlantSetStyle.square:
                                setState(() {
                                  _farmPlantSetData = SquareFarmPlantSetData(
                                    topLeft: _farmPlantSetData.farmPlantDataList[0],
                                    topRight: _farmPlantSetData.farmPlantDataList.elementAtOrNull(1) ??
                                        BasicFarmPlantData.empty(),
                                    bottomLeft: _farmPlantSetData.farmPlantDataList.elementAtOrNull(2) ??
                                        BasicFarmPlantData.empty(),
                                    bottomRight: _farmPlantSetData.farmPlantDataList.elementAtOrNull(3) ??
                                        BasicFarmPlantData.empty(),
                                  );
                                });
                            }
                          },
                          child: Text(style.name),
                        )),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text(
                        AppLocalizations.of(context)!.crops,
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
                            AppLocalizations.of(context)!.fertilizers,
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
                    ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.red),
                        foregroundColor: WidgetStatePropertyAll(Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(AppLocalizations.of(context)!.cancel),
                    ),
                    ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.blue),
                        foregroundColor: WidgetStatePropertyAll(Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pop(context, _farmPlantSetData);
                      },
                      child: Text(AppLocalizations.of(context)!.add),
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
