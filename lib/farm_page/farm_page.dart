import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app/di.dart';
import '../app/sample_data.dart';
import '../common/async_repository.dart';
import '../l10n/l10ns.dart';
import '../models/v1/localization/season_localization.dart';
import '../models/v1/season.dart';
import '../utils/font_family.dart';
import 'farm_grid/farm_grid.dart';
import 'farm_group_editor/farm_group_editor.dart';
import 'side_info_box/side_info_box.dart';

class FarmPage extends StatefulWidget {
  const FarmPage({super.key});

  @override
  State<FarmPage> createState() => _FarmPageState();
}

class _FarmPageState extends State<FarmPage> {
  final ViewModel _model = DI().resolve();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _model,
      builder: (context, child) {
        final model = context.watch<ViewModel>();
        final selectedSeason = model.selectedSeason;

        return Theme(
          data: ThemeData(
            useMaterial3: true,
            colorScheme: selectedSeason != null ? ColorScheme.fromSeed(seedColor: selectedSeason.personalColor) : null,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const _TopBar(),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Builder(
                          builder: (context) {
                            if (!model.isLoaded) {
                              return const Center(
                                child: Text('Loading...'),
                              );
                            }
                            return const FarmGrid();
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
      },
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    final windowWidth = MediaQuery.of(context).size.width;
    return Builder(builder: (context) {
      if (windowWidth > 740) {
        return const Padding(
          padding: EdgeInsets.all(12),
          child: Row(
            spacing: 12,
            children: [
              _SeasonSelectionBox(),
              _NewButton(),
              _ShowAndHideCheckbox(),
            ],
          ),
        );
      } else {
        return const Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            spacing: 4,
            children: [
              Row(
                spacing: 12,
                children: [
                  _SeasonSelectionBox(),
                  _NewButton(),
                ],
              ),
              _ShowAndHideCheckbox(),
            ],
          ),
        );
      }
    });
  }
}

class _ShowAndHideCheckbox extends StatelessWidget {
  const _ShowAndHideCheckbox();

  @override
  Widget build(BuildContext context) {
    return Consumer<ViewModel>(
      builder: (BuildContext context, ViewModel model, Widget? checkboxLabel) {
        return Row(
          children: [
            Checkbox(
              value: model.showingHiddenItems,
              onChanged: (bool? isChecked) {
                model.showingHiddenItems = isChecked!;
              },
            ),
            checkboxLabel!,
          ],
        );
      },
      child: Text(
        L10ns.of(context).localized('show_hidden_items'),
        style: const TextStyle(
          fontFamily: FontFamily.pretendard,
        ),
      ),
    );
  }
}

class _NewButton extends StatelessWidget {
  const _NewButton();

  @override
  Widget build(BuildContext context) {
    final model = context.read<ViewModel>();

    return ElevatedButton(
      onPressed: () async {
        final maybeFarmCardModel = await showDialog(
          barrierColor: Colors.black.withOpacity(0.35),
          context: context,
          builder: (context) => Dialog(
            child: FarmGroupEditor(
              key: GlobalKey(),
              isEditingNewOne: true,
            ),
          ),
        );
        if (maybeFarmCardModel is FarmCardModel) {
          final farmCardModel = maybeFarmCardModel;
          model.addFarmCard(farmCardModel);
        }
      },
      child: const Text('New'),
    );
  }
}

class _SeasonSelectionBox extends StatelessWidget {
  const _SeasonSelectionBox();

  static const List<Season> _seasons = [
    Season.spring,
    Season.summer,
    Season.autumn,
    Season.winter,
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<ViewModel>(
      builder: (context, model, child) => ToggleButtons(
        borderRadius: BorderRadius.circular(10),
        constraints: const BoxConstraints(
          minWidth: 70,
          minHeight: 40,
        ),
        isSelected: _seasons.map((season) => season == model.selectedSeason).toList(),
        onPressed: (index) {
          model.selectedSeason = _seasons[index];
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
                    fontFamily: FontFamily.pretendard,
                    fontVariations: [
                      FontVariation.weight(500),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

class ViewModel extends ChangeNotifier {
  ViewModel._({
    List<FarmCardModel>? farmCardModels,
    Season? selectedSeason,
    bool? showingHiddenItems,
    FarmPageRepository? repository,
  })  : _farmCardModels = farmCardModels ?? [],
        _selectedSeason = selectedSeason,
        _showingHiddenItems = showingHiddenItems ?? false,
        _repository = repository;

  factory ViewModel({
    FarmPageRepository? repository,
  }) {
    final self = ViewModel._(
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

  factory ViewModel.fromJson(Map<String, dynamic> json) {
    final farmCardModels = List.of((json['farmCardModels'] as List<dynamic>).map((e) => FarmCardModel.fromJson(e)));
    final selectedSeason = Season.values.byName(json['selectedSeason']);
    final showingHiddenItems = json['showingHiddenItems'];
    return ViewModel._(
      farmCardModels: farmCardModels,
      selectedSeason: selectedSeason,
      showingHiddenItems: showingHiddenItems,
    );
  }
}

class FarmPageRepository extends SharedPreferencesRepository<ViewModel> {
  FarmPageRepository({required super.prefs});

  static const key = 'farmCardModelList';

  @override
  Future<ViewModel> fetch() async {
    final prefs = await super.prefs;
    final jsonString = prefs.getString(key);

    if (jsonString == null) {
      final sampleData = SampleData.preDefinedList.map((sampleModel) => FarmCardModel.create(
            farmGroupModel: sampleModel,
            createType: CreateType.sample,
            linkedFertilizer: null,
          ));
      final initialModel = ViewModel._(
        farmCardModels: sampleData.toList(),
        selectedSeason: Season.spring,
      );
      return initialModel;
    }

    final Map<String, dynamic> decoded = jsonDecode(jsonString);
    return ViewModel.fromJson(decoded);
  }

  @override
  Future<void> save(ViewModel data) async {
    final prefs = await super.prefs;
    final jsonString = jsonEncode(data);
    return prefs.setString(key, jsonString);
  }
}
