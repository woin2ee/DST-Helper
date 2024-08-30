// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NutrientImpl _$$NutrientImplFromJson(Map<String, dynamic> json) =>
    _$NutrientImpl(
      compost: (json['compost'] as num).toInt(),
      growthFormula: (json['growthFormula'] as num).toInt(),
      manure: (json['manure'] as num).toInt(),
    );

Map<String, dynamic> _$$NutrientImplToJson(_$NutrientImpl instance) =>
    <String, dynamic>{
      'compost': instance.compost,
      'growthFormula': instance.growthFormula,
      'manure': instance.manure,
    };
