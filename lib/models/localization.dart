import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:dst_helper/models/season.dart';
import 'package:flutter/material.dart';

extension SeasonLocalization on Season {
  String localizedName(BuildContext context) {
    switch (this) {
      case Season.spring:
        return AppLocalizations.of(context)!.spring;
      case Season.summer:
        return AppLocalizations.of(context)!.summer;
      case Season.autumn:
        return AppLocalizations.of(context)!.autumn;
      case Season.winter:
        return AppLocalizations.of(context)!.winter;
    }
  }
}