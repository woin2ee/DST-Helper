import 'package:dst_helper/farm_page/farm_plant/edit_farm_set.dart';
import 'package:dst_helper/farm_page/farm_plant/farm_plant_card.dart';
import 'package:dst_helper/farm_page/farm_plant/farm_plant_set.dart';
import 'package:dst_helper/farm_page/farm_plant/farm_plant_set_data.dart';
import 'package:dst_helper/farm_page/farm_plant/farm_plant_set_data_sample.dart';
import 'package:dst_helper/farm_page/side_info_box/side_info_box.dart';
import 'package:dst_helper/models/localization.dart';
import 'package:dst_helper/models/season.dart';
import 'package:flutter/material.dart';

class FarmPage extends StatefulWidget {
  const FarmPage({super.key});

  @override
  State<StatefulWidget> createState() => _FarmPageState();
}

class _FarmPageState extends State<FarmPage> {
  final List<(Season, bool)> _selectedSeasonState = [
    (Season.spring, true),
    (Season.summer, false),
    (Season.autumn, false),
    (Season.winter, false),
  ];

  Season get selectedSeason => _selectedSeasonState.firstWhere((element) => element.$2 == true).$1;

  final List<FarmPlantSetData> _farmPlantSetDataList = [
    FarmPlantSetDataSample.preDefined1,
    FarmPlantSetDataSample.preDefined2,
    FarmPlantSetDataSample.preDefined3,
    FarmPlantSetDataSample.preDefined4,
    FarmPlantSetDataSample.preDefined5,
    FarmPlantSetDataSample.preDefined6,
    FarmPlantSetDataSample.preDefined7,
    FarmPlantSetDataSample.preDefined8,
    FarmPlantSetDataSample.preDefined9,
    FarmPlantSetDataSample.preDefined10,
    FarmPlantSetDataSample.preDefined11,
  ];

  List<FarmPlantSetData> _farmPlantSetDataListForSuitableSeason(Season season) {
    return _farmPlantSetDataList.where((farmPlantSetData) {
      return farmPlantSetData.suitableSeasons.contains(season);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    Iterable<FarmPlantSetData> springFarmPlantSetDataList = _farmPlantSetDataList.where((farmPlantSetData) {
      return farmPlantSetData.suitableSeasons.contains(Season.spring);
    });

    return Theme(
      data: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: selectedSeason.personalColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: WeatherSelectionButton(
                        onSelected: (index) {
                          setState(() {
                            for (var i = 0; i < Season.values.length; i++) {
                              _selectedSeasonState[i] = (_selectedSeasonState[i].$1, i == index);
                            }
                          });
                        },
                        selectedSeasonState: _selectedSeasonState.map((element) => element.$2).toList(),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        final result = showDialog(
                          barrierColor: Colors.black.withOpacity(0.35),
                          // barrierDismissible: false,
                          context: context,
                          builder: (context) => const Dialog(
                            child: EditFarmSet(),
                          ),
                        );
                        result.then((farmPlantSetData) {
                          // farmPlantSetData as FarmPlantSetData;
                          setState(() {
                            _farmPlantSetDataList.add(farmPlantSetData);
                          });
                        });
                      },
                      child: const Text('New'),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: FarmList(
                      farmPlantSetDataList: _farmPlantSetDataListForSuitableSeason(selectedSeason),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SideInfoBox(),
        ],
      ),
    );
  }
}

class WeatherSelectionButton extends StatelessWidget {
  const WeatherSelectionButton({
    super.key,
    required this.onSelected,
    required this.selectedSeasonState,
  });

  final Function(int) onSelected;
  final List<bool> selectedSeasonState;

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      borderRadius: BorderRadius.circular(10),
      constraints: const BoxConstraints(
        minWidth: 70,
        minHeight: 40,
      ),
      isSelected: selectedSeasonState,
      onPressed: onSelected,
      children: [
        ...Season.values.map((season) => Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0,
              ),
              child: Text(
                season.localizedName(context),
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            )),
      ],
    );
  }
}

class FarmList extends StatelessWidget {
  const FarmList({
    super.key,
    // required this.selectedSeason,
    required this.farmPlantSetDataList,
  });

  // final Season selectedSeason;
  final List<FarmPlantSetData> farmPlantSetDataList;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: Wrap(
          spacing: 10.0,
          runSpacing: 10.0,
          children: [
            ...farmPlantSetDataList.map((farmPlantSetData) => FittedBox(
                  child: FarmPlantCard(farmPlantSet: FarmPlantSet(farmPlantSetData: farmPlantSetData)),
                )),
          ],
          // switch (selectedSeason) {
          //   Season.spring => [
          //       FittedBox(
          //         child:
          //             FarmPlantCard(farmPlantSet: FarmPlantSet(farmPlantSetData: FarmPlantSetDataSample.preDefined1)),
          //       ),
          //       FittedBox(
          //         child:
          //             FarmPlantCard(farmPlantSet: FarmPlantSet(farmPlantSetData: FarmPlantSetDataSample.preDefined1)),
          //       ),
          //       FittedBox(
          //         child:
          //             FarmPlantCard(farmPlantSet: FarmPlantSet(farmPlantSetData: FarmPlantSetDataSample.preDefined2)),
          //       ),
          //       FittedBox(
          //         child:
          //             FarmPlantCard(farmPlantSet: FarmPlantSet(farmPlantSetData: FarmPlantSetDataSample.preDefined4)),
          //       ),
          //       FittedBox(
          //         child:
          //             FarmPlantCard(farmPlantSet: FarmPlantSet(farmPlantSetData: FarmPlantSetDataSample.preDefined5)),
          //       ),
          //       FittedBox(
          //         child:
          //             FarmPlantCard(farmPlantSet: FarmPlantSet(farmPlantSetData: FarmPlantSetDataSample.preDefined6)),
          //       ),
          //       FittedBox(
          //         child:
          //             FarmPlantCard(farmPlantSet: FarmPlantSet(farmPlantSetData: FarmPlantSetDataSample.preDefined8)),
          //       ),
          //       FittedBox(
          //         child:
          //             FarmPlantCard(farmPlantSet: FarmPlantSet(farmPlantSetData: FarmPlantSetDataSample.preDefined11)),
          //       ),
          //     ],
          //   Season.summer => [
          //       FittedBox(
          //         child:
          //             FarmPlantCard(farmPlantSet: FarmPlantSet(farmPlantSetData: FarmPlantSetDataSample.preDefined2)),
          //       ),
          //       FittedBox(
          //         child:
          //             FarmPlantCard(farmPlantSet: FarmPlantSet(farmPlantSetData: FarmPlantSetDataSample.preDefined4)),
          //       ),
          //       FittedBox(
          //         child:
          //             FarmPlantCard(farmPlantSet: FarmPlantSet(farmPlantSetData: FarmPlantSetDataSample.preDefined5)),
          //       ),
          //       FittedBox(
          //         child:
          //             FarmPlantCard(farmPlantSet: FarmPlantSet(farmPlantSetData: FarmPlantSetDataSample.preDefined9)),
          //       ),
          //     ],
          //   Season.autumn => [
          //       FittedBox(
          //         child:
          //             FarmPlantCard(farmPlantSet: FarmPlantSet(farmPlantSetData: FarmPlantSetDataSample.preDefined1)),
          //       ),
          //       FittedBox(
          //         child:
          //             FarmPlantCard(farmPlantSet: FarmPlantSet(farmPlantSetData: FarmPlantSetDataSample.preDefined3)),
          //       ),
          //       FittedBox(
          //         child:
          //             FarmPlantCard(farmPlantSet: FarmPlantSet(farmPlantSetData: FarmPlantSetDataSample.preDefined6)),
          //       ),
          //       FittedBox(
          //         child:
          //             FarmPlantCard(farmPlantSet: FarmPlantSet(farmPlantSetData: FarmPlantSetDataSample.preDefined9)),
          //       ),
          //       FittedBox(
          //         child:
          //             FarmPlantCard(farmPlantSet: FarmPlantSet(farmPlantSetData: FarmPlantSetDataSample.preDefined10)),
          //       ),
          //     ],
          //   Season.winter => [
          //       FittedBox(
          //         child:
          //             FarmPlantCard(farmPlantSet: FarmPlantSet(farmPlantSetData: FarmPlantSetDataSample.preDefined3)),
          //       ),
          //       FittedBox(
          //         child:
          //             FarmPlantCard(farmPlantSet: FarmPlantSet(farmPlantSetData: FarmPlantSetDataSample.preDefined7)),
          //       ),
          //       FittedBox(
          //         child:
          //             FarmPlantCard(farmPlantSet: FarmPlantSet(farmPlantSetData: FarmPlantSetDataSample.preDefined10)),
          //       ),
          //     ],
          // },
        ),
      ),
    );
  }
}
