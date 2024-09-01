import 'package:dst_helper/farm_page/farm_plant/models/farm_plant_card_model.dart';
import 'package:dst_helper/models/v1/season.dart';
import 'package:flutter/material.dart';

class FarmPageModel extends ChangeNotifier {
  FarmPageModel({
    required Future<List<FarmPlantCardModel>> farmPlantCardList,
    required Season initSeason,
  })  : _selectedSeason = initSeason,
        _farmPlantCardList = farmPlantCardList;

  Future<List<FarmPlantCardModel>> _farmPlantCardList;
  Future<List<FarmPlantCardModel>> get farmPlantCardList => _farmPlantCardList;
  set farmPlantCardList(Future<List<FarmPlantCardModel>> value) {
    _farmPlantCardList = value;
    notifyListeners();
  }

  Season _selectedSeason;
  Season get selectedSeason => _selectedSeason;
  set selectedSeason(Season value) {
    _selectedSeason = value;
    notifyListeners();
  }

  Future<void> addFarmPlantCard(FarmPlantCardModel model) async {
    final farmPlantCardList = await _farmPlantCardList;
    farmPlantCardList.add(model);
    notifyListeners();
  }
}
