import 'package:dst_helper/cook_page/recipe_list/recipe_list_item.dart';
import 'package:dst_helper/cook_page/recipe_list/recipe_list_notifier.dart';
import 'package:dst_helper/l10n/l10ns.dart';
import 'package:dst_helper/models/v2/item/items.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  debugPrintLayouts = false;
  debugPaintSizeEnabled = false;
  debugPaintBaselinesEnabled = false;

  runApp(
    MaterialApp(
      locale: const Locale('ko'),
      localizationsDelegates: L10ns.localizationsDelegates,
      supportedLocales: L10ns.supportedLocales,
      home: Scaffold(
        body: Container(
          color: Colors.white,
          child: Center(
            child: DraggableRecipeListItem(
              recipe: Items.meatballs,
              recipeListWidgetKey: GlobalKey(),
              recipeListNotifier: RecipeListNotifier(),
            ),
          ),
        ),
      ),
    ),
  );
}
