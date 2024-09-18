import 'package:dst_helper/l10n/l10ns.dart';
import 'package:dst_helper/models/v1/season.dart';
import 'package:flutter/material.dart';

extension SeasonLocalization on Season {
  String localizedName(BuildContext context) {
    return _localizedName(context);
  }

  String _localizedName(BuildContext context) {
    switch (this) {
      case Season.spring:
        return L10ns.of(context).localized('spring');
      case Season.summer:
        return L10ns.of(context).localized('summer');
      case Season.autumn:
        return L10ns.of(context).localized('autumn');
      case Season.winter:
        return L10ns.of(context).localized('winter');
    }
  }
}
