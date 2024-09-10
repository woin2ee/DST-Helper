import 'package:dst_helper/farm_page/farm_list/farm_plant_set/farm_plant_set_model.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'farm_plant_card_model.g.dart';

enum CreateType {
  sample,
  userCustom,
}

@JsonSerializable()
class FarmPlantCardModel extends ChangeNotifier {
  @visibleForTesting
  FarmPlantCardModel({
    required this.id,
    required this.title,
    required this.farmPlantSetModel,
    required this.favorite,
    required this.createType,
    required bool isHidden,
  }) : _isHidden = isHidden;

  factory FarmPlantCardModel.create({
    String? title,
    required FarmPlantSetModel farmPlantSetModel,
    required CreateType createType,
  }) {
    return FarmPlantCardModel(
      id: const Uuid().v4(),
      title: title,
      farmPlantSetModel: farmPlantSetModel,
      createType: createType,
      isHidden: false,
      favorite: ValueNotifier(false),
    );
  }

  final String id;

  final String? title;

  final FarmPlantSetModel farmPlantSetModel;

  @BooleanValueNotifierConverter()
  final ValueNotifier<bool> favorite;

  final CreateType createType;

  bool _isHidden;
  bool get isHidden => _isHidden;
  set isHidden(bool value) {
    _isHidden = value;
    notifyListeners();
  }

  factory FarmPlantCardModel.fromJson(Map<String, dynamic> json) => _$FarmPlantCardModelFromJson(json);
  Map<String, dynamic> toJson() => _$FarmPlantCardModelToJson(this);

  FarmPlantCardModel copyWith({
    String? id,
    String? title,
    FarmPlantSetModel? farmPlantSetModel,
    bool? favorite,
    CreateType? createType,
    bool? isHidden,
  }) {
    return FarmPlantCardModel(
      id: id ?? this.id,
      title: title ?? this.title,
      farmPlantSetModel: farmPlantSetModel ?? this.farmPlantSetModel.copy(),
      favorite: favorite != null ? ValueNotifier(favorite) : ValueNotifier(this.favorite.value),
      createType: createType ?? this.createType,
      isHidden: isHidden ?? this.isHidden,
    );
  }
}

class BooleanValueNotifierConverter implements JsonConverter<ValueNotifier<bool>, bool> {
  const BooleanValueNotifierConverter();

  @override
  ValueNotifier<bool> fromJson(bool json) => ValueNotifier(json);

  @override
  bool toJson(ValueNotifier<bool> object) => object.value;
}
