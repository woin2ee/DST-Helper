import 'package:flutter/material.dart';

import '../../l10n/l10ns.dart';
import '../../models/v2/item/item.dart';
import '../../models/v2/localization.dart';
import '../../utils/font_family.dart';

enum SettingItem {
  displayingSeedName;
  // displayingCropName;

  String description(BuildContext context) {
    switch (this) {
      case SettingItem.displayingSeedName:
        return L10ns.of(context).localized('show_seeds_alias');
      // case SettingItem.displayingCropName:
      //   return '작물 이름 표시';
    }
  }
}

class SeedsInfoBox extends StatefulWidget {
  const SeedsInfoBox({super.key});

  @override
  State<StatefulWidget> createState() => _SeedsInfoBoxState();
}

class _SeedsInfoBoxState extends State<SeedsInfoBox> {
  final Map<SettingItem, bool> _settings = {
    SettingItem.displayingSeedName: false,
    // SettingItem.displayingCropName: false,
  };

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Text(
                L10ns.of(context).localized('seeds'),
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
                        child: Text(
                          settingItem.description(context),
                          style: const TextStyle(
                            fontFamily: FontFamily.pretendard,
                          ),
                        ),
                      ))
                ],
              ),
            ],
          ),
          ...Items.crops.map((crop) => SizedBox(
                height: 46,
                child: Row(
                  children: [
                    if (_settings[SettingItem.displayingSeedName] ?? false)
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0, right: 10.0),
                        child: Text(
                          crop.seed.localizedAssumedName(context),
                          style: const TextStyle(
                            fontSize: 16,
                            fontFamily: FontFamily.pretendard,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    Image.asset(
                      'assets/images/items/${crop.seed.assetName}.png',
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
    );
  }
}

class SeedsInfoBoxTag extends StatelessWidget {
  const SeedsInfoBoxTag({
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
          "assets/images/items/${Items.seeds.assetName}.png",
          width: 50,
        ),
      ),
    );
  }
}
