import 'package:dst_helper/models/season.dart';

enum Crop {
  potato(
    seasons: {Season.spring, Season.autumn, Season.winter},
    nutrient: Nutrient(compost: 2, growthFormula: 2, manure: -4),
  ),
  carrot(
    seasons: {Season.spring, Season.autumn, Season.winter},
    nutrient: Nutrient(compost: 2, growthFormula: -4, manure: 2),
  ),
  corn(
    seasons: {Season.spring, Season.summer, Season.autumn},
    nutrient: Nutrient(compost: -4, growthFormula: 2, manure: 2),
  ),
  tomato(
    seasons: {Season.spring, Season.summer, Season.autumn},
    nutrient: Nutrient(compost: -2, growthFormula: -2, manure: 4),
  ),
  asparagus(
    seasons: {Season.spring, Season.winter},
    nutrient: Nutrient(compost: -4, growthFormula: 2, manure: 2),
  ),
  watermelon(
    seasons: {Season.spring, Season.summer},
    nutrient: Nutrient(compost: -2, growthFormula: 4, manure: -2),
  ),
  pumpkin(
    seasons: {Season.autumn, Season.winter},
    nutrient: Nutrient(compost: 2, growthFormula: -4, manure: 2),
  ),
  eggplant(
    seasons: {Season.spring, Season.autumn},
    nutrient: Nutrient(compost: 2, growthFormula: 2, manure: -4),
  ),
  garlic(
    seasons: {Season.spring, Season.summer, Season.autumn, Season.winter},
    nutrient: Nutrient(compost: -8, growthFormula: 4, manure: 4),
  ),
  onion(
    seasons: {Season.spring, Season.summer, Season.autumn},
    nutrient: Nutrient(compost: 4, growthFormula: -8, manure: 4),
  ),
  pepper(
    seasons: {Season.summer, Season.autumn},
    nutrient: Nutrient(compost: 4, growthFormula: 4, manure: -8),
  ),

  /// 석류
  pomegranate(
    seasons: {Season.spring, Season.summer},
    nutrient: Nutrient(compost: 4, growthFormula: -8, manure: 4),
  ),
  dragonFruit(
    seasons: {Season.spring, Season.summer},
    nutrient: Nutrient(compost: 4, growthFormula: 4, manure: -8),
  ),
  durian(
    seasons: {Season.spring},
    nutrient: Nutrient(compost: -8, growthFormula: 4, manure: 4),
  ),

  /// 건망초
  forgetMeLots(
    seasons: {},
    nutrient: Nutrient(compost: -2, growthFormula: -2, manure: -2),
  ),

  /// 불쐐기
  fireNettleFronds(
    seasons: {},
    nutrient: Nutrient(compost: -2, growthFormula: -2, manure: -2),
  ),

  /// 뒤엎시라
  tillweeds(
    seasons: {},
    nutrient: Nutrient(compost: -2, growthFormula: -2, manure: -2),
  ),

  /// 가시올무메꽃
  spinyBindweed(
    seasons: {},
    nutrient: Nutrient(compost: -2, growthFormula: -2, manure: -2),
  );

  const Crop({
    required this.seasons,
    required this.nutrient,
  });

  final Seasons seasons;

  final Nutrient nutrient;

  bool get hasSeeds {
    switch (this) {
      case Crop.potato:
      case Crop.carrot:
      case Crop.corn:
      case Crop.tomato:
      case Crop.asparagus:
      case Crop.watermelon:
      case Crop.pumpkin:
      case Crop.eggplant:
      case Crop.garlic:
      case Crop.onion:
      case Crop.pepper:
      case Crop.pomegranate:
      case Crop.dragonFruit:
      case Crop.durian:
        return true;
      case Crop.forgetMeLots:
      case Crop.fireNettleFronds:
      case Crop.tillweeds:
      case Crop.spinyBindweed:
        return false;
    }
  }
}

class Nutrient {
  /// 퇴비
  final int compost;

  /// 성장 촉진제
  final int growthFormula;

  /// 거름
  final int manure;

  const Nutrient({
    required this.compost,
    required this.growthFormula,
    required this.manure,
  });

  Nutrient operator +(Nutrient right) => Nutrient(
        compost: compost + right.compost,
        growthFormula: growthFormula + right.growthFormula,
        manure: manure + right.manure,
      );
}
