import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

import '../../l10n/l10ns.dart';
import '../../models/v2/item/item.dart';
import '../../utils/font_family.dart';
import 'recipe_list_item.dart';
import 'recipe_list_notifier.dart';

class RecipeList extends StatefulWidget {
  RecipeList() : super(key: GlobalKey());

  static const double width = 410;

  @override
  State<RecipeList> createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  final RecipeListNotifier _recipeListNotifier = RecipeListNotifier();

  @override
  Widget build(BuildContext context) {
    return DragTarget<Recipe>(
      onAcceptWithDetails: (details) {
        final recipe = details.data;
        if (_recipeListNotifier.value.contains(recipe)) {
          _showToast(context);
          return;
        }
        _recipeListNotifier.add(details.data);
      },
      builder: (context, candidateItems, rejectedItems) {
        return Container(
          width: RecipeList.width,
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              left: BorderSide(
                color: Colors.black12,
                width: 1,
              ),
            ),
          ),
          child: recipeListContent(),
        );
      },
    );
  }

  Widget recipeListContent() {
    return ListenableBuilder(
      listenable: _recipeListNotifier,
      builder: (context, child) {
        final recipeList = _recipeListNotifier.value;
        if (recipeList.isEmpty) {
          return const _EmptyListText();
        }
        return ReorderableListView(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          children: [
            ..._recipeListNotifier.value.asMap().entries.map((recipe) => DraggableRecipeListItem(
                  key: Key('${recipe.key}'),
                  recipe: recipe.value,
                  recipeListWidgetKey: widget.key as GlobalKey,
                  recipeListNotifier: _recipeListNotifier,
                )),
          ],
          onReorder: (oldIndex, newIndex) => setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final item = _recipeListNotifier.removeAt(oldIndex);
            _recipeListNotifier.insert(newIndex, item);
          }),
        );
      },
    );
  }

  void _showToast(BuildContext context) {
    toastification.show(
      context: context,
      alignment: Alignment.bottomCenter,
      icon: const Icon(Icons.warning),
      style: ToastificationStyle.flatColored,
      primaryColor: Colors.grey,
      backgroundColor: Colors.grey.shade100,
      title: Text(L10ns.of(context).recipeList.toastMessage()),
      autoCloseDuration: const Duration(seconds: 2),
      animationDuration: const Duration(milliseconds: 300),
      pauseOnHover: false,
      boxShadow: kElevationToShadow[3],
      dragToClose: false,
    );
  }
}

class _EmptyListText extends StatelessWidget {
  const _EmptyListText();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        L10ns.of(context).localized('recipe_list_guide_message'),
        style: const TextStyle(
          fontFamily: FontFamily.pretendard,
          fontSize: 14,
        ),
      ),
    );
  }
}
