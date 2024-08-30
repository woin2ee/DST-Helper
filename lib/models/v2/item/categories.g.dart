// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SeedImpl _$$SeedImplFromJson(Map<String, dynamic> json) => _$SeedImpl(
      code: json['code'] as String,
      assetName: json['assetName'] as String,
      type: $enumDecode(_$FoodTypeEnumMap, json['type']),
      cookedAssetName: json['cookedAssetName'] as String,
      compositeAssetName: json['compositeAssetName'] as String?,
    );

Map<String, dynamic> _$$SeedImplToJson(_$SeedImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'assetName': instance.assetName,
      'type': _$FoodTypeEnumMap[instance.type]!,
      'cookedAssetName': instance.cookedAssetName,
      'compositeAssetName': instance.compositeAssetName,
    };

const _$FoodTypeEnumMap = {
  FoodType.veggie: 'veggie',
  FoodType.meat: 'meat',
  FoodType.generic: 'generic',
  FoodType.seeds: 'seeds',
  FoodType.goodies: 'goodies',
};

_$CropImpl _$$CropImplFromJson(Map<String, dynamic> json) => _$CropImpl(
      code: json['code'] as String,
      assetName: json['assetName'] as String,
      foodValues: json['foodValues'] == null
          ? null
          : FoodValues.fromJson(json['foodValues'] as Map<String, dynamic>),
      nutrient: Nutrient.fromJson(json['nutrient'] as Map<String, dynamic>),
      seasons: (json['seasons'] as List<dynamic>)
          .map((e) => $enumDecode(_$SeasonEnumMap, e))
          .toSet(),
      type: $enumDecode(_$FoodTypeEnumMap, json['type']),
      seed: Seed.fromJson(json['seed'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CropImplToJson(_$CropImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'assetName': instance.assetName,
      'foodValues': instance.foodValues,
      'nutrient': instance.nutrient,
      'seasons': instance.seasons.map((e) => _$SeasonEnumMap[e]!).toList(),
      'type': _$FoodTypeEnumMap[instance.type]!,
      'seed': instance.seed,
    };

const _$SeasonEnumMap = {
  Season.spring: 'spring',
  Season.summer: 'summer',
  Season.autumn: 'autumn',
  Season.winter: 'winter',
};
