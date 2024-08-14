import 'package:dst_helper/models/food.dart';
import 'package:dst_helper/models/ingredient.dart';
import 'package:dst_helper/models/item.dart';
import 'package:dst_helper/models/season.dart';

// 식물
abstract class Plant implements Item {
  const Plant(
    this.seasons,
    this.nutrient,
  );

  final Seasons seasons;
  final Nutrient nutrient;
}

/// 작물
abstract class Crop implements Plant, Food, Ingredient {
  const Crop(this.seeds);

  final Seeds seeds;
}

/// 씨앗
abstract class Seeds implements Item {
  const Seeds({required this.crop, this.assumedName});

  final Crop crop;

  final String? assumedName;

  @override
  String get assetName => '${crop.assetName}_seeds';
}

/// 잡초
abstract class Weed implements Plant {
  const Weed();
}

/// 영양분
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
