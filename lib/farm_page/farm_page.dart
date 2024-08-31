import 'dart:async';
import 'dart:convert';

import 'package:dst_helper/farm_page/farm_plant/edit_farm_set.dart';
import 'package:dst_helper/farm_page/farm_plant/farm_plant_card.dart';
import 'package:dst_helper/farm_page/farm_plant/farm_plant_set.dart';
import 'package:dst_helper/farm_page/farm_plant/models/farm_plant_set_data.dart';
import 'package:dst_helper/farm_page/farm_plant/models/farm_plant_set_data_sample.dart';
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

  Future<List<FarmPlantSetData>> _farmPlantSetDataList = Future.value([]);

  void _addNewFarmPlantSetData(FarmPlantSetData data) async {
    final prefs = await _prefs;
    final farmPlantSetDataList = await _farmPlantSetDataList;
    List<FarmPlantSetData> copy = List.from(farmPlantSetDataList);
    copy.add(data);
    final jsonString = jsonEncode(copy);
    await prefs.setString('farmPlantSetDataListJson', jsonString);
    setState(() {
      _farmPlantSetDataList = Future.value(copy);
    });
  }

  Future<void> _resetFarmPlantSetDataList() async {
    final prefs = await _prefs;
    setState(() {
      _farmPlantSetDataList = Future.value(FarmPlantSetDataSample.preDefinedList);
    });
    final farmPlantSetDataList = await _farmPlantSetDataList;
    final jsonString = jsonEncode(farmPlantSetDataList);
    return prefs.setString('farmPlantSetDataListJson', jsonString);
  }

  @override
  void initState() {
    super.initState();
    _prefs.then((prefs) {
      final farmPlantSetDataListJson = prefs.getString('farmPlantSetDataListJson');
      if (farmPlantSetDataListJson == null) {
        _resetFarmPlantSetDataList();
        return;
      }
      final List<dynamic> decodedList = jsonDecode(farmPlantSetDataListJson);
      final loadedData = List<FarmPlantSetData>.of(decodedList.map((e) => FarmPlantSetData.fromJson(e)));
      setState(() {
        _farmPlantSetDataList = Future.value(loadedData);
      });
    });
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
          if (farmPlantSetData is FarmPlantSetData) {
            _addNewFarmPlantSetData(farmPlantSetData);
          }
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
                    child: FutureBuilder(
                      future: _farmPlantSetDataList,
                      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                          case ConnectionState.waiting:
                            return const Center(child: Text('Loading...'));
                          case ConnectionState.active:
                          case ConnectionState.done:
                            if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            }
                            if (snapshot.hasData) {
                              final data = snapshot.data as List<FarmPlantSetData>;
                              final selectedSeasonData = data.where((farmPlantSetData) {
                                return farmPlantSetData.suitableSeasons.contains(selectedSeason);
                              });
                              return FarmList(farmPlantSetDataList: selectedSeasonData.toList());
                            }
                            return const Text('There is no data');
                        }
                      },
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
