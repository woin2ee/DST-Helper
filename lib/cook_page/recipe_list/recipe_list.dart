import 'package:dst_helper/cook_page/recipe_list/recipe_list_item.dart';
import 'package:dst_helper/cook_page/recipe_list/recipe_list_provider.dart';
import 'package:dst_helper/models/v2/item/item.dart';
import 'package:flutter/material.dart';

class RecipeList extends StatefulWidget {
  RecipeList() : super(key: GlobalKey());

  GlobalKey get globalKey => key as GlobalKey;

  @override
  State<RecipeList> createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  final RecipeListProvider recipeListProvider = RecipeListProvider();

  @override
  void initState() {
    super.initState();
    recipeListProvider.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return DragTarget<Recipe>(
      onAcceptWithDetails: (details) {
        recipeListProvider.addRecipe(details.data);
      },
      builder: (context, candidateItems, rejectedItems) {
        return Container(
          width: 410,
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              left: BorderSide(
                color: Colors.black12,
                width: 1,
              ),
            ),
          ),
          child: ValueListenableBuilder(
            valueListenable: recipeListProvider,
            builder: (context, value, child) {
              return ListView.separated(
                padding: const EdgeInsets.only(top: 24, left: 32, right: 32, bottom: 24),
                itemCount: value.length,
                itemBuilder: (context, index) => FittedBox(
                    child: RecipeListItem(
                  recipe: value[index],
                  recipeListKey: widget.globalKey,
                  recipeListProvider: recipeListProvider,
                )),
                separatorBuilder: (context, index) => const Divider(color: Color(0xffBEBEBE)),
              );
            },
          ),
        );
      },
    );
  }
}
