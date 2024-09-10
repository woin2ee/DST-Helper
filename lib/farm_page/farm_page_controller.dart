import 'dart:collection';
import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:dst_helper/farm_page/farm_list/farm_plant_card/farm_plant_card_model.dart';
import 'package:dst_helper/farm_page/farm_list/farm_plant_set/farm_plant_set_model_sample.dart';
import 'package:dst_helper/models/v1/season.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum _CacheKey {
  farmPlantCardModelList,
}

class FarmPageController extends ChangeNotifier {
  FarmPageController._({
    required List<FarmPlantCardModel> farmPlantCardModelList,
    required Season initSeason,
    required bool showHiddenItems,
  })  : _showHiddenItems = showHiddenItems,
        _selectedSeason = initSeason,
        _farmPlantCardModelList = farmPlantCardModelList;

  factory FarmPageController() {
    final farmPageModel = FarmPageController._(
      farmPlantCardModelList: const [],
      initSeason: Season.spring,
      showHiddenItems: false,
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

  BuiltList<FarmPlantCardModel> get farmPlantCardModelList => BuiltList(_farmPlantCardModelList);
  set farmPlantCardModelList(Iterable<FarmPlantCardModel> value) {
    _farmPlantCardModelList = value.toList();
    notifyListeners();
  }

  Season _selectedSeason;
  Season get selectedSeason => _selectedSeason;
  set selectedSeason(Season value) {
    _selectedSeason = value;
    notifyListeners();
  }

  bool _showHiddenItems;
  bool get showHiddenItems => _showHiddenItems;
  set showHiddenItems(bool value) {
    _showHiddenItems = value;
    notifyListeners();
  }

  UnmodifiableListView<FarmPlantCardModel> get farmPlantCardModelListBySelectedSeason {
    final result = farmPlantCardModelList.where((farmPlantCardModel) {
      return farmPlantCardModel.farmPlantSetModel.suitableSeasons.contains(selectedSeason);
    });
    if (showHiddenItems) {
      return UnmodifiableListView(result);
    } else {
      final filteredResult = result.where((e) => !e.isHidden);
      return UnmodifiableListView(filteredResult);
    }
  }

  Future<void> initFromPrefs() async {
    final prefs = await _prefs;
    final jsonString = prefs.getString(_CacheKey.farmPlantCardModelList.name);
    if (jsonString == null) {
      final sampleData = FarmPlantSetModelSample.preDefinedList.map((sampleModel) => FarmPlantCardModel.create(
            farmPlantSetModel: sampleModel,
            createType: CreateType.sample,
          ));
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
    notifyListeners();
  }

  void updateFarmPlantCard(FarmPlantCardModel model) {
    final targetIndex = _farmPlantCardModelList.indexWhere((e) => e.id == model.id);
    _farmPlantCardModelList[targetIndex] = model;
    notifyListeners();
    _save();
  }

  void markCardAsFavorite(bool favorite, {required String id}) async {
    final target = _farmPlantCardModelList.singleWhere((e) => e.id == id);
    target.favorite.value = favorite;
    _save();
  }

  void makeCardHidden(bool isHidden, {required String id}) {
    final target = _farmPlantCardModelList.singleWhere((e) => e.id == id);
    target.isHidden = isHidden;
    notifyListeners();
    _save();
  }

  void deleteCard({required String id}) {
    _farmPlantCardModelList.removeWhere((model) => model.id == id);
    notifyListeners();
    _save();
  }

  Future<void> _save() async {
    final prefs = await _prefs;
    final jsonString = jsonEncode(_farmPlantCardModelList);
    await prefs.setString(_CacheKey.farmPlantCardModelList.name, jsonString);
  }
}
