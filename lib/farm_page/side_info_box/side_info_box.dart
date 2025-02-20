import 'package:flutter/material.dart';

import '../../models/v2/item/items.dart';
import 'crops_info_box.dart';
import 'fertilizers_info_box.dart';
import 'seeds_info_box.dart';

enum SideInfoMenu {
  seed,
  fertilizer,
  nutrients;

  Color get primaryColor {
    switch (this) {
      case SideInfoMenu.seed:
        return Colors.brown.shade400;
      case SideInfoMenu.fertilizer:
        return Colors.brown.shade200;
      case SideInfoMenu.nutrients:
        return Colors.orange.shade50;
    }
  }

  EdgeInsets get imagePadding {
    switch (this) {
      case SideInfoMenu.seed:
        return const EdgeInsets.only(left: 10, right: 8, bottom: 3);
      case SideInfoMenu.fertilizer:
        return const EdgeInsets.only(top: 4, bottom: 2);
      case SideInfoMenu.nutrients:
        return const EdgeInsets.only(top: 4, bottom: 2);
    }
  }
}

class SideInfoBox extends StatefulWidget {
  const SideInfoBox({super.key});

  @override
  State<SideInfoBox> createState() => _SideInfoBoxState();
}

class _SideInfoBoxState extends State<SideInfoBox> {
  List<bool> _sideInfoSelection = List.filled(SideInfoMenu.values.length, false);

  int? get selectedIndex => _sideInfoSelection.indexWhere((e) => e == true);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            ...SideInfoMenu.values.asMap().entries.map((menu) => Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: InfoBoxTag(
                    menu: menu.value,
                    onPressed: () => setState(() {
                      if (_sideInfoSelection[menu.key] == true) {
                        _sideInfoSelection[menu.key] = false;
                        return;
                      }
                      _sideInfoSelection = List.filled(SideInfoMenu.values.length, false);
                      _sideInfoSelection[menu.key] = true;
                    }),
                    color: menu.value.primaryColor,
                    imagePadding: menu.value.imagePadding,
                  ),
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

class InfoBoxTag extends StatelessWidget {
  const InfoBoxTag({
    super.key,
    required this.menu,
    required this.color,
    this.onPressed,
    required this.imagePadding,
  });

  final SideInfoMenu menu;
  final Color color;
  final void Function()? onPressed;
  final EdgeInsets imagePadding;

  static const size = Size(65, 52);

  @override
  Widget build(BuildContext context) {
    final AssetImage image;

    switch (menu) {
      case SideInfoMenu.seed:
        image = AssetImage('assets/images/items/${Items.seeds.assetName}.png');
      case SideInfoMenu.fertilizer:
        image = AssetImage('assets/images/items/${Items.fertilizer.assetName}.png');
      case SideInfoMenu.nutrients:
        image = const AssetImage('assets/images/nutrients_manure_icon.png');
    }

    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
        boxShadow: kElevationToShadow[2],
      ),
      child: IconButton(
        padding: imagePadding,
        onPressed: onPressed,
        icon: Image(image: image),
      ),
    );
  }
}
