import 'package:dst_helper/farm_page/farm_plant/farm_plant_data.dart';
import 'package:dst_helper/farm_page/farm_plant/farm_plant_set.dart';
import 'package:dst_helper/farm_page/farm_plant/farm_plant_set_data.dart';
import 'package:dst_helper/models/dst_object.dart';
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

  FarmPlantSetData _farmPlantSetData = SingleFarmPlantSetData(
    farmPlantData: BasicFarmPlantData.empty(),
  );

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18.0),
        ),
        padding: const EdgeInsets.all(18.0),
        // width: 900,
        // height: 400,
        child: Row(
          spacing: 26,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
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
                Text('적합 계절: ${_farmPlantSetData.suitableSeasons.map((season) => season.name)}'),
                if (_farmPlantSetData.farmPlantDataList.every((farmPlant) => farmPlant.hasBalancedNutrients) &&
                    _farmPlantSetData.farmPlantDataList.any((e) => e.plants.any((plant) => plant is CropObject)))
                  const Text('영양소 충족!'),
              ],
            ),
            Column(
              spacing: 8.0,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 8.0),
                  width: 400,
                  // height: 40,
                  child: const TextField(
                    decoration: InputDecoration(
                      labelText: 'Title',
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
                    const Text('Crops'),
                    buildCropSelectionTable(),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Fertilizers'),
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
}
