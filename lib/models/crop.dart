import 'package:dst_helper/models/season.dart';

enum Crop {
  potato(seasons: {Season.spring, Season.autumn, Season.winter}),
  carrot(seasons: {Season.spring, Season.autumn, Season.winter}),
  corn(seasons: {Season.spring, Season.summer, Season.autumn}),
  tomato(seasons: {Season.spring, Season.summer, Season.autumn}),
  asparagus(seasons: {Season.spring, Season.winter}),
  watermelon(seasons: {Season.spring, Season.summer}),
  pumpkin(seasons: {Season.autumn, Season.winter}),
  eggplant(seasons: {Season.spring, Season.autumn}),
  garlic(seasons: {Season.spring, Season.summer, Season.autumn, Season.winter}),
  onion(seasons: {Season.spring, Season.summer, Season.autumn}),
  pepper(seasons: {Season.summer, Season.autumn}),

  /// 석류
  pomegranate(seasons: {Season.spring, Season.summer}),
  dragonFruit(seasons: {Season.spring, Season.summer}),
  durian(seasons: {Season.spring}),

  /// 건망초
  forgetMeLots(seasons: {}),

  /// 불쐐기
  fireNettleFronds(seasons: {}),

  /// 뒤엎시라
  tillweeds(seasons: {}),

  /// 가시올무메꽃
  spinyBindweed(seasons: {}),
  none(seasons: {});

  const Crop({
    required this.seasons,
  });

  final Seasons seasons;

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
      case Crop.none:
        return false;
    }
  }
}
