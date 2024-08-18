import 'package:dst_helper/farm_page/farm_plant/farm_plant.dart';

sealed class FarmPlantsShape {
  FarmPlantsShape({required this.farmPlants});

  int get farmPlantsCount;
  final List<FarmPlant> farmPlants;
}

class FarmPlantsShapeSingle extends FarmPlantsShape {
  FarmPlantsShapeSingle(FarmPlant farmPlant) : super(farmPlants: [farmPlant]);

  @override
  int get farmPlantsCount => 1;
}

class FarmPlantsShapeDouble extends FarmPlantsShape {
  FarmPlantsShapeDouble({required FarmPlant left, required FarmPlant right}) : super(farmPlants: [left, right]);

  @override
  int get farmPlantsCount => 2;
}

class FarmPlantsShapeSquare extends FarmPlantsShape {
  FarmPlantsShapeSquare({
    required FarmPlant topLeft,
    required FarmPlant topRight,
    required FarmPlant bottomLeft,
    required FarmPlant bottomRight,
  }) : super(farmPlants: [
          topLeft,
          topRight,
          bottomLeft,
          bottomRight,
        ]);

  @override
  int get farmPlantsCount => 4;
}
