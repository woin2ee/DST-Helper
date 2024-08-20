import 'package:dst_helper/farm_page/side_info_box/fertilizer_info_box.dart';
import 'package:dst_helper/farm_page/side_info_box/seed_info_box.dart';
import 'package:flutter/material.dart';

enum SideInfoMenu {
  seed,
  fertilizer,
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
            ...SideInfoMenu.values.asMap().entries.map((menu) => switch (menu.value) {
                  SideInfoMenu.seed => Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: SeedInfoBoxTag(
                        size: SideInfoBox.tagSize,
                        onPressed: () {
                          setState(() {
                            if (_sideInfoSelection[menu.key] == true) {
                              _sideInfoSelection[menu.key] = false;
                              return;
                            }
                            _sideInfoSelection = List.filled(SideInfoMenu.values.length, false);
                            _sideInfoSelection[menu.key] = true;
                          });
                        },
                        color: Colors.brown.shade400,
                      ),
                    ),
                  SideInfoMenu.fertilizer => Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: FertilizerInfoBoxTag(
                        size: SideInfoBox.tagSize,
                        onPressed: () {
                          setState(() {
                            if (_sideInfoSelection[menu.key] == true) {
                              _sideInfoSelection[menu.key] = false;
                              return;
                            }
                            _sideInfoSelection = List.filled(SideInfoMenu.values.length, false);
                            _sideInfoSelection[menu.key] = true;
                          });
                        },
                        color: Colors.brown.shade200,
                      ),
                    ),
                }),
          ],
        ),
        IndexedStack(
          index: selectedIndex,
          children: [
            SizedBox(
              width: selectedIndex == 0 ? null : 0,
              child: SeedInfoBox(color: Colors.brown.shade400),
            ),
            SizedBox(
              width: selectedIndex == 1 ? null : 0,
              child: FertilizerInfoBox(color: Colors.brown.shade200),
            ),
          ],
        ),
      ],
    );
  }
}
