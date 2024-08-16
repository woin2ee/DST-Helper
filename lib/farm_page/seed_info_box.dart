import 'package:dst_helper/models/items.dart';
import 'package:dst_helper/models/plants.dart';
import 'package:flutter/material.dart';

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
  const SeedInfoBox({super.key});

  @override
  State<StatefulWidget> createState() => _SeedInfoBoxState();
}

class _SeedInfoBoxState extends State<SeedInfoBox> with RestorationMixin {
  final RestorableBool _folded = RestorableBool(true);

  final Map<SettingItem, bool> _settings = {
    SettingItem.displayingSeedName: false,
    // SettingItem.displayingCropName: false,
  };

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SeedInfoBoxTag(onPressed: () {
          setState(() {
            _folded.value = !_folded.value;
          });
        }),
        if (!_folded.value)
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.brown.shade400,
              boxShadow: kElevationToShadow[2],
            ),
            child: FittedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      const Text(
                        "Seeds",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                      PopupMenuButton(
                        icon: const Icon(Icons.settings),
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
                                  crop.seeds.assumedName ?? "",
                                  textAlign: TextAlign.right,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            Image.asset(
                              'items/${crop.seeds.assetName}.png',
                            ),
                            const Text(
                              "=",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                letterSpacing: 10,
                              ),
                            ),
                            Image.asset('items/${crop.assetName}.png'),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ),
      ],
    );
  }

  @override
  String? get restorationId => 'restoration_id_seed_info_box_state';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_folded, 'folded');
  }
}

class SeedInfoBoxTag extends StatelessWidget {
  const SeedInfoBoxTag({super.key, required this.onPressed});

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        color: Colors.brown.shade400,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
        boxShadow: kElevationToShadow[2],
      ),
      child: IconButton(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 3),
        iconSize: 20,
        onPressed: onPressed,
        icon: Image.asset(
          "items/${const Seeds().assetName}.png",
          width: 50,
        ),
      ),
    );
  }
}
