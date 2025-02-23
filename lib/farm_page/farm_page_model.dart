import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';

import '../app/sample_data.dart';
import '../common/async_repository.dart';
import '../models/v1/season.dart';
import 'farm_grid/farm_card/farm_card_model.dart';

class FarmPageModel extends ChangeNotifier {
  FarmPageModel._({
    List<FarmCardModel>? farmCardModels,
    Season? selectedSeason,
    bool? showingHiddenItems,
    FarmPageRepository? repository,
  })  : _farmCardModels = farmCardModels ?? [],
        _selectedSeason = selectedSeason,
        _showingHiddenItems = showingHiddenItems ?? false,
        _repository = repository;

  factory FarmPageModel({
    FarmPageRepository? repository,
  }) {
    final self = FarmPageModel._(
      repository: repository,
    );

    repository?.fetch().then((model) {
      self._farmCardModels.addAll(model._farmCardModels);
      self._selectedSeason = model._selectedSeason;
      self._showingHiddenItems = model._showingHiddenItems;
      self.notifyListeners();
      self.isLoaded = true;
    });

    return self;
  }

  final FarmPageRepository? _repository;

  /// The data of farm cards to be displayed.
  final List<FarmCardModel> _farmCardModels;

  /// The selected season by the user.
  Season? _selectedSeason;
  Season? get selectedSeason => _selectedSeason;
  set selectedSeason(Season? value) {
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

  /// Whether it has been loaded from [_repository].
  bool isLoaded = false;

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

  Future<void> addFarmCard(FarmCardModel model) async {
    _farmCardModels.add(model);
    notifyListeners();
  }

  void updateFarmCard(FarmCardModel model) {
    final targetIndex = _farmCardModels.indexWhere((e) => e.id == model.id);
    _farmCardModels[targetIndex] = model;
    notifyListeners();
  }

  void markCardAsFavorite(bool favorite, {required String id}) async {
    final target = _farmCardModels.singleWhere((e) => e.id == id);
    target.isFavorited.value = favorite;
  }

  void makeCardHidden(bool isHidden, {required String id}) {
    final target = _farmCardModels.singleWhere((e) => e.id == id);
    target.isHidden = isHidden;
    notifyListeners();
  }

  void deleteCard({required String id}) {
    _farmCardModels.removeWhere((model) => model.id == id);
    notifyListeners();
  }

  @protected
  @override
  void notifyListeners() {
    super.notifyListeners();
    _repository?.save(this);
  }

  Map<String, dynamic> toJson() {
    return {
      'farmCardModels': _farmCardModels.map((e) => e.toJson()).toList(),
      'selectedSeason': _selectedSeason?.name,
      'showingHiddenItems': _showingHiddenItems,
    };
  }

  factory FarmPageModel.fromJson(Map<String, dynamic> json) {
    final farmCardModels = List.of((json['farmCardModels'] as List<dynamic>).map((e) => FarmCardModel.fromJson(e)));
    final selectedSeason = Season.values.byName(json['selectedSeason']);
    final showingHiddenItems = json['showingHiddenItems'];
    return FarmPageModel._(
      farmCardModels: farmCardModels,
      selectedSeason: selectedSeason,
      showingHiddenItems: showingHiddenItems,
    );
  }
}

class FarmPageRepository extends SharedPreferencesRepository<FarmPageModel> {
  FarmPageRepository({required super.prefs});

  static const key = 'farmCardModelList';

  @override
  Future<FarmPageModel> fetch() async {
    final prefs = await super.prefs;
    final jsonString = prefs.getString(key);

    if (jsonString == null) {
      final sampleData = SampleData.preDefinedList.map((sampleModel) => FarmCardModel.create(
            farmGroupModel: sampleModel,
            createType: CreateType.sample,
            linkedFertilizer: null,
          ));
      final initialModel = FarmPageModel._(
        farmCardModels: sampleData.toList(),
        selectedSeason: Season.spring,
      );
      return initialModel;
    }

    final Map<String, dynamic> decoded = jsonDecode(jsonString);
    return FarmPageModel.fromJson(decoded);
  }

  @override
  Future<void> save(FarmPageModel data) async {
    final prefs = await super.prefs;
    final jsonString = jsonEncode(data);
    return prefs.setString(key, jsonString);
  }
}
