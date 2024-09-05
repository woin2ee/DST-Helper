import 'dart:collection';
import 'dart:convert';

import 'package:dst_helper/farm_page/farm_list/farm_plant_card/farm_plant_card_model.dart';
import 'package:dst_helper/farm_page/farm_list/farm_plant_set/farm_plant_set_model_sample.dart';
import 'package:dst_helper/models/v1/season.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'farm_page_model.g.dart';

enum _CacheKey {
  farmPlantCardModelList,
}

@JsonSerializable()
class FarmPageModel extends ChangeNotifier {
  FarmPageModel._({
    required List<FarmPlantCardModel> farmPlantCardModelList,
    required Season initSeason,
  })  : _selectedSeason = initSeason,
        _farmPlantCardModelList = farmPlantCardModelList;

  factory FarmPageModel() {
    final farmPageModel = FarmPageModel._(
      farmPlantCardModelList: const [],
      initSeason: Season.spring,
    );
    farmPageModel.initFromPrefs();
    return farmPageModel;
  }

  final Future<SharedPreferencesWithCache> _prefs = SharedPreferencesWithCache.create(
    cacheOptions: SharedPreferencesWithCacheOptions(
      allowList: {
        _CacheKey.farmPlantCardModelList.name,
      },
    ),
  );

  List<FarmPlantCardModel> _farmPlantCardModelList;

  @JsonKey(includeToJson: false, includeFromJson: false)
  UnmodifiableListView<FarmPlantCardModel> get farmPlantCardModelList => UnmodifiableListView(_farmPlantCardModelList);
  set farmPlantCardModelList(List<FarmPlantCardModel> value) {
    _farmPlantCardModelList = value;
    notifyListeners();
  }

  Season _selectedSeason;
  Season get selectedSeason => _selectedSeason;
  set selectedSeason(Season value) {
    _selectedSeason = value;
    notifyListeners();
  }

  UnmodifiableListView<FarmPlantCardModel> get farmPlantCardModelListBySelectedSeason {
    final result = farmPlantCardModelList.where((farmPlantCardModel) {
      return farmPlantCardModel.farmPlantSetModel.suitableSeasons.contains(selectedSeason);
    });
    return UnmodifiableListView(result);
  }

  Future<void> initFromPrefs() async {
    final prefs = await _prefs;
    final jsonString = prefs.getString(_CacheKey.farmPlantCardModelList.name);
    if (jsonString == null) {
      final sampleData = FarmPlantSetModelSample.preDefinedList
          .map((sampleModel) => FarmPlantCardModel(farmPlantSetModel: sampleModel));
      farmPlantCardModelList = sampleData.toList();
      return;
    }
    final List<dynamic> decodedList = jsonDecode(jsonString);
    final List<FarmPlantCardModel> loadedData = List.of(decodedList.map((e) => FarmPlantCardModel.fromJson(e)));
    farmPlantCardModelList = loadedData;
  }

  Future<void> addFarmPlantCard(FarmPlantCardModel model) async {
    final prefs = await _prefs;
    final copy = List<FarmPlantCardModel>.from(farmPlantCardModelList);
    copy.add(model);
    final jsonString = jsonEncode(copy);
    await prefs.setString(_CacheKey.farmPlantCardModelList.name, jsonString);
    farmPlantCardModelList = copy;
  }

  void save() async {
    final prefs = await _prefs;
    final jsonString = jsonEncode(farmPlantCardModelList);
    await prefs.setString(_CacheKey.farmPlantCardModelList.name, jsonString);
  }

  factory FarmPageModel.fromJson(Map<String, dynamic> json) => _$FarmPageModelFromJson(json);
  Map<String, dynamic> toJson() => _$FarmPageModelToJson(this);
}
