import 'package:dst_helper/models/dst_object.dart';
import 'package:dst_helper/models/localization.dart';
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
                            crop.seeds.localizedAssumedName(context),
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
