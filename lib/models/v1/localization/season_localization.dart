import 'package:dst_helper/localization/text_localizations.dart';
import 'package:dst_helper/models/v1/season.dart';
import 'package:flutter/material.dart';

extension SeasonLocalization on Season {
  String localizedName(BuildContext context) {
    return _localizedName(context);
  }

  String _localizedName(BuildContext context) {
    switch (this) {
      case Season.spring:
        return TextLocalizations.of(context)!.localized('spring');
      case Season.summer:
        return TextLocalizations.of(context)!.localized('summer');
      case Season.autumn:
        return TextLocalizations.of(context)!.localized('autumn');
      case Season.winter:
        return TextLocalizations.of(context)!.localized('winter');
    }
  }
}
