import 'package:dst_helper/models/dst_object.dart';

enum FarmPlantStyle {
  basic,
  dense,
  reverseDense,
}

sealed class FarmPlantData {
  FarmPlantData({required this.plants});

  FarmPlantStyle get farmPlantStyle;
  int get countOfPlants;
  final List<PlantObject?> plants;

  bool get hasBalancedNutrients {
    return totalNutrient.equalsOfValue(Nutrient.zero());
  }

  Nutrient get totalNutrient {
    return plants.fold(Nutrient.zero(), (partial, next) => partial + (next?.nutrient ?? Nutrient.zero()));
  }

  FarmPlantData copyWith({List<PlantObject?>? plants});
}

/// (top) 3 : 3 : 3 (bottom)
class BasicFarmPlantData extends FarmPlantData {
  BasicFarmPlantData(
    PlantObject? c1,
    PlantObject? c2,
    PlantObject? c3,
    PlantObject? c4,
    PlantObject? c5,
    PlantObject? c6,
    PlantObject? c7,
    PlantObject? c8,
    PlantObject? c9,
  ) : super(plants: [c1, c2, c3, c4, c5, c6, c7, c8, c9]);

  BasicFarmPlantData.empty() : super(plants: List.filled(9, null));

  BasicFarmPlantData.withPlants(List<PlantObject?> plants)
      : assert(plants.length == 9),
        super(plants: plants);

  @override
  BasicFarmPlantData copyWith({
    List<PlantObject?>? plants,
  }) {
    return BasicFarmPlantData(
      plants?[0],
      plants?[1],
      plants?[2],
      plants?[3],
      plants?[4],
      plants?[5],
      plants?[6],
      plants?[7],
      plants?[8],
    );
  }

  @override
  int get countOfPlants => 9;

  @override
  FarmPlantStyle get farmPlantStyle => FarmPlantStyle.basic;
}

/// (top) 2 : 3 : 2 : 3 (bottom)
class DenseFarmPlantData extends FarmPlantData {
  DenseFarmPlantData(
    PlantObject? c1,
    PlantObject? c2,
    PlantObject? c3,
    PlantObject? c4,
    PlantObject? c5,
    PlantObject? c6,
    PlantObject? c7,
    PlantObject? c8,
    PlantObject? c9,
    PlantObject? c10,
  ) : super(plants: [c1, c2, c3, c4, c5, c6, c7, c8, c9, c10]);

  DenseFarmPlantData.empty() : super(plants: List.filled(10, null));

  @override
  DenseFarmPlantData copyWith({
    List<PlantObject?>? plants,
  }) {
    return DenseFarmPlantData(
      plants?[0],
      plants?[1],
      plants?[2],
      plants?[3],
      plants?[4],
      plants?[5],
      plants?[6],
      plants?[7],
      plants?[8],
      plants?[9],
    );
  }

  @override
  int get countOfPlants => 10;

  @override
  FarmPlantStyle get farmPlantStyle => FarmPlantStyle.dense;
}

/// (top) 3 : 2 : 3 : 2 (bottom)
class ReverseDenseFarmPlantData extends FarmPlantData {
  ReverseDenseFarmPlantData(
    PlantObject? c1,
    PlantObject? c2,
    PlantObject? c3,
    PlantObject? c4,
    PlantObject? c5,
    PlantObject? c6,
    PlantObject? c7,
    PlantObject? c8,
    PlantObject? c9,
    PlantObject? c10,
  ) : super(plants: [c1, c2, c3, c4, c5, c6, c7, c8, c9, c10]);

  ReverseDenseFarmPlantData.empty() : super(plants: List.filled(10, null));

  @override
  ReverseDenseFarmPlantData copyWith({
    List<PlantObject?>? plants,
  }) {
    return ReverseDenseFarmPlantData(
      plants?[0],
      plants?[1],
      plants?[2],
      plants?[3],
      plants?[4],
      plants?[5],
      plants?[6],
      plants?[7],
      plants?[8],
      plants?[9],
    );
  }

  @override
  int get countOfPlants => 10;

  @override
  FarmPlantStyle get farmPlantStyle => FarmPlantStyle.reverseDense;
}
