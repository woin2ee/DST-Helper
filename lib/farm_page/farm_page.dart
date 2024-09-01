import 'dart:async';
import 'dart:convert';

import 'package:dst_helper/farm_page/farm_list.dart';
import 'package:dst_helper/farm_page/farm_plant/edit_farm_set.dart';
import 'package:dst_helper/farm_page/farm_plant/models/farm_page_model.dart';
import 'package:dst_helper/farm_page/farm_plant/models/farm_plant_card_model.dart';
import 'package:dst_helper/farm_page/farm_plant/models/farm_plant_set_model_sample.dart';
import 'package:dst_helper/farm_page/season_selection_box.dart';
import 'package:dst_helper/farm_page/side_info_box/side_info_box.dart';
import 'package:dst_helper/models/v1/season.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
        'farmPlantCardModelList',
      },
    ),
  );

  Future<FarmPlantCardModel> _addFarmPlantCardModel(FarmPlantCardModel model) async {
    final prefs = await _prefs;
    final farmPlantCardModelList = await _getFarmPlantCardList();
    farmPlantCardModelList.add(model);
    final jsonString = jsonEncode(farmPlantCardModelList);
    await prefs.setString('farmPlantCardModelList', jsonString);
    return model;
  }

  Future<List<FarmPlantCardModel>> _getFarmPlantCardList() async {
    final prefs = await _prefs;
    final jsonString = prefs.getString('farmPlantCardModelList');
    if (jsonString == null) {
      final sampleData = FarmPlantSetModelSample.preDefinedList.map((sample) {
        return FarmPlantCardModel(farmPlantSetModel: sample);
      });
      return sampleData.toList();
    }
    final List<dynamic> decodedList = jsonDecode(jsonString);
    final loadedData = List<FarmPlantCardModel>.of(decodedList.map((e) => FarmPlantCardModel.fromJson(e)));
    return loadedData;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => FarmPageModel(
        initSeason: Season.spring,
        farmPlantCardList: _getFarmPlantCardList(),
      ),
      child: Builder(builder: (context) {
        return Theme(
          data: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: context.watch<FarmPageModel>().selectedSeason.personalColor),
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
                          SeasonSelectionBox(),
                          ElevatedButton(
                            onPressed: () async {
                              final result = await showDialog(
                                barrierColor: Colors.black.withOpacity(0.35),
                                context: context,
                                builder: (context) => const Dialog(
                                  child: EditFarmSet(),
                                ),
                              );
                              if (result is FarmPlantCardModel) {
                                await _addFarmPlantCardModel(result);
                                if (context.mounted) {
                                  context.read<FarmPageModel>().addFarmPlantCard(result);
                                }
                              }
                            },
                            child: const Text('New'),
                          ),
                        ],
                      ),
                    ),
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 8, right: 8),
                        child: FarmList(),
                      ),
                    ),
                  ],
                ),
              ),
              const SideInfoBox(),
            ],
          ),
        );
      }),
    );
  }
}
