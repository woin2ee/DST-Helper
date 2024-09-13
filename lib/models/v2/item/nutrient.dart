import 'package:freezed_annotation/freezed_annotation.dart';

part 'nutrient.freezed.dart';
part 'nutrient.g.dart';

/// 영양분
@freezed
class Nutrient with _$Nutrient {
  const factory Nutrient({
    /// 퇴비
    required int compost,

    /// 성장 촉진제
    required int growthFormula,

    /// 거름
    required int manure,
  }) = _Nutrient;
  const Nutrient._();

  factory Nutrient.zero() {
    return const Nutrient(compost: 0, growthFormula: 0, manure: 0);
  }

  factory Nutrient.fromJson(Map<String, Object?> json) => _$NutrientFromJson(json);

  Nutrient operator +(Nutrient right) => Nutrient(
        compost: compost + right.compost,
        growthFormula: growthFormula + right.growthFormula,
        manure: manure + right.manure,
      );
}
