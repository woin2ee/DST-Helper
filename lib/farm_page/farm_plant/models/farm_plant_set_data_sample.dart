import 'package:dst_helper/farm_page/farm_plant/models/farm_plant_data.dart';
import 'package:dst_helper/farm_page/farm_plant/models/farm_plant_set_data.dart';
import 'package:dst_helper/models/v2/item/items.dart';

class FarmPlantSetDataSample {
  static List<FarmPlantSetData> get preDefinedList {
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

  static FarmPlantSetData get preDefined1 {
    return FarmPlantSetData.single(
      farmPlantData: FarmPlantData.basic(
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

  static FarmPlantSetData get preDefined2 {
    return FarmPlantSetData.double(
      left: FarmPlantData.basic(
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
      right: FarmPlantData.basic(
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

  static FarmPlantSetData get preDefined3 {
    return FarmPlantSetData.double(
      left: FarmPlantData.dense(
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
      right: FarmPlantData.reverseDense(
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

  static FarmPlantSetData get preDefined4 {
    return FarmPlantSetData.double(
      left: FarmPlantData.basic(
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
      right: FarmPlantData.basic(
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

  static FarmPlantSetData get preDefined5 {
    return FarmPlantSetData.double(
      left: FarmPlantData.basic(
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
      right: FarmPlantData.basic(
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

  static FarmPlantSetData get preDefined6 {
    return FarmPlantSetData.double(
      left: FarmPlantData.basic(
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
      right: FarmPlantData.basic(
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

  static FarmPlantSetData get preDefined7 {
    return FarmPlantSetData.double(
      left: FarmPlantData.basic(
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
      right: FarmPlantData.basic(
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

  static FarmPlantSetData get preDefined8 {
    return FarmPlantSetData.single(
      farmPlantData: FarmPlantData.basic(
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

  static FarmPlantSetData get preDefined9 {
    return FarmPlantSetData.single(
      farmPlantData: FarmPlantData.basic(
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

  static FarmPlantSetData get preDefined10 {
    return FarmPlantSetData.square(
      topLeft: FarmPlantData.basic(
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
      topRight: FarmPlantData.basic(
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
      bottomLeft: FarmPlantData.basic(
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
      bottomRight: FarmPlantData.basic(
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

  static FarmPlantSetData get preDefined11 {
    return FarmPlantSetData.square(
      topLeft: FarmPlantData.basic(
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
      topRight: FarmPlantData.basic(
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
      bottomLeft: FarmPlantData.basic(
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
      bottomRight: FarmPlantData.basic(
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
