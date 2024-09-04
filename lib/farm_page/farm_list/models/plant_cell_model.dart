import 'package:dst_helper/models/v2/item/item.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'plant_cell_model.g.dart';

@JsonSerializable()
class PlantCellModel extends ChangeNotifier {
  PlantCellModel({
    Plant? plant,
    bool darkTheme = false,
  })  : _plant = plant,
        _darkTheme = darkTheme;

  Plant? _plant;
  Plant? get plant => _plant;
  set plant(Plant? value) {
    _plant = value;
    notifyListeners();
  }

  bool _darkTheme;
  bool get darkTheme => _darkTheme;
  set darkTheme(bool value) {
    _darkTheme = value;
    notifyListeners();
  }

  PlantCellModel copyWith({
    bool? darkTheme,
  }) {
    return PlantCellModel(
      plant: plant,
      darkTheme: darkTheme ?? this.darkTheme,
    );
  }

  factory PlantCellModel.fromJson(Map<String, dynamic> json) => _$PlantCellModelFromJson(json);
  Map<String, dynamic> toJson() => _$PlantCellModelToJson(this);

  @override
  bool operator ==(Object other) {
    return other is PlantCellModel &&
        other.runtimeType == runtimeType &&
        other.plant == plant &&
        other.darkTheme == darkTheme;
  }

  @override
  int get hashCode => Object.hash(plant, darkTheme);
}
