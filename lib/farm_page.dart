import 'package:dst_helper/farm_plant.dart';
import 'package:dst_helper/models/crop.dart';
import 'package:dst_helper/models/season.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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

  bool seedsBarFolded = true;

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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 16),
                decoration: BoxDecoration(
                  color: Colors.brown.shade400,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                child: IconButton(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 3),
                  iconSize: 20,
                  onPressed: () {
                    setState(() {
                      seedsBarFolded = !seedsBarFolded;
                    });
                  },
                  icon: Image.asset(
                    "seeds/seeds.png",
                    width: 50,
                  ),
                ),
              ),
              if (!seedsBarFolded) SeedInfoBox(),
            ],
          ),
        ],
      ),
    );
  }
}

class SeedInfoBox extends StatelessWidget {
  SeedInfoBox({super.key});

  final List<Crop> seedCrops =
      Crop.values.where((crop) => crop.hasSeeds).toList();

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        padding: const EdgeInsets.all(12),
        color: Colors.brown.shade400,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Seeds",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Center(
              child: Column(
                children: seedCrops.map((crop) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'seeds/${crop.name}_seeds.png',
                        width: 46,
                      ),
                      const Text(
                        "=",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          letterSpacing: 10,
                        ),
                      ),
                      Image.asset(
                        'crops/${crop.name}.png',
                        width: 46,
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
