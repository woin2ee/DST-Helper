import 'package:dst_helper/farm_page/farm_list/farm_plant/farm_plant_model.dart';
import 'package:dst_helper/farm_page/farm_list/farm_plant_set/farm_plant_set_model.dart';
import 'package:dst_helper/models/v2/item/items.dart';

class FarmPlantSetModelSample {
  static List<FarmPlantSetModel> get preDefinedList {
    return [
      preDefined1,
      preDefined2,
      preDefined3,
      preDefined4,
      preDefined5,
      preDefined6,
      preDefined7,
      preDefined8,
      preDefined9,
      preDefined10,
      preDefined11,
      // preDefined12,
      // preDefined13,
      // preDefined14,
      // preDefined15,
      // preDefined16,
    ];
  }

  static FarmPlantSetModel get preDefined1 {
    return FarmPlantSetModel.single(
      farmPlantModel: FarmPlantModel.basic(
        Crops.potato,
        Crops.potato,
        Crops.potato,
        Crops.potato,
        null,
        Crops.tomaRoot,
        Crops.tomaRoot,
        Crops.tomaRoot,
        Crops.tomaRoot,
      ),
    );
  }

  static FarmPlantSetModel get preDefined2 {
    return FarmPlantSetModel.double(
      left: FarmPlantModel.basic(
        Crops.dragonFruit,
        Crops.dragonFruit,
        Crops.dragonFruit,
        Crops.tomaRoot,
        Crops.tomaRoot,
        Crops.tomaRoot,
        Crops.tomaRoot,
        Crops.tomaRoot,
        Crops.tomaRoot,
      ),
      right: FarmPlantModel.basic(
        Crops.dragonFruit,
        Crops.dragonFruit,
        Crops.dragonFruit,
        Crops.tomaRoot,
        Crops.tomaRoot,
        Crops.tomaRoot,
        Crops.tomaRoot,
        Crops.tomaRoot,
        Crops.tomaRoot,
      ),
    );
  }

  static FarmPlantSetModel get preDefined3 {
    return FarmPlantSetModel.double(
      left: FarmPlantModel.dense(
        Crops.pumpkin,
        Crops.garlic,
        Crops.pumpkin,
        Crops.pumpkin,
        Crops.garlic,
        Crops.pumpkin,
        Crops.potato,
        Crops.potato,
        Crops.potato,
        Crops.potato,
      ),
      right: FarmPlantModel.reverseDense(
        Crops.garlic,
        Crops.pumpkin,
        Crops.pumpkin,
        Crops.garlic,
        Crops.pumpkin,
        Crops.potato,
        Crops.potato,
        Crops.pumpkin,
        Crops.potato,
        Crops.potato,
      ),
    );
  }

  static FarmPlantSetModel get preDefined4 {
    return FarmPlantSetModel.double(
      left: FarmPlantModel.basic(
        Crops.onion,
        Crops.onion,
        Crops.onion,
        Crops.garlic,
        Crops.garlic,
        Crops.garlic,
        Crops.dragonFruit,
        Crops.dragonFruit,
        Crops.dragonFruit,
      ),
      right: FarmPlantModel.basic(
        Crops.onion,
        Crops.onion,
        Crops.onion,
        Crops.garlic,
        Crops.garlic,
        Crops.garlic,
        Crops.dragonFruit,
        Crops.dragonFruit,
        Crops.dragonFruit,
      ),
    );
  }

  static FarmPlantSetModel get preDefined5 {
    return FarmPlantSetModel.double(
      left: FarmPlantModel.basic(
        Crops.onion,
        Crops.onion,
        Crops.onion,
        Crops.watermelon,
        Crops.watermelon,
        Crops.watermelon,
        Crops.watermelon,
        Crops.watermelon,
        Crops.watermelon,
      ),
      right: FarmPlantModel.basic(
        Crops.onion,
        Crops.onion,
        Crops.onion,
        Crops.watermelon,
        Crops.watermelon,
        Crops.watermelon,
        Crops.watermelon,
        Crops.watermelon,
        Crops.watermelon,
      ),
    );
  }

  static FarmPlantSetModel get preDefined6 {
    return FarmPlantSetModel.double(
      left: FarmPlantModel.basic(
        Crops.potato,
        Crops.potato,
        Crops.garlic,
        Crops.potato,
        null,
        Crops.garlic,
        Crops.potato,
        Crops.onion,
        Crops.onion,
      ),
      right: FarmPlantModel.basic(
        Crops.garlic,
        Crops.potato,
        Crops.potato,
        Crops.garlic,
        null,
        Crops.potato,
        Crops.onion,
        Crops.onion,
        Crops.potato,
      ),
    );
  }

  static FarmPlantSetModel get preDefined7 {
    return FarmPlantSetModel.double(
      left: FarmPlantModel.basic(
        Crops.asparagus,
        Crops.asparagus,
        Crops.asparagus,
        Crops.potato,
        Crops.potato,
        Crops.potato,
        Crops.pumpkin,
        Crops.pumpkin,
        Crops.pumpkin,
      ),
      right: FarmPlantModel.basic(
        Crops.asparagus,
        Crops.asparagus,
        Crops.asparagus,
        Crops.potato,
        Crops.potato,
        Crops.potato,
        Crops.pumpkin,
        Crops.pumpkin,
        Crops.pumpkin,
      ),
    );
  }

  static FarmPlantSetModel get preDefined8 {
    return FarmPlantSetModel.single(
      farmPlantModel: FarmPlantModel.basic(
        Crops.watermelon,
        Crops.watermelon,
        Crops.watermelon,
        Crops.watermelon,
        null,
        Crops.carrot,
        Crops.carrot,
        Crops.carrot,
        Crops.carrot,
      ),
    );
  }

  static FarmPlantSetModel get preDefined9 {
    return FarmPlantSetModel.single(
      farmPlantModel: FarmPlantModel.basic(
        Crops.onion,
        Crops.onion,
        Crops.onion,
        Crops.garlic,
        Crops.garlic,
        Crops.garlic,
        Crops.pepper,
        Crops.pepper,
        Crops.pepper,
      ),
    );
  }

  static FarmPlantSetModel get preDefined10 {
    return FarmPlantSetModel.square(
      topLeft: FarmPlantModel.basic(
        null,
        null,
        Crops.potato,
        null,
        null,
        Crops.potato,
        Crops.pumpkin,
        Crops.pumpkin,
        Crops.garlic,
      ),
      topRight: FarmPlantModel.basic(
        Crops.potato,
        null,
        null,
        Crops.potato,
        null,
        null,
        Crops.garlic,
        Crops.pumpkin,
        Crops.pumpkin,
      ),
      bottomLeft: FarmPlantModel.basic(
        Crops.pumpkin,
        Crops.pumpkin,
        Crops.garlic,
        null,
        null,
        Crops.potato,
        null,
        null,
        Crops.potato,
      ),
      bottomRight: FarmPlantModel.basic(
        Crops.garlic,
        Crops.pumpkin,
        Crops.pumpkin,
        Crops.potato,
        null,
        null,
        Crops.potato,
        null,
        null,
      ),
    );
  }

  static FarmPlantSetModel get preDefined11 {
    return FarmPlantSetModel.square(
      topLeft: FarmPlantModel.basic(
        Crops.potato,
        Crops.potato,
        Crops.onion,
        Crops.potato,
        Crops.potato,
        Crops.onion,
        Crops.asparagus,
        Crops.asparagus,
        Crops.garlic,
      ),
      topRight: FarmPlantModel.basic(
        Crops.onion,
        Crops.potato,
        Crops.potato,
        Crops.onion,
        Crops.potato,
        Crops.potato,
        Crops.garlic,
        Crops.asparagus,
        Crops.asparagus,
      ),
      bottomLeft: FarmPlantModel.basic(
        Crops.asparagus,
        Crops.asparagus,
        Crops.garlic,
        Crops.potato,
        Crops.potato,
        Crops.onion,
        Crops.potato,
        Crops.potato,
        Crops.onion,
      ),
      bottomRight: FarmPlantModel.basic(
        Crops.garlic,
        Crops.asparagus,
        Crops.asparagus,
        Crops.onion,
        Crops.potato,
        Crops.potato,
        Crops.onion,
        Crops.potato,
        Crops.potato,
      ),
    );
  }
}
