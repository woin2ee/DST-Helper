// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_value.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FoodValueImpl _$$FoodValueImplFromJson(Map<String, dynamic> json) =>
    _$FoodValueImpl(
      category: $enumDecode(_$FoodValueCategoryEnumMap, json['category']),
      quantifiedValue: (json['quantifiedValue'] as num).toDouble(),
    );

Map<String, dynamic> _$$FoodValueImplToJson(_$FoodValueImpl instance) =>
    <String, dynamic>{
      'category': _$FoodValueCategoryEnumMap[instance.category]!,
      'quantifiedValue': instance.quantifiedValue,
    };

const _$FoodValueCategoryEnumMap = {
  FoodValueCategory.meat: 'meat',
  FoodValueCategory.fish: 'fish',
  FoodValueCategory.vegetable: 'vegetable',
  FoodValueCategory.fruit: 'fruit',
  FoodValueCategory.sweetener: 'sweetener',
  FoodValueCategory.egg: 'egg',
  FoodValueCategory.dairy: 'dairy',
  FoodValueCategory.monster: 'monster',
  FoodValueCategory.inedible: 'inedible',
};

_$FoodValuesImpl _$$FoodValuesImplFromJson(Map<String, dynamic> json) =>
    _$FoodValuesImpl(
      (json['rawValues'] as List<dynamic>)
          .map((e) => FoodValue.fromJson(e as Map<String, dynamic>))
          .toSet(),
    );

Map<String, dynamic> _$$FoodValuesImplToJson(_$FoodValuesImpl instance) =>
    <String, dynamic>{
      'rawValues': instance.rawValues.toList(),
    };
