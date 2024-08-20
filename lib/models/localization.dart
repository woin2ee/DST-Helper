import 'package:dst_helper/models/dst_object.dart';
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

extension FertilizerObjectLocalization on FertilizerObject {
  String localizedName(BuildContext context) {
    switch (this) {
      case Rot():
        return AppLocalizations.of(context)!.spoiled_food_name;
      case RottenEgg():
        return AppLocalizations.of(context)!.rottenegg;
      case Manure():
        return AppLocalizations.of(context)!.manure;
      case Fertilizer():
        return AppLocalizations.of(context)!.fertilizer;
      case Guano():
        return AppLocalizations.of(context)!.guano;
      case Compost():
        return AppLocalizations.of(context)!.compost;
      case GrowthFormulaStarter():
        return AppLocalizations.of(context)!.soil_amender;
      case FermentingGrowthFormula():
        return AppLocalizations.of(context)!.soil_amender;
      case FermentedGrowthFormula():
        return AppLocalizations.of(context)!.soil_amender;
      case SuperGrowthFormula():
        return AppLocalizations.of(context)!.soil_amender;
      case SpoiledFish():
        return AppLocalizations.of(context)!.spoiled_fish;
      case SpoiledFishMorsel():
        return AppLocalizations.of(context)!.spoiled_fish_small;
      case CompostWrap():
        return AppLocalizations.of(context)!.compostwrap;
      case GlommerFuel():
        return AppLocalizations.of(context)!.glommerfuel;
      case TreeJam():
        return AppLocalizations.of(context)!.treegrowthsolution;
    }
  }
}

extension SeedsObjectLocalization on SeedsObject {
  String localizedAssumedName(BuildContext context) {
    switch (this) {
      case PotatoSeeds():
        return AppLocalizations.of(context)!.potato_seeds_assumed_name;
      case CarrotSeeds():
        return AppLocalizations.of(context)!.carrot_seeds_assumed_name;
      case CornSeeds():
        return AppLocalizations.of(context)!.corn_seeds_assumed_name;
      case TomaRootSeeds():
        return AppLocalizations.of(context)!.tomato_seeds_assumed_name;
      case AsparagusSeeds():
        return AppLocalizations.of(context)!.asparagus_seeds_assumed_name;
      case WatermelonSeeds():
        return AppLocalizations.of(context)!.watermelon_seeds_assumed_name;
      case PumpkinSeeds():
        return AppLocalizations.of(context)!.pumpkin_seeds_assumed_name;
      case EggplantSeeds():
        return AppLocalizations.of(context)!.eggplant_seeds_assumed_name;
      case GarlicSeeds():
        return AppLocalizations.of(context)!.garlic_seeds_assumed_name;
      case OnionSeeds():
        return AppLocalizations.of(context)!.onion_seeds_assumed_name;
      case PepperSeeds():
        return AppLocalizations.of(context)!.pepper_seeds_assumed_name;
      case PomegranateSeeds():
        return AppLocalizations.of(context)!.pomegranate_seeds_assumed_name;
      case DragonFruitSeeds():
        return AppLocalizations.of(context)!.dragonfruit_seeds_assumed_name;
      case DurianSeeds():
        return AppLocalizations.of(context)!.durian_seeds_assumed_name;
    }
  }
}
