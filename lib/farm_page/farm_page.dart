import 'dart:convert';

import 'package:dst_helper/farm_page/farm_plant/edit_farm_set.dart';
import 'package:dst_helper/farm_page/farm_plant/farm_plant_card.dart';
import 'package:dst_helper/farm_page/farm_plant/farm_plant_set.dart';
import 'package:dst_helper/farm_page/farm_plant/farm_plant_set_data.dart';
import 'package:dst_helper/farm_page/farm_plant/farm_plant_set_data_sample.dart';
import 'package:dst_helper/farm_page/side_info_box/side_info_box.dart';
import 'package:dst_helper/models/v1/localization/season_localization.dart';
import 'package:dst_helper/models/v1/season.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FarmPage extends StatefulWidget {
  const FarmPage({super.key});

  @override
  State<StatefulWidget> createState() => _FarmPageState();
}

class _FarmPageState extends State<FarmPage> {
  final Future<SharedPreferencesWithCache> _prefs = SharedPreferencesWithCache.create(
    cacheOptions: const SharedPreferencesWithCacheOptions(
      allowList: {
        'selectedSeasonStateJson',
        'farmPlantSetDataListJson',
      },
    ),
  );

  final List<(Season, bool)> _selectedSeasonState = [
    (Season.spring, true),
    (Season.summer, false),
    (Season.autumn, false),
    (Season.winter, false),
  ];

  List<FarmPlantSetData> _farmPlantSetDataList = [
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
  void initState() {
    super.initState();
    _prefs.then((prefs) {
      final farmPlantSetDataListJson = prefs.getString('farmPlantSetDataListJson');
      if (farmPlantSetDataListJson == null) {
        _farmPlantSetDataList = FarmPlantSetDataSample.preDefinedList;
        return;
      }
      final jsonObject = jsonDecode(farmPlantSetDataListJson) as Map<String, dynamic>;

      throw UnimplementedError();
    });

    // List<FarmPlantSetData>;

    // List.fromJson

    // [1, 2, 3].to
  }

  @override
  Widget build(BuildContext context) {
    Season selectedSeason = _selectedSeasonState.firstWhere((element) => element.$2 == true).$1;

    final seasonSelectionBox = ToggleButtons(
      borderRadius: BorderRadius.circular(10),
      constraints: const BoxConstraints(
        minWidth: 70,
        minHeight: 40,
      ),
      isSelected: _selectedSeasonState.map((element) => element.$2).toList(),
      onPressed: (index) {
        setState(() {
          for (var i = 0; i < Season.values.length; i++) {
            _selectedSeasonState[i] = (_selectedSeasonState[i].$1, i == index);
          }
        });
      },
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

    final newButton = ElevatedButton(
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
          setState(() {
            _farmPlantSetDataList.add(farmPlantSetData);
          });
        });
      },
      child: const Text('New'),
    );

    return Theme(
      data: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: selectedSeason.personalColor),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    spacing: 12,
                    children: [
                      seasonSelectionBox,
                      newButton,
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: FarmList(
                      farmPlantSetDataList: _farmPlantSetDataListForSuitableSeason(selectedSeason),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SideInfoBox(),
        ],
      ),
    );
  }
}

class FarmList extends StatelessWidget {
  const FarmList({
    super.key,
    required this.farmPlantSetDataList,
  });

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
        ),
      ),
    );
  }
}
