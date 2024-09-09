import 'package:dst_helper/farm_page/edit_farm_set/edit_farm_set_controller.dart';
import 'package:dst_helper/localization/text_localizations.dart';
import 'package:dst_helper/models/v2/localization.dart';
import 'package:dst_helper/utils/font_family.dart';
import 'package:flutter/material.dart';

class AnalysisView extends StatelessWidget {
  const AnalysisView({
    super.key,
    required this.controller,
  });

  final EditFarmSetController controller;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller.farmPlantSetModel,
      builder: (context, child) {
        return Column(
          spacing: 12,
          children: [
            if (controller.farmPlantSetModel.hasAnyPlant)
              Text(
                '${TextLocalizations.of(context)!.localized('suitable_seasons')}: ${controller.farmPlantSetModel.suitableSeasons.map((season) => season.localizedName(context))}',
                style: const TextStyle(
                  fontFamily: FontFamily.pretendard,
                ),
              ),
            Builder(
              builder: (context) {
                if (controller.farmPlantSetModel.hasBalancedNutrients && controller.farmPlantSetModel.hasAnyPlant) {
                  return Text(
                    '${TextLocalizations.of(context)!.localized('balanced_nutrients')}!',
                    style: const TextStyle(
                      fontFamily: FontFamily.pretendard,
                    ),
                  );
                }
                final countOfFertilizerNeeded = controller.calculateCountOfFertilizerNeeded();
                if (countOfFertilizerNeeded != null) {
                  return Text(
                    '영양소 충족! (성장 단계 마다 각 밭에 $countOfFertilizerNeeded번 비료를 줘야합니다.)',
                    style: const TextStyle(
                      fontFamily: FontFamily.pretendard,
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        );
      },
    );
  }
}
