import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

import 'gen/messages_all.dart';

class _L10nsDelegate extends LocalizationsDelegate<L10ns> {
  const _L10nsDelegate();

  @override
  bool isSupported(Locale locale) => [
        'en',
        'ko',
      ].contains(locale.languageCode);

  @override
  Future<L10ns> load(Locale locale) => L10ns.load(locale);

  @override
  bool shouldReload(_L10nsDelegate old) => false;
}

class L10ns {
  L10ns._(this.localeName);

  static const LocalizationsDelegate<L10ns> delegate = _L10nsDelegate();

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    L10ns.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ko'),
  ];

  static Future<L10ns> load(Locale locale) {
    final String name =
        locale.countryCode == null || locale.countryCode!.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((_) {
      return L10ns._(localeName);
    });
  }

  static L10ns of(BuildContext context) {
    return Localizations.of<L10ns>(context, L10ns)!;
  }

  final String localeName;

  String seasonConditionSatisfyingText(String seasonsText) {
    return Intl.message(
      'Becomes a giant crop in the $seasonsText!',
      name: 'seasonConditionSatisfyingText',
      args: [seasonsText],
      examples: const {'seasonsText': '<spring>spring</spring>, <fall>fall</fall>'},
      locale: localeName,
    );
  }

  String localized(String key) {
    return _strings[key] as String;
  }

  Map<String, String> get _strings => {
        "recipe_list_guide_message": Intl.message(
          "recipe_list_guide_message",
          locale: localeName,
        ),
        "fertilizer_selection_tooltip": Intl.message(
          "fertilizer_selection_tooltip",
          locale: localeName,
        ),
        "add": Intl.message(
          "add",
          locale: localeName,
        ),
        "asparagus_seeds_assumed_name": Intl.message(
          "asparagus_seeds_assumed_name",
          locale: localeName,
        ),
        "autumn": Intl.message(
          "autumn",
          locale: localeName,
        ),
        "back_dialog_message": Intl.message(
          "back_dialog_message",
          locale: localeName,
        ),
        "back_dialog_title": Intl.message(
          "back_dialog_title",
          locale: localeName,
        ),
        "basic": Intl.message(
          "basic",
          locale: localeName,
        ),
        "butterflymuffin": Intl.message(
          "butterflymuffin",
          locale: localeName,
        ),
        "cancel": Intl.message(
          "cancel",
          locale: localeName,
        ),
        "carrot_seeds_assumed_name": Intl.message(
          "carrot_seeds_assumed_name",
          locale: localeName,
        ),
        "compost": Intl.message(
          "compost",
          locale: localeName,
        ),
        "compostwrap": Intl.message(
          "compostwrap",
          locale: localeName,
        ),
        "confirm": Intl.message(
          "confirm",
          locale: localeName,
        ),
        "corn_seeds_assumed_name": Intl.message(
          "corn_seeds_assumed_name",
          locale: localeName,
        ),
        "crops": Intl.message(
          "crops",
          locale: localeName,
        ),
        "delete": Intl.message(
          "delete",
          locale: localeName,
        ),
        "dense": Intl.message(
          "dense",
          locale: localeName,
        ),
        "done": Intl.message(
          "done",
          locale: localeName,
        ),
        "dragonfruit_seeds_assumed_name": Intl.message(
          "dragonfruit_seeds_assumed_name",
          locale: localeName,
        ),
        "durian_seeds_assumed_name": Intl.message(
          "durian_seeds_assumed_name",
          locale: localeName,
        ),
        "edit": Intl.message(
          "edit",
          locale: localeName,
        ),
        "eggplant_seeds_assumed_name": Intl.message(
          "eggplant_seeds_assumed_name",
          locale: localeName,
        ),
        "family_condition_satisfying_text": Intl.message(
          "family_condition_satisfying_text",
          locale: localeName,
        ),
        "family_condition_unsatisfying_first_text": Intl.message(
          "family_condition_unsatisfying_first_text",
          locale: localeName,
        ),
        "family_condition_unsatisfying_secondary_text": Intl.message(
          "family_condition_unsatisfying_secondary_text",
          locale: localeName,
        ),
        "fertilizer": Intl.message(
          "fertilizer",
          locale: localeName,
        ),
        "fertilizers": Intl.message(
          "fertilizers",
          locale: localeName,
        ),
        "garlic_seeds_assumed_name": Intl.message(
          "garlic_seeds_assumed_name",
          locale: localeName,
        ),
        "giant_crop": Intl.message(
          "giant_crop",
          locale: localeName,
        ),
        "glommerfuel": Intl.message(
          "glommerfuel",
          locale: localeName,
        ),
        "growthFormula": Intl.message(
          "growthFormula",
          locale: localeName,
        ),
        "guano": Intl.message(
          "guano",
          locale: localeName,
        ),
        "hide": Intl.message(
          "hide",
          locale: localeName,
        ),
        "manure": Intl.message(
          "manure",
          locale: localeName,
        ),
        "menu_cook": Intl.message(
          "menu_cook",
          locale: localeName,
        ),
        "menu_farm": Intl.message(
          "menu_farm",
          locale: localeName,
        ),
        "mix": Intl.message(
          "mix",
          locale: localeName,
        ),
        "name": Intl.message(
          "name",
          locale: localeName,
        ),
        "no_crops_message": Intl.message(
          "no_crops_message",
          locale: localeName,
        ),
        "nutrient_condition_satisfying_first_text": Intl.message(
          "nutrient_condition_satisfying_first_text",
          locale: localeName,
        ),
        "nutrient_condition_unsatisfying_first_text": Intl.message(
          "nutrient_condition_unsatisfying_first_text",
          locale: localeName,
        ),
        "nutrient_condition_unsatisfying_secondary_text": Intl.message(
          "nutrient_condition_unsatisfying_secondary_text",
          locale: localeName,
        ),
        "onion_seeds_assumed_name": Intl.message(
          "onion_seeds_assumed_name",
          locale: localeName,
        ),
        "pepper_seeds_assumed_name": Intl.message(
          "pepper_seeds_assumed_name",
          locale: localeName,
        ),
        "pomegranate_seeds_assumed_name": Intl.message(
          "pomegranate_seeds_assumed_name",
          locale: localeName,
        ),
        "poop": Intl.message(
          "poop",
          locale: localeName,
        ),
        "potato_seeds_assumed_name": Intl.message(
          "potato_seeds_assumed_name",
          locale: localeName,
        ),
        "pumpkin_seeds_assumed_name": Intl.message(
          "pumpkin_seeds_assumed_name",
          locale: localeName,
        ),
        "reverse_dense": Intl.message(
          "reverse_dense",
          locale: localeName,
        ),
        "rottenegg": Intl.message(
          "rottenegg",
          locale: localeName,
        ),
        "season_condition_unsatisfying_first_text": Intl.message(
          "season_condition_unsatisfying_first_text",
          locale: localeName,
        ),
        "season_condition_unsatisfying_secondary_text": Intl.message(
          "season_condition_unsatisfying_secondary_text",
          locale: localeName,
        ),
        "seeds": Intl.message(
          "seeds",
          locale: localeName,
        ),
        "show": Intl.message(
          "show",
          locale: localeName,
        ),
        "show_hidden_items": Intl.message(
          "show_hidden_items",
          locale: localeName,
        ),
        "show_seeds_alias": Intl.message(
          "show_seeds_alias",
          locale: localeName,
        ),
        "soil_amender": Intl.message(
          "soil_amender",
          locale: localeName,
        ),
        "spoiled_fish": Intl.message(
          "spoiled_fish",
          locale: localeName,
        ),
        "spoiled_fish_small": Intl.message(
          "spoiled_fish_small",
          locale: localeName,
        ),
        "spoiled_food": Intl.message(
          "spoiled_food",
          locale: localeName,
        ),
        "spring": Intl.message(
          "spring",
          locale: localeName,
        ),
        "suitable_seasons": Intl.message(
          "suitable_seasons",
          locale: localeName,
        ),
        "season": Intl.message(
          "season",
          locale: localeName,
        ),
        "summer": Intl.message(
          "summer",
          locale: localeName,
        ),
        "tomato_seeds_assumed_name": Intl.message(
          "tomato_seeds_assumed_name",
          locale: localeName,
        ),
        "treegrowthsolution": Intl.message(
          "treegrowthsolution",
          locale: localeName,
        ),
        "watermelon_seeds_assumed_name": Intl.message(
          "watermelon_seeds_assumed_name",
          locale: localeName,
        ),
        "winter": Intl.message(
          "winter",
          locale: localeName,
        ),
        ..._recipeNames,
      };

  Map<String, String> get _recipeNames => {
        "dustmeringue_name": Intl.message(
          "dustmeringue_name",
          locale: localeName,
        ),
        "asparagussoup_name": Intl.message(
          "asparagussoup_name",
          locale: localeName,
        ),
        "baconeggs_name": Intl.message(
          "baconeggs_name",
          locale: localeName,
        ),
        "bananapop_name": Intl.message(
          "bananapop_name",
          locale: localeName,
        ),
        "bananajuice_name": Intl.message(
          "bananajuice_name",
          locale: localeName,
        ),
        "barnaclinguine_name": Intl.message(
          "barnaclinguine_name",
          locale: localeName,
        ),
        "barnaclesushi_name": Intl.message(
          "barnaclesushi_name",
          locale: localeName,
        ),
        "barnaclepita_name": Intl.message(
          "barnaclepita_name",
          locale: localeName,
        ),
        "beefalotreat_name": Intl.message(
          "beefalotreat_name",
          locale: localeName,
        ),
        "meatysalad_name": Intl.message(
          "meatysalad_name",
          locale: localeName,
        ),
        "veggieomlet_name": Intl.message(
          "veggieomlet_name",
          locale: localeName,
        ),
        "bunnystew_name": Intl.message(
          "bunnystew_name",
          locale: localeName,
        ),
        "butterflymuffin_name": Intl.message(
          "butterflymuffin_name",
          locale: localeName,
        ),
        "californiaroll_name": Intl.message(
          "californiaroll_name",
          locale: localeName,
        ),
        "ceviche_name": Intl.message(
          "ceviche_name",
          locale: localeName,
        ),
        "mashedpotatoes_name": Intl.message(
          "mashedpotatoes_name",
          locale: localeName,
        ),
        "dragonpie_name": Intl.message(
          "dragonpie_name",
          locale: localeName,
        ),
        "potatotornado_name": Intl.message(
          "potatotornado_name",
          locale: localeName,
        ),
        "figatoni_name": Intl.message(
          "figatoni_name",
          locale: localeName,
        ),
        "frognewton_name": Intl.message(
          "frognewton_name",
          locale: localeName,
        ),
        "figkabab_name": Intl.message(
          "figkabab_name",
          locale: localeName,
        ),
        "koalefig_trunk_name": Intl.message(
          "koalefig_trunk_name",
          locale: localeName,
        ),
        "fishtacos_name": Intl.message(
          "fishtacos_name",
          locale: localeName,
        ),
        "fishsticks_name": Intl.message(
          "fishsticks_name",
          locale: localeName,
        ),
        "jammypreserves_name": Intl.message(
          "jammypreserves_name",
          locale: localeName,
        ),
        "flowersalad_name": Intl.message(
          "flowersalad_name",
          locale: localeName,
        ),
        "frogglebunwich_name": Intl.message(
          "frogglebunwich_name",
          locale: localeName,
        ),
        "frozenbananadaiquiri_name": Intl.message(
          "frozenbananadaiquiri_name",
          locale: localeName,
        ),
        "fruitmedley_name": Intl.message(
          "fruitmedley_name",
          locale: localeName,
        ),
        "guacamole_name": Intl.message(
          "guacamole_name",
          locale: localeName,
        ),
        "honeyham_name": Intl.message(
          "honeyham_name",
          locale: localeName,
        ),
        "honeynuggets_name": Intl.message(
          "honeynuggets_name",
          locale: localeName,
        ),
        "icecream_name": Intl.message(
          "icecream_name",
          locale: localeName,
        ),
        "jellybean_name": Intl.message(
          "jellybean_name",
          locale: localeName,
        ),
        "leafymeatsouffle_name": Intl.message(
          "leafymeatsouffle_name",
          locale: localeName,
        ),
        "kabobs_name": Intl.message(
          "kabobs_name",
          locale: localeName,
        ),
        "mandrakesoup_name": Intl.message(
          "mandrakesoup_name",
          locale: localeName,
        ),
        "meatballs_name": Intl.message(
          "meatballs_name",
          locale: localeName,
        ),
        "bonestew_name": Intl.message(
          "bonestew_name",
          locale: localeName,
        ),
        "watermelonicle_name": Intl.message(
          "watermelonicle_name",
          locale: localeName,
        ),
        "batnosehat_name": Intl.message(
          "batnosehat_name",
          locale: localeName,
        ),
        "monsterlasagna_name": Intl.message(
          "monsterlasagna_name",
          locale: localeName,
        ),
        "shroomcake_name": Intl.message(
          "shroomcake_name",
          locale: localeName,
        ),
        "leafloaf_name": Intl.message(
          "leafloaf_name",
          locale: localeName,
        ),
        "perogies_name": Intl.message(
          "perogies_name",
          locale: localeName,
        ),
        "justeggs_name": Intl.message(
          "justeggs_name",
          locale: localeName,
        ),
        "powcake_name": Intl.message(
          "powcake_name",
          locale: localeName,
        ),
        "pumpkincookie_name": Intl.message(
          "pumpkincookie_name",
          locale: localeName,
        ),
        "ratatouille_name": Intl.message(
          "ratatouille_name",
          locale: localeName,
        ),
        "salsa_name": Intl.message(
          "salsa_name",
          locale: localeName,
        ),
        "seafoodgumbo_name": Intl.message(
          "seafoodgumbo_name",
          locale: localeName,
        ),
        "sweettea_name": Intl.message(
          "sweettea_name",
          locale: localeName,
        ),
        "hotchili_name": Intl.message(
          "hotchili_name",
          locale: localeName,
        ),
        "beefalofeed_name": Intl.message(
          "beefalofeed_name",
          locale: localeName,
        ),
        "stuffedeggplant_name": Intl.message(
          "stuffedeggplant_name",
          locale: localeName,
        ),
        "barnaclestuffedfishhead_name": Intl.message(
          "barnaclestuffedfishhead_name",
          locale: localeName,
        ),
        "shroombait_name": Intl.message(
          "shroombait_name",
          locale: localeName,
        ),
        "pepperpopper_name": Intl.message(
          "pepperpopper_name",
          locale: localeName,
        ),
        "surfnturf_name": Intl.message(
          "surfnturf_name",
          locale: localeName,
        ),
        "taffy_name": Intl.message(
          "taffy_name",
          locale: localeName,
        ),
        "talleggs_name": Intl.message(
          "talleggs_name",
          locale: localeName,
        ),
        "trailmix_name": Intl.message(
          "trailmix_name",
          locale: localeName,
        ),
        "turkeydinner_name": Intl.message(
          "turkeydinner_name",
          locale: localeName,
        ),
        "unagi_name": Intl.message(
          "unagi_name",
          locale: localeName,
        ),
        "leafymeatburger_name": Intl.message(
          "leafymeatburger_name",
          locale: localeName,
        ),
        "vegstinger_name": Intl.message(
          "vegstinger_name",
          locale: localeName,
        ),
        "waffles_name": Intl.message(
          "waffles_name",
          locale: localeName,
        ),
        "wetgoop_name": Intl.message(
          "wetgoop_name",
          locale: localeName,
        ),
        "lobsterbisque_name": Intl.message(
          "lobsterbisque_name",
          locale: localeName,
        ),
        "lobsterdinner_name": Intl.message(
          "lobsterdinner_name",
          locale: localeName,
        ),
      };
}

extension L10nsContextualizing on L10ns {
  L10nsRecipeListContext get recipeList => L10nsRecipeListContext(localeName);

  L10nsNutrientConditionBoxContext get nutrientConditionBox => L10nsNutrientConditionBoxContext(localeName);
}

class L10nsRecipeListContext {
  const L10nsRecipeListContext(this.localeName);

  final String localeName;

  String toastMessage() {
    return Intl.message(
      'The recipe is already registered.',
      name: 'L10nsRecipeListContext_toastMessage',
      desc: "It's showed up when a duplicated recipe card is registered to list.",
      locale: localeName,
    );
  }
}

class L10nsNutrientConditionBoxContext {
  const L10nsNutrientConditionBoxContext(this.localeName);

  final String localeName;

  String secondaryText(int countOfNeededFertilizer) {
    return Intl.message(
      'You need to use the selected fertilizer $countOfNeededFertilizer times for each growth.',
      name: 'L10nsNutrientConditionBoxContext_secondaryText',
      desc: 'It is a secondary text of nutrient condition box.',
      args: [countOfNeededFertilizer],
      locale: localeName,
    );
  }
}
