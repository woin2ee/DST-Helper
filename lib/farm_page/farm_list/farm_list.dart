import 'package:dst_helper/farm_page/farm_list/farm_plant_card.dart';
import 'package:dst_helper/farm_page/farm_list/models/farm_page_model.dart';
import 'package:dst_helper/farm_page/farm_list/models/farm_plant_card_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FarmList extends StatelessWidget {
  const FarmList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FarmPageModel>(
      builder: (BuildContext context, FarmPageModel model, Widget? child) {
        return FutureBuilder(
          future: model.farmPlantCardList,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const Center(child: Text('Loading...'));
              case ConnectionState.active:
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                if (snapshot.hasData) {
                  final data = snapshot.data as List<FarmPlantCardModel>;
                  final dataBySelectedSeason = data.where((farmPlantCardModel) {
                    return farmPlantCardModel.farmPlantSetModel.suitableSeasons.contains(model.selectedSeason);
                  });
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Wrap(
                        spacing: 10.0,
                        runSpacing: 10.0,
                        children: [
                          ...dataBySelectedSeason.map((farmPlantCardModel) => IntrinsicWidth(
                                child: FarmPlantCard(
                                  model: farmPlantCardModel,
                                  onStarPressed: (favorite) {
                                    // Fxxking call back once again.
                                  },
                                ),
                              )),
                        ],
                      ),
                    ),
                  );
                }
                return const Text('There is no data');
            }
          },
        );
      },
    );
  }
}
