import 'package:dst_helper/farm_page/farm_plant/farm_plant_data.dart';
import 'package:dst_helper/models/v1/season.dart';

enum FarmPlantSetStyle {
  single,
  double,
  square;
}

sealed class FarmPlantSetData {
  FarmPlantSetData({required this.farmPlantDataList});

  final List<FarmPlantData> farmPlantDataList;

  FarmPlantSetStyle get farmPlantSetStyle;
  int get farmPlantsCount;

  FarmPlantSetData copyWith({List<FarmPlantData>? farmPlantDataList});

  Seasons get suitableSeasons {
    Seasons seasons = {
      Season.spring,
      Season.summer,
      Season.autumn,
      Season.winter,
    };
    for (final farmPlant in farmPlantDataList) {
      for (final plant in farmPlant.plants) {
        if (plant == null) continue;
        seasons = seasons.intersection(plant.seasons);
      }
    }
    return seasons;
  }

  Map<String, dynamic> toJson();
}

class SingleFarmPlantSetData extends FarmPlantSetData {
  SingleFarmPlantSetData({required FarmPlantData farmPlantData}) : super(farmPlantDataList: [farmPlantData]);

  SingleFarmPlantSetData.fromJson(Map<String, dynamic> json)
      : super(
          farmPlantDataList: json['farmPlantDataList'] as List<FarmPlantData>,
        );

  @override
  FarmPlantSetData copyWith({List<FarmPlantData>? farmPlantDataList}) {
    return SingleFarmPlantSetData(farmPlantData: farmPlantDataList?[0] ?? farmPlantData);
  }

  @override
  int get farmPlantsCount => 1;

  @override
  FarmPlantSetStyle get farmPlantSetStyle => FarmPlantSetStyle.single;

  FarmPlantData get farmPlantData => farmPlantDataList[0];

  @override
  Map<String, dynamic> toJson() => {
        'farmPlantDataList': farmPlantDataList,
      };
}

class DoubleFarmPlantSetData extends FarmPlantSetData {
  DoubleFarmPlantSetData({
    required FarmPlantData left,
    required FarmPlantData right,
  }) : super(farmPlantDataList: [
          left,
          right,
        ]);

  @override
  int get farmPlantsCount => 2;

  @override
  FarmPlantSetStyle get farmPlantSetStyle => FarmPlantSetStyle.double;

  @override
  FarmPlantSetData copyWith({List<FarmPlantData>? farmPlantDataList}) {
    return DoubleFarmPlantSetData(
      left: farmPlantDataList?[0] ?? this.farmPlantDataList[0],
      right: farmPlantDataList?[1] ?? this.farmPlantDataList[1],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}

class SquareFarmPlantSetData extends FarmPlantSetData {
  SquareFarmPlantSetData({
    required FarmPlantData topLeft,
    required FarmPlantData topRight,
    required FarmPlantData bottomLeft,
    required FarmPlantData bottomRight,
  }) : super(farmPlantDataList: [
          topLeft,
          topRight,
          bottomLeft,
          bottomRight,
        ]);

  @override
  int get farmPlantsCount => 4;

  @override
  FarmPlantSetStyle get farmPlantSetStyle => FarmPlantSetStyle.square;

  @override
  FarmPlantSetData copyWith({List<FarmPlantData>? farmPlantDataList}) {
    return SquareFarmPlantSetData(
      topLeft: farmPlantDataList?[0] ?? this.farmPlantDataList[0],
      topRight: farmPlantDataList?[1] ?? this.farmPlantDataList[1],
      bottomLeft: farmPlantDataList?[2] ?? this.farmPlantDataList[2],
      bottomRight: farmPlantDataList?[3] ?? this.farmPlantDataList[3],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
