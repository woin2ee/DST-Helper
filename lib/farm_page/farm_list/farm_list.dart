import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../farm_page_notifier.dart';
import 'farm_plant_card/farm_card.dart';

export 'farm_plant_card/farm_card.dart';

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
            ...context.watch<FarmPageNotifier>().farmCardModelsBySelectedSeason.map((model) => IntrinsicWidth(
                  child: FarmCard(
                    model: model,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
