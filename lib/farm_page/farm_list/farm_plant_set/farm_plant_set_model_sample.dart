import 'package:built_collection/built_collection.dart';
import 'package:dst_helper/farm_page/farm_list/farm_plant/farm_plant_model.dart';
import 'package:dst_helper/farm_page/farm_list/farm_plant_set/farm_plant_set_model.dart';
import 'package:dst_helper/models/v2/item/items.dart';

class FarmPlantSetModelSample {
  FarmPlantSetModelSample._();

  static BuiltList<FarmPlantSetModel> get preDefinedList {
    return BuiltList.of([
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
    ]);
  }

  static FarmPlantSetModel get preDefined1 {
    return FarmPlantSetModel.single(
      farmPlantModel: FarmPlantModel.basic(
        Items.potato,
        Items.potato,
        Items.potato,
        Items.potato,
        null,
        Items.tomaRoot,
        Items.tomaRoot,
        Items.tomaRoot,
        Items.tomaRoot,
      ),
    );
  }

  static FarmPlantSetModel get preDefined2 {
    return FarmPlantSetModel.double(
      left: FarmPlantModel.basic(
        Items.dragonFruit,
        Items.dragonFruit,
        Items.dragonFruit,
        Items.tomaRoot,
        Items.tomaRoot,
        Items.tomaRoot,
        Items.tomaRoot,
        Items.tomaRoot,
        Items.tomaRoot,
      ),
      right: FarmPlantModel.basic(
        Items.dragonFruit,
        Items.dragonFruit,
        Items.dragonFruit,
        Items.tomaRoot,
        Items.tomaRoot,
        Items.tomaRoot,
        Items.tomaRoot,
        Items.tomaRoot,
        Items.tomaRoot,
      ),
    );
  }

  static FarmPlantSetModel get preDefined3 {
    return FarmPlantSetModel.double(
      left: FarmPlantModel.dense(
        Items.pumpkin,
        Items.garlic,
        Items.pumpkin,
        Items.pumpkin,
        Items.garlic,
        Items.pumpkin,
        Items.potato,
        Items.potato,
        Items.potato,
        Items.potato,
      ),
      right: FarmPlantModel.reverseDense(
        Items.garlic,
        Items.pumpkin,
        Items.pumpkin,
        Items.garlic,
        Items.pumpkin,
        Items.potato,
        Items.potato,
        Items.pumpkin,
        Items.potato,
        Items.potato,
      ),
    );
  }

  static FarmPlantSetModel get preDefined4 {
    return FarmPlantSetModel.double(
      left: FarmPlantModel.basic(
        Items.onion,
        Items.onion,
        Items.onion,
        Items.garlic,
        Items.garlic,
        Items.garlic,
        Items.dragonFruit,
        Items.dragonFruit,
        Items.dragonFruit,
      ),
      right: FarmPlantModel.basic(
        Items.onion,
        Items.onion,
        Items.onion,
        Items.garlic,
        Items.garlic,
        Items.garlic,
        Items.dragonFruit,
        Items.dragonFruit,
        Items.dragonFruit,
      ),
    );
  }

  static FarmPlantSetModel get preDefined5 {
    return FarmPlantSetModel.double(
      left: FarmPlantModel.basic(
        Items.onion,
        Items.onion,
        Items.onion,
        Items.watermelon,
        Items.watermelon,
        Items.watermelon,
        Items.watermelon,
        Items.watermelon,
        Items.watermelon,
      ),
      right: FarmPlantModel.basic(
        Items.onion,
        Items.onion,
        Items.onion,
        Items.watermelon,
        Items.watermelon,
        Items.watermelon,
        Items.watermelon,
        Items.watermelon,
        Items.watermelon,
      ),
    );
  }

  static FarmPlantSetModel get preDefined6 {
    return FarmPlantSetModel.double(
      left: FarmPlantModel.basic(
        Items.potato,
        Items.potato,
        Items.garlic,
        Items.potato,
        null,
        Items.garlic,
        Items.potato,
        Items.onion,
        Items.onion,
      ),
      right: FarmPlantModel.basic(
        Items.garlic,
        Items.potato,
        Items.potato,
        Items.garlic,
        null,
        Items.potato,
        Items.onion,
        Items.onion,
        Items.potato,
      ),
    );
  }

  static FarmPlantSetModel get preDefined7 {
    return FarmPlantSetModel.double(
      left: FarmPlantModel.basic(
        Items.asparagus,
        Items.asparagus,
        Items.asparagus,
        Items.potato,
        Items.potato,
        Items.potato,
        Items.pumpkin,
        Items.pumpkin,
        Items.pumpkin,
      ),
      right: FarmPlantModel.basic(
        Items.asparagus,
        Items.asparagus,
        Items.asparagus,
        Items.potato,
        Items.potato,
        Items.potato,
        Items.pumpkin,
        Items.pumpkin,
        Items.pumpkin,
      ),
    );
  }

  static FarmPlantSetModel get preDefined8 {
    return FarmPlantSetModel.single(
      farmPlantModel: FarmPlantModel.basic(
        Items.watermelon,
        Items.watermelon,
        Items.watermelon,
        Items.watermelon,
        null,
        Items.carrot,
        Items.carrot,
        Items.carrot,
        Items.carrot,
      ),
    );
  }

  static FarmPlantSetModel get preDefined9 {
    return FarmPlantSetModel.single(
      farmPlantModel: FarmPlantModel.basic(
        Items.onion,
        Items.onion,
        Items.onion,
        Items.garlic,
        Items.garlic,
        Items.garlic,
        Items.pepper,
        Items.pepper,
        Items.pepper,
      ),
    );
  }

  static FarmPlantSetModel get preDefined10 {
    return FarmPlantSetModel.square(
      topLeft: FarmPlantModel.basic(
        null,
        null,
        Items.potato,
        null,
        null,
        Items.potato,
        Items.pumpkin,
        Items.pumpkin,
        Items.garlic,
      ),
      topRight: FarmPlantModel.basic(
        Items.potato,
        null,
        null,
        Items.potato,
        null,
        null,
        Items.garlic,
        Items.pumpkin,
        Items.pumpkin,
      ),
      bottomLeft: FarmPlantModel.basic(
        Items.pumpkin,
        Items.pumpkin,
        Items.garlic,
        null,
        null,
        Items.potato,
        null,
        null,
        Items.potato,
      ),
      bottomRight: FarmPlantModel.basic(
        Items.garlic,
        Items.pumpkin,
        Items.pumpkin,
        Items.potato,
        null,
        null,
        Items.potato,
        null,
        null,
      ),
    );
  }

  static FarmPlantSetModel get preDefined11 {
    return FarmPlantSetModel.square(
      topLeft: FarmPlantModel.basic(
        Items.potato,
        Items.potato,
        Items.onion,
        Items.potato,
        Items.potato,
        Items.onion,
        Items.asparagus,
        Items.asparagus,
        Items.garlic,
      ),
      topRight: FarmPlantModel.basic(
        Items.onion,
        Items.potato,
        Items.potato,
        Items.onion,
        Items.potato,
        Items.potato,
        Items.garlic,
        Items.asparagus,
        Items.asparagus,
      ),
      bottomLeft: FarmPlantModel.basic(
        Items.asparagus,
        Items.asparagus,
        Items.garlic,
        Items.potato,
        Items.potato,
        Items.onion,
        Items.potato,
        Items.potato,
        Items.onion,
      ),
      bottomRight: FarmPlantModel.basic(
        Items.garlic,
        Items.asparagus,
        Items.asparagus,
        Items.onion,
        Items.potato,
        Items.potato,
        Items.onion,
        Items.potato,
        Items.potato,
      ),
    );
  }
}
