import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../farm_page_controller.dart';
import 'farm_card/farm_card.dart';

export 'farm_card/farm_card.dart';

class FarmGrid extends StatelessWidget {
  const FarmGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final farmPageController = context.watch<FarmPageController>();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: Wrap(
          spacing: 10.0,
          runSpacing: 10.0,
          children: [
            ...farmPageController.farmCardModelsBySelectedSeason.map((model) => IntrinsicWidth(
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
