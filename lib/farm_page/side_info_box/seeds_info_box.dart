import 'package:flutter/material.dart';

import '../../l10n/l10ns.dart';
import '../../models/v2/item/item.dart';
import '../../models/v2/localization.dart';
import '../../utils/font_family.dart';

enum SettingItem {
  displayingSeedName;

  String description(BuildContext context) {
    switch (this) {
      case SettingItem.displayingSeedName:
        return L10ns.of(context).localized('show_seeds_alias');
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
