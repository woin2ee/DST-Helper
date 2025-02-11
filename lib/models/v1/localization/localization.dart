import 'package:flutter/material.dart';

import '../../../l10n/l10ns.dart';
import '../item/dst_object.dart';

extension FertilizerObjectLocalization on FertilizerObject {
  String localizedName(BuildContext context) {
    return L10ns.of(context).localized(code);
  }
}

extension SeedsObjectLocalization on SeedsObject {
  String localizedAssumedName(BuildContext context) {
    return L10ns.of(context).localized('${code}_assumed_name');
  }
}
