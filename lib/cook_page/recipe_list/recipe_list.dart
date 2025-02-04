import 'package:dst_helper/cook_page/recipe_list/recipe_list_item.dart';
import 'package:dst_helper/cook_page/recipe_list/recipe_list_notifier.dart';
import 'package:dst_helper/models/v2/item/item.dart';
import 'package:flutter/material.dart';

class RecipeList extends StatefulWidget {
  RecipeList() : super(key: GlobalKey());

  GlobalKey get globalKey => key as GlobalKey;

  @override
  State<RecipeList> createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  final RecipeListNotifier _recipeListNotifier = RecipeListNotifier();

  @override
  Widget build(BuildContext context) {
    return DragTarget<Recipe>(
      onAcceptWithDetails: (details) {
        _recipeListNotifier.addRecipe(details.data);
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
          child: ListenableBuilder(
            listenable: _recipeListNotifier,
            builder: (context, child) {
              final recipeList = _recipeListNotifier.value;
              if (recipeList.isEmpty) {
                return const Center(
                  child: Text('레시피 카드를 끌어다 놓으세요.'),
                );
              }
              return ListView.separated(
                padding: const EdgeInsets.only(top: 24, left: 32, right: 32, bottom: 24),
                itemCount: recipeList.length,
                itemBuilder: (context, index) => FittedBox(
                    child: DraggableRecipeListItem(
                  recipe: recipeList[index],
                  recipeListKey: widget.globalKey,
                  recipeListNotifier: _recipeListNotifier,
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
