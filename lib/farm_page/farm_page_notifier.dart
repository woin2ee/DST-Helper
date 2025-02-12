import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/v1/season.dart';
import 'farm_list/farm_group/farm_group_model.dart';
import 'farm_list/farm_plant_card/farm_card_model.dart';

String _cacheKey = 'FARM_CARD_MODEL_LIST';

class FarmPageNotifier extends ChangeNotifier {
  FarmPageNotifier._({
    required List<FarmCardModel> farmCardModels,
    required Season initialSeason,
    required bool showingHiddenItems,
  })  : _showingHiddenItems = showingHiddenItems,
        _selectedSeason = initialSeason,
        _farmCardModels = farmCardModels;

  factory FarmPageNotifier() {
    final self = FarmPageNotifier._(
      farmCardModels: const [],
      initialSeason: Season.spring,
      showingHiddenItems: false,
    );
    self.initFromPrefs();
    return self;
  }

  final Future<SharedPreferencesWithCache> _prefs = SharedPreferencesWithCache.create(
    cacheOptions: SharedPreferencesWithCacheOptions(
      allowList: {
        _cacheKey,
      },
    ),
  );

  /// The data of farm cards to be displayed.
  List<FarmCardModel> _farmCardModels;
  set farmCardModels(Iterable<FarmCardModel> value) {
    _farmCardModels = value.toList();
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
  bool _showingHiddenItems;
  bool get showingHiddenItems => _showingHiddenItems;
  set showingHiddenItems(bool value) {
    _showingHiddenItems = value;
    notifyListeners();
  }

  UnmodifiableListView<FarmCardModel> get farmCardModelsBySelectedSeason {
    final result = _farmCardModels.where((farmCardModel) {
      return farmCardModel.farmGroupModel.suitableSeasons.contains(selectedSeason);
    });
    if (showingHiddenItems) {
      return UnmodifiableListView(result);
    } else {
      final filteredResult = result.where((e) => !e.isHidden);
      return UnmodifiableListView(filteredResult);
    }
  }

  Future<void> initFromPrefs() async {
    final prefs = await _prefs;
    final jsonString = prefs.getString(_cacheKey);
    if (jsonString == null) {
      final sampleData = SampleFarmGroupModel.preDefinedList.map((sampleModel) => FarmCardModel.create(
            farmGroupModel: sampleModel,
            createType: CreateType.sample,
            fertilizer: null,
          ));
      farmCardModels = sampleData.toList();
      return;
    }
    final List<dynamic> decodedList = jsonDecode(jsonString);
    final List<FarmCardModel> loadedData = List.of(decodedList.map((e) => FarmCardModel.fromJson(e)));
    farmCardModels = loadedData;
  }

  Future<void> addFarmCard(FarmCardModel model) async {
    final prefs = await _prefs;
    final copy = List<FarmCardModel>.from(_farmCardModels);
    copy.add(model);
    final jsonString = jsonEncode(copy);
    await prefs.setString(_cacheKey, jsonString);
    farmCardModels = copy;
    notifyListeners();
  }

  void updateFarmCard(FarmCardModel model) {
    final targetIndex = _farmCardModels.indexWhere((e) => e.id == model.id);
    _farmCardModels[targetIndex] = model;
    notifyListeners();
    _save();
  }

  void markCardAsFavorite(bool favorite, {required String id}) async {
    final target = _farmCardModels.singleWhere((e) => e.id == id);
    target.isFavorited.value = favorite;
    _save();
  }

  void makeCardHidden(bool isHidden, {required String id}) {
    final target = _farmCardModels.singleWhere((e) => e.id == id);
    target.isHidden = isHidden;
    notifyListeners();
    _save();
  }

  void deleteCard({required String id}) {
    _farmCardModels.removeWhere((model) => model.id == id);
    notifyListeners();
    _save();
  }

  /// Save the current data to the shared preferences.
  Future<void> _save() async {
    final prefs = await _prefs;
    final jsonString = jsonEncode(_farmCardModels);
    await prefs.setString(_cacheKey, jsonString);
  }
}
