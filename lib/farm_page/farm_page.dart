import 'package:dst_helper/farm_page/farm_plant/farm_plant_set_sample.dart';
import 'package:dst_helper/farm_page/side_info_box/side_info_box.dart';
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
    final selectedSeason = selectedSeasonState.firstWhere((element) => element.$2 == true).$1;

    return Theme(
      data: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: selectedSeason.personalColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: WeatherSelectionButton(
                        onSelected: (index) {
                          setState(() {
                            for (var i = 0; i < Season.values.length; i++) {
                              selectedSeasonState[i] = (selectedSeasonState[i].$1, i == index);
                            }
                          });
                        },
                        selectedSeasonState: selectedSeasonState.map((element) => element.$2).toList(),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('New'),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FarmList(selectedSeason: selectedSeason),
                  ),
                )
              ],
            ),
          ),
          const SideInfoBox(),
        ],
      ),
    );
  }
}

class WeatherSelectionButton extends StatelessWidget {
  const WeatherSelectionButton({super.key, required this.onSelected, required this.selectedSeasonState});

  final Function(int) onSelected;
  final List<bool> selectedSeasonState;

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      borderRadius: BorderRadius.circular(10),
      constraints: const BoxConstraints(
        minWidth: 60,
        minHeight: 40,
      ),
      textStyle: const TextStyle(
        fontSize: 18,
      ),
      isSelected: selectedSeasonState,
      onPressed: onSelected,
      children: Season.values.map((e) => Text(e.name)).toList(),
    );
  }
}

class FarmList extends StatelessWidget {
  const FarmList({super.key, required this.selectedSeason});

  final Season selectedSeason;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        spacing: 10.0,
        runSpacing: 10.0,
        children: switch (selectedSeason) {
          Season.spring => [
              FittedBox(child: FarmPlantSetSample.preDefined1),
              FittedBox(child: FarmPlantSetSample.preDefined2),
              FittedBox(child: FarmPlantSetSample.preDefined4),
              FittedBox(child: FarmPlantSetSample.preDefined5),
              FittedBox(child: FarmPlantSetSample.preDefined6),
              FittedBox(child: FarmPlantSetSample.preDefined8),
            ],
          Season.summer => [
              FittedBox(child: FarmPlantSetSample.preDefined2),
              FittedBox(child: FarmPlantSetSample.preDefined4),
              FittedBox(child: FarmPlantSetSample.preDefined5),
              FittedBox(child: FarmPlantSetSample.preDefined9),
            ],
          Season.autumn => [
              FittedBox(child: FarmPlantSetSample.preDefined1),
              FittedBox(child: FarmPlantSetSample.preDefined3),
              FittedBox(child: FarmPlantSetSample.preDefined6),
              FittedBox(child: FarmPlantSetSample.preDefined9),
              FittedBox(child: FarmPlantSetSample.preDefined10),
            ],
          Season.winter => [
              FittedBox(child: FarmPlantSetSample.preDefined3),
              FittedBox(child: FarmPlantSetSample.preDefined7),
              FittedBox(child: FarmPlantSetSample.preDefined10),
            ],
        },
      ),
    );
  }
}
