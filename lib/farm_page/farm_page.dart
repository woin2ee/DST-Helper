import 'package:dst_helper/farm_page/seed_info_box.dart';
import 'package:dst_helper/farm_plant.dart';
import 'package:dst_helper/models/crop.dart';
import 'package:dst_helper/models/season.dart';
import 'package:flutter/material.dart';

class FarmPage extends StatefulWidget {
  const FarmPage({super.key});

  @override
  State<StatefulWidget> createState() => _FarmPageState();
}

class _FarmPageState extends State<FarmPage> {
  final List<(Season, bool)> selectedSeasonState = [
    (Season.spring, true),
    (Season.summer, false),
    (Season.autumn, false),
    (Season.winter, false),
  ];

  @override
  Widget build(BuildContext context) {
    final Widget currentSeason;
    final selectedSeason =
        selectedSeasonState.firstWhere((element) => element.$2 == true).$1;

    switch (selectedSeason) {
      case Season.spring:
        currentSeason = Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FarmPlantGroupCard.preDefined1(),
                FarmPlantGroupCard.preDefined2(),
                FarmPlantGroupCard.preDefined4(),
              ],
            ),
            Row(
              children: [
                FarmPlantGroupCard.preDefined5(),
                FarmPlantGroupCard.preDefined6(),
                FarmPlantGroupCard.preDefined8(),
              ],
            ),
          ],
        );
      case Season.summer:
        currentSeason = Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FarmPlantGroupCard.preDefined2(),
                FarmPlantGroupCard.preDefined4(),
                FarmPlantGroupCard.preDefined5(),
              ],
            ),
            Row(
              children: [
                FarmPlantGroupCard.preDefined9(),
              ],
            ),
          ],
        );
      case Season.autumn:
        currentSeason = Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FarmPlantGroupCard.preDefined1(),
                FarmPlantGroupCard.preDefined3(),
                FarmPlantGroupCard.preDefined6(),
              ],
            ),
            Row(
              children: [
                FarmPlantGroupCard.preDefined9(),
              ],
            ),
          ],
        );
      case Season.winter:
        currentSeason = Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FarmPlantGroupCard.preDefined3(),
                FarmPlantGroupCard.preDefined7(),
              ],
            ),
          ],
        );
    }

    return Theme(
      data: ThemeData(
        useMaterial3: true,
        colorScheme:
            ColorScheme.fromSeed(seedColor: selectedSeason.personalColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ToggleButtons(
                    borderRadius: BorderRadius.circular(10),
                    constraints: const BoxConstraints(
                      minWidth: 70,
                      minHeight: 40,
                    ),
                    textStyle: const TextStyle(
                      fontSize: 18,
                    ),
                    isSelected: selectedSeasonState
                        .map((element) => element.$2)
                        .toList(),
                    onPressed: (int index) {
                      setState(() {
                        for (var i = 0; i < Season.values.length; i++) {
                          selectedSeasonState[i] =
                              (selectedSeasonState[i].$1, i == index);
                        }
                      });
                    },
                    children: Season.values.map((e) => Text(e.name)).toList(),
                  ),
                ),
                currentSeason,
              ],
            ),
          ),
          const SeedInfoBox(),
        ],
      ),
    );
  }
}
