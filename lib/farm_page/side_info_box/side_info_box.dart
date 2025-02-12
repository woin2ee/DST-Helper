import 'package:flutter/material.dart';

import 'crops_info_box.dart';
import 'fertilizers_info_box.dart';
import 'seeds_info_box.dart';

enum SideInfoMenu {
  seed,
  fertilizer,
  nutrients;

  Widget tag(void Function() onPressed) {
    return switch (this) {
      SideInfoMenu.seed => SeedsInfoBoxTag(
          size: SideInfoBox.tagSize,
          onPressed: onPressed,
          color: Colors.brown.shade400,
        ),
      SideInfoMenu.fertilizer => FertilizersInfoBoxTag(
          size: SideInfoBox.tagSize,
          onPressed: onPressed,
          color: Colors.brown.shade200,
        ),
      SideInfoMenu.nutrients => CropsInfoBoxTag(
          size: SideInfoBox.tagSize,
          onPressed: onPressed,
          color: Colors.orange.shade50,
        ),
    };
  }
}

class SideInfoBox extends StatefulWidget {
  const SideInfoBox({super.key});

  static const Size tagSize = Size(65, 52);

  @override
  State<SideInfoBox> createState() => _SideInfoBoxState();
}

class _SideInfoBoxState extends State<SideInfoBox> {
  List<bool> _sideInfoSelection = List.filled(SideInfoMenu.values.length, false);

  int? get selectedIndex {
    try {
      return _sideInfoSelection.asMap().entries.singleWhere((e) => e.value == true).key;
    } catch (_) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            ...SideInfoMenu.values.asMap().entries.map((menu) => Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: menu.value.tag(() {
                    setState(() {
                      if (_sideInfoSelection[menu.key] == true) {
                        _sideInfoSelection[menu.key] = false;
                        return;
                      }
                      _sideInfoSelection = List.filled(SideInfoMenu.values.length, false);
                      _sideInfoSelection[menu.key] = true;
                    });
                  }),
                )),
          ],
        ),
        IndexedStack(
          index: selectedIndex,
          children: [
            SizedBox(
              width: selectedIndex == 0 ? null : 0,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.brown.shade400,
                  boxShadow: kElevationToShadow[2],
                ),
                child: const SeedsInfoBox(),
              ),
            ),
            SizedBox(
              width: selectedIndex == 1 ? null : 0,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.brown.shade200,
                  boxShadow: kElevationToShadow[2],
                ),
                child: const FertilizersInfoBox(),
              ),
            ),
            SizedBox(
              width: selectedIndex == 2 ? null : 0,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  boxShadow: kElevationToShadow[2],
                ),
                child: const CropsInfoBox(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
