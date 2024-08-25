import 'package:dst_helper/farm_page/farm_plant/farm_plant_data.dart';
import 'package:dst_helper/farm_page/farm_plant/farm_plant_set_data.dart';
import 'package:dst_helper/models/dst_object.dart';

class FarmPlantSetDataSample {
  static FarmPlantSetData get preDefined1 {
    return SingleFarmPlantSetData(
      farmPlantData: BasicFarmPlantData(
        const Potato(),
        const Potato(),
        const Potato(),
        const Potato(),
        null,
        const TomaRoot(),
        const TomaRoot(),
        const TomaRoot(),
        const TomaRoot(),
      ),
    );
  }

  static FarmPlantSetData get preDefined2 {
    return DoubleFarmPlantSetData(
      left: BasicFarmPlantData(
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
      right: BasicFarmPlantData(
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
    );
  }

  static FarmPlantSetData get preDefined3 {
    return DoubleFarmPlantSetData(
      left: DenseFarmPlantData(
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
      right: ReverseDenseFarmPlantData(
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
    );
  }

  static FarmPlantSetData get preDefined4 {
    return DoubleFarmPlantSetData(
      left: BasicFarmPlantData(
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
      right: BasicFarmPlantData(
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
    );
  }

  static FarmPlantSetData get preDefined5 {
    return DoubleFarmPlantSetData(
      left: BasicFarmPlantData(
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
      right: BasicFarmPlantData(
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
    );
  }

  static FarmPlantSetData get preDefined6 {
    return DoubleFarmPlantSetData(
      left: BasicFarmPlantData(
        const Potato(),
        const Potato(),
        const Garlic(),
        const Potato(),
        null,
        const Garlic(),
        const Potato(),
        const Onion(),
        const Onion(),
      ),
      right: BasicFarmPlantData(
        const Garlic(),
        const Potato(),
        const Potato(),
        const Garlic(),
        null,
        const Potato(),
        const Onion(),
        const Onion(),
        const Potato(),
      ),
    );
  }

  static FarmPlantSetData get preDefined7 {
    return DoubleFarmPlantSetData(
      left: BasicFarmPlantData(
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
      right: BasicFarmPlantData(
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
    );
  }

  static FarmPlantSetData get preDefined8 {
    return SingleFarmPlantSetData(
      farmPlantData: BasicFarmPlantData(
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
    );
  }

  static FarmPlantSetData get preDefined9 {
    return SingleFarmPlantSetData(
      farmPlantData: BasicFarmPlantData(
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
    );
  }

  static FarmPlantSetData get preDefined10 {
    return SquareFarmPlantSetData(
      topLeft: BasicFarmPlantData(
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
      topRight: BasicFarmPlantData(
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
      bottomLeft: BasicFarmPlantData(
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
      bottomRight: BasicFarmPlantData(
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
    );
  }

  static FarmPlantSetData get preDefined11 {
    return SquareFarmPlantSetData(
      topLeft: BasicFarmPlantData(
        const Potato(),
        const Potato(),
        const Onion(),
        const Potato(),
        const Potato(),
        const Onion(),
        const Asparagus(),
        const Asparagus(),
        const Garlic(),
      ),
      topRight: BasicFarmPlantData(
        const Onion(),
        const Potato(),
        const Potato(),
        const Onion(),
        const Potato(),
        const Potato(),
        const Garlic(),
        const Asparagus(),
        const Asparagus(),
      ),
      bottomLeft: BasicFarmPlantData(
        const Asparagus(),
        const Asparagus(),
        const Garlic(),
        const Potato(),
        const Potato(),
        const Onion(),
        const Potato(),
        const Potato(),
        const Onion(),
      ),
      bottomRight: BasicFarmPlantData(
        const Garlic(),
        const Asparagus(),
        const Asparagus(),
        const Onion(),
        const Potato(),
        const Potato(),
        const Onion(),
        const Potato(),
        const Potato(),
      ),
    );
  }
}
