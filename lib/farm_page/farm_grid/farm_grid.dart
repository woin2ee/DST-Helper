import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../farm_page.dart' as farm_page;
import 'farm_card/farm_card.dart';

export 'farm_card/farm_card.dart';

class FarmGrid extends StatelessWidget {
  const FarmGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final farmPageModel = context.watch<farm_page.ViewModel>();
    
    const double spacing = 18.0;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: [
            ...farmPageModel.farmCardModelsBySelectedSeason.map((model) => IntrinsicWidth(
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
