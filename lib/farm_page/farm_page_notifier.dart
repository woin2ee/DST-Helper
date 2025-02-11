import 'dart:collection';
import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/v1/season.dart';
import 'farm_list/farm_plant_card/farm_plant_card_model.dart';
import 'farm_list/farm_plant_set/farm_plant_set_model_sample.dart';

enum _CacheKey {
  farmPlantCardModelList,
}

class FarmPageNotifier extends ChangeNotifier {
  FarmPageNotifier._({
    required List<FarmPlantCardModel> farmPlantCardModels,
    required Season initSeason,
    required bool showHiddenItems,
  })  : _showHiddenItems = showHiddenItems,
        _selectedSeason = initSeason,
        _farmPlantCardModels = farmPlantCardModels;

  factory FarmPageNotifier() {
    final self = FarmPageNotifier._(
      farmPlantCardModels: const [],
      initSeason: Season.spring,
      showHiddenItems: false,
    );
    self.initFromPrefs();
    return self;
  }

  final Future<SharedPreferencesWithCache> _prefs = SharedPreferencesWithCache.create(
    cacheOptions: SharedPreferencesWithCacheOptions(
      allowList: {
        _CacheKey.farmPlantCardModelList.name,
      },
    ),
  );

  /// The data of farm plant cards to be displayed.
  List<FarmPlantCardModel> _farmPlantCardModels;
  BuiltList<FarmPlantCardModel> get farmPlantCardModels => BuiltList(_farmPlantCardModels);
  set farmPlantCardModels(Iterable<FarmPlantCardModel> value) {
    _farmPlantCardModels = value.toList();
    notifyListeners();
  }

  /// The selected season by the user.
  Season _selectedSeason;
  Season get selectedSeason => _selectedSeason;
  set selectedSeason(Season value) {
    _selectedSeason = value;
    notifyListeners();
  }

  /// Whether to show hidden items or not.
  bool _showHiddenItems;
  bool get showHiddenItems => _showHiddenItems;
  set showHiddenItems(bool value) {
    _showHiddenItems = value;
    notifyListeners();
  }

  UnmodifiableListView<FarmPlantCardModel> get farmPlantCardModelsBySelectedSeason {
    final result = farmPlantCardModels.where((farmPlantCardModel) {
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
            fertilizer: null,
          ));
      farmPlantCardModels = sampleData.toList();
      return;
    }
    final List<dynamic> decodedList = jsonDecode(jsonString);
    final List<FarmPlantCardModel> loadedData = List.of(decodedList.map((e) => FarmPlantCardModel.fromJson(e)));
    farmPlantCardModels = loadedData;
  }

  Future<void> addFarmPlantCard(FarmPlantCardModel model) async {
    final prefs = await _prefs;
    final copy = List<FarmPlantCardModel>.from(farmPlantCardModels);
    copy.add(model);
    final jsonString = jsonEncode(copy);
    await prefs.setString(_CacheKey.farmPlantCardModelList.name, jsonString);
    farmPlantCardModels = copy;
    notifyListeners();
  }

  void updateFarmPlantCard(FarmPlantCardModel model) {
    final targetIndex = _farmPlantCardModels.indexWhere((e) => e.id == model.id);
    _farmPlantCardModels[targetIndex] = model;
    notifyListeners();
    _save();
  }

  void markCardAsFavorite(bool favorite, {required String id}) async {
    final target = _farmPlantCardModels.singleWhere((e) => e.id == id);
    target.favorite.value = favorite;
    _save();
  }

  void makeCardHidden(bool isHidden, {required String id}) {
    final target = _farmPlantCardModels.singleWhere((e) => e.id == id);
    target.isHidden = isHidden;
    notifyListeners();
    _save();
  }

  void deleteCard({required String id}) {
    _farmPlantCardModels.removeWhere((model) => model.id == id);
    notifyListeners();
    _save();
  }

  /// Save the current data to the shared preferences.
  Future<void> _save() async {
    final prefs = await _prefs;
    final jsonString = jsonEncode(_farmPlantCardModels);
    await prefs.setString(_CacheKey.farmPlantCardModelList.name, jsonString);
  }
}
