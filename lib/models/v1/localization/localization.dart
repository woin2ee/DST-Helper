import 'package:dst_helper/l10n/l10ns.dart';
import 'package:dst_helper/models/v1/item/dst_object.dart';
import 'package:flutter/material.dart';

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
