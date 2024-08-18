import 'package:dst_helper/farm_page/farm_plant/farm_plant.dart';
import 'package:dst_helper/farm_page/farm_plant/farm_plant_set.dart';
import 'package:dst_helper/farm_page/farm_plant/farm_plants_shape.dart';
import 'package:dst_helper/models/dst_object.dart';

class FarmPlantSetSample {
  static FarmPlantSet get preDefined1 {
    return FarmPlantSet(
      shape: FarmPlantsShapeSingle(BasicFarmPlant(
        const Potato(),
        const Potato(),
        const Potato(),
        const Potato(),
        null,
        const TomaRoot(),
        const TomaRoot(),
        const TomaRoot(),
        const TomaRoot(),
      )),
    );
  }

  static FarmPlantSet get preDefined2 {
    return FarmPlantSet(
      shape: FarmPlantsShapeDouble(
        left: BasicFarmPlant(
          const DragonFruit(),
          const DragonFruit(),
          const DragonFruit(),
          const TomaRoot(),
          const TomaRoot(),
          const TomaRoot(),
          const TomaRoot(),
          const TomaRoot(),
          const TomaRoot(),
        ),
        right: BasicFarmPlant(
          const DragonFruit(),
          const DragonFruit(),
          const DragonFruit(),
          const TomaRoot(),
          const TomaRoot(),
          const TomaRoot(),
          const TomaRoot(),
          const TomaRoot(),
          const TomaRoot(),
        ),
      ),
    );
  }

  static FarmPlantSet get preDefined3 {
    return FarmPlantSet(
      shape: FarmPlantsShapeDouble(
        left: DenseFarmPlant(
          const Pumpkin(),
          const Garlic(),
          const Pumpkin(),
          const Pumpkin(),
          const Garlic(),
          const Pumpkin(),
          const Potato(),
          const Potato(),
          const Potato(),
          const Potato(),
        ),
        right: ReverseDenseFarmPlant(
          const Garlic(),
          const Pumpkin(),
          const Pumpkin(),
          const Garlic(),
          const Pumpkin(),
          const Potato(),
          const Potato(),
          const Pumpkin(),
          const Potato(),
          const Potato(),
        ),
      ),
    );
  }

  static FarmPlantSet get preDefined4 {
    return FarmPlantSet(
      shape: FarmPlantsShapeDouble(
        left: BasicFarmPlant(
          const Onion(),
          const Onion(),
          const Onion(),
          const Garlic(),
          const Garlic(),
          const Garlic(),
          const DragonFruit(),
          const DragonFruit(),
          const DragonFruit(),
        ),
        right: BasicFarmPlant(
          const Onion(),
          const Onion(),
          const Onion(),
          const Garlic(),
          const Garlic(),
          const Garlic(),
          const DragonFruit(),
          const DragonFruit(),
          const DragonFruit(),
        ),
      ),
    );
  }

  static FarmPlantSet get preDefined5 {
    return FarmPlantSet(
      shape: FarmPlantsShapeDouble(
        left: BasicFarmPlant(
          const Onion(),
          const Onion(),
          const Onion(),
          const Watermelon(),
          const Watermelon(),
          const Watermelon(),
          const Watermelon(),
          const Watermelon(),
          const Watermelon(),
        ),
        right: BasicFarmPlant(
          const Onion(),
          const Onion(),
          const Onion(),
          const Watermelon(),
          const Watermelon(),
          const Watermelon(),
          const Watermelon(),
          const Watermelon(),
          const Watermelon(),
        ),
      ),
    );
  }

  static FarmPlantSet get preDefined6 {
    return FarmPlantSet(
      shape: FarmPlantsShapeDouble(
        left: BasicFarmPlant(
          null,
          const Onion(),
          const Onion(),
          const Potato(),
          const Potato(),
          const Garlic(),
          const Potato(),
          const Potato(),
          const Garlic(),
        ),
        right: BasicFarmPlant(
          const Onion(),
          const Onion(),
          null,
          const Garlic(),
          const Potato(),
          const Potato(),
          const Garlic(),
          const Potato(),
          const Potato(),
        ),
      ),
    );
  }

  static FarmPlantSet get preDefined7 {
    return FarmPlantSet(
      shape: FarmPlantsShapeDouble(
        left: BasicFarmPlant(
          const Asparagus(),
          const Asparagus(),
          const Asparagus(),
          const Potato(),
          const Potato(),
          const Potato(),
          const Pumpkin(),
          const Pumpkin(),
          const Pumpkin(),
        ),
        right: BasicFarmPlant(
          const Asparagus(),
          const Asparagus(),
          const Asparagus(),
          const Potato(),
          const Potato(),
          const Potato(),
          const Pumpkin(),
          const Pumpkin(),
          const Pumpkin(),
        ),
      ),
    );
  }

  static FarmPlantSet get preDefined8 {
    return FarmPlantSet(
      shape: FarmPlantsShapeSingle(
        BasicFarmPlant(
          const Watermelon(),
          const Watermelon(),
          const Watermelon(),
          const Watermelon(),
          null,
          const Carrot(),
          const Carrot(),
          const Carrot(),
          const Carrot(),
        ),
      ),
    );
  }

  static FarmPlantSet get preDefined9 {
    return FarmPlantSet(
      shape: FarmPlantsShapeSingle(
        BasicFarmPlant(
          const Onion(),
          const Onion(),
          const Onion(),
          const Garlic(),
          const Garlic(),
          const Garlic(),
          const Pepper(),
          const Pepper(),
          const Pepper(),
        ),
      ),
    );
  }

  static FarmPlantSet get preDefined10 {
    return FarmPlantSet(
        shape: FarmPlantsShapeSquare(
      topLeft: BasicFarmPlant(
        null,
        null,
        const Potato(),
        null,
        null,
        const Potato(),
        const Pumpkin(),
        const Pumpkin(),
        const Garlic(),
      ),
      topRight: BasicFarmPlant(
        const Potato(),
        null,
        null,
        const Potato(),
        null,
        null,
        const Garlic(),
        const Pumpkin(),
        const Pumpkin(),
      ),
      bottomLeft: BasicFarmPlant(
        const Pumpkin(),
        const Pumpkin(),
        const Garlic(),
        null,
        null,
        const Potato(),
        null,
        null,
        const Potato(),
      ),
      bottomRight: BasicFarmPlant(
        const Garlic(),
        const Pumpkin(),
        const Pumpkin(),
        const Potato(),
        null,
        null,
        const Potato(),
        null,
        null,
      ),
    ));
  }
}
