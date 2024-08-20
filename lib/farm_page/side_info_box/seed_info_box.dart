import 'package:dst_helper/models/dst_object.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum SettingItem {
  displayingSeedName;
  // displayingCropName;

  String get description {
    switch (this) {
      case SettingItem.displayingSeedName:
        return '씨앗 이름 표시';
      // case SettingItem.displayingCropName:
      //   return '작물 이름 표시';
    }
  }
}

class SeedInfoBox extends StatefulWidget {
  const SeedInfoBox({super.key, required this.color});

  final Color color;

  @override
  State<StatefulWidget> createState() => _SeedInfoBoxState();
}

class _SeedInfoBoxState extends State<SeedInfoBox> {
  final Map<SettingItem, bool> _settings = {
    SettingItem.displayingSeedName: false,
    // SettingItem.displayingCropName: false,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: widget.color,
        boxShadow: kElevationToShadow[2],
      ),
      child: FittedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.seeds,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                PopupMenuButton(
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  onSelected: (settingItem) {
                    final currentState = _settings[settingItem];
                    assert(currentState != null);
                    setState(() {
                      _settings[settingItem] = !(currentState ?? false);
                    });
                  },
                  itemBuilder: (context) => <CheckedPopupMenuItem<SettingItem>>[
                    ...SettingItem.values.map((settingItem) => CheckedPopupMenuItem(
                          value: settingItem,
                          checked: _settings[settingItem] ?? false,
                          child: Text(settingItem.description),
                        ))
                  ],
                ),
              ],
            ),
            ...Plants.crops.map((crop) => SizedBox(
                  height: 46,
                  child: Row(
                    children: [
                      if (_settings[SettingItem.displayingSeedName] ?? false)
                        Padding(
                          padding: const EdgeInsets.only(left: 6.0, right: 10.0),
                          child: Text(
                            crop.seeds.assumedName(context) ?? "",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      Image.asset(
                        'assets/images/items/${crop.seeds.assetName}.png',
                      ),
                      const Text(
                        "=",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          letterSpacing: 10,
                        ),
                      ),
                      Image.asset('assets/images/items/${crop.assetName}.png'),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class SeedInfoBoxTag extends StatelessWidget {
  const SeedInfoBoxTag({
    super.key,
    this.onPressed,
    required this.size,
    required this.color,
  });

  final Size size;
  final Color color;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.only(left: 10, right: 8, bottom: 3),
        iconSize: 20,
        onPressed: onPressed,
        icon: Image.asset(
          "assets/images/items/${const Seeds().assetName}.png",
          width: 50,
        ),
      ),
    );
  }
}

extension SeedsObjectLocalization on SeedsObject {
  String? assumedName(BuildContext context) {
    switch (this) {
      case PotatoSeeds():
        return AppLocalizations.of(context)!.potato_seeds_assumed_name;
      case CarrotSeeds():
        return AppLocalizations.of(context)!.carrot_seeds_assumed_name;
      case CornSeeds():
        return AppLocalizations.of(context)!.corn_seeds_assumed_name;
      case TomaRootSeeds():
        return AppLocalizations.of(context)!.tomato_seeds_assumed_name;
      case AsparagusSeeds():
        return AppLocalizations.of(context)!.asparagus_seeds_assumed_name;
      case WatermelonSeeds():
        return AppLocalizations.of(context)!.watermelon_seeds_assumed_name;
      case PumpkinSeeds():
        return AppLocalizations.of(context)!.pumpkin_seeds_assumed_name;
      case EggplantSeeds():
        return AppLocalizations.of(context)!.eggplant_seeds_assumed_name;
      case GarlicSeeds():
        return AppLocalizations.of(context)!.garlic_seeds_assumed_name;
      case OnionSeeds():
        return AppLocalizations.of(context)!.onion_seeds_assumed_name;
      case PepperSeeds():
        return AppLocalizations.of(context)!.pepper_seeds_assumed_name;
      case PomegranateSeeds():
        return AppLocalizations.of(context)!.pomegranate_seeds_assumed_name;
      case DragonFruitSeeds():
        return AppLocalizations.of(context)!.dragonfruit_seeds_assumed_name;
      case DurianSeeds():
        return AppLocalizations.of(context)!.durian_seeds_assumed_name;
    }
  }
}
