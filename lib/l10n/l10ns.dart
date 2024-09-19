import 'package:dst_helper/l10n/gen/messages_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

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
  L10ns(this.localeName);

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
      return L10ns(localeName);
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
    return strings[key] as String;
  }

  Map<String, String> get strings => {
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
      };
}
