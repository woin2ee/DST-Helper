import 'package:dst_helper/farm_page/farm_page_controller.dart';
import 'package:dst_helper/models/v1/localization/season_localization.dart';
import 'package:dst_helper/models/v1/season.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SeasonSelectionBox extends StatelessWidget {
  SeasonSelectionBox({super.key});

  final List<Season> _seasons = [
    Season.spring,
    Season.summer,
    Season.autumn,
    Season.winter,
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<FarmPageController>(
      builder: (context, model, child) => ToggleButtons(
        borderRadius: BorderRadius.circular(10),
        constraints: const BoxConstraints(
          minWidth: 70,
          minHeight: 40,
        ),
        isSelected: _seasons.map((season) => season == model.selectedSeason).toList(),
        onPressed: (index) {
          model.selectedSeason = _seasons[index];
        },
        children: [
          ...Season.values.map((season) => Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                ),
                child: Text(
                  season.localizedName(context),
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
