import 'package:dst_helper/l10n/l10ns.dart';
import 'package:dst_helper/models/v2/item/item.dart';
import 'package:flutter/material.dart';

export 'package:dst_helper/models/v1/localization/season_localization.dart';

extension ItemLocalization on Item {
  String localizedName(BuildContext context) {
    return L10ns.of(context).localized('${code}_name');
  }
}

extension SeedLocalization on Seed {
  String localizedAssumedName(BuildContext context) {
    return L10ns.of(context).localized('${code}_assumed_name');
  }
}
