import 'package:dst_helper/farm_page/farm_list/farm_plant_card.dart';
import 'package:dst_helper/farm_page/farm_list/models/farm_page_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FarmList extends StatelessWidget {
  const FarmList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: Wrap(
          spacing: 10.0,
          runSpacing: 10.0,
          children: [
            ...context.watch<FarmPageModel>().farmPlantCardModelListBySelectedSeason.map((model) => IntrinsicWidth(
                  child: FarmPlantCard(
                    model: model,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
