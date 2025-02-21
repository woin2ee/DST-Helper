import 'package:flutter/material.dart';

import '../l10n/l10ns.dart';
import '../models/v2/item/item.dart';
import 'recipe_cards.dart';
import 'recipe_list.dart';

class CookPage extends StatefulWidget {
  const CookPage({super.key});

  @override
  State<CookPage> createState() => _CookPageState();
}

class _CookPageState extends State<CookPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _prefetchImagesToNeed(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        spacing: 10,
        children: [
          const Expanded(
            child: _RecipeCardTable(),
          ),
          RecipeList(),
        ],
      ),
    );
  }

  void _prefetchImagesToNeed(BuildContext context) {
    precacheImage(const AssetImage('assets/images/frame_1.png'), context);
    precacheImage(const AssetImage('assets/images/frame_2_thick.png'), context);

    for (final ingredient in Items.ingredients) {
      _prefetchIngredientImage(ingredient, context);
    }

    for (final category in FoodValueCategory.values) {
      precacheImage(AssetImage('assets/images/items/${category.assetName}.png'), context);
    }
  }

  void _prefetchIngredientImage(Item ingredient, BuildContext context) {
    if (ingredient is CookableFood) {
      precacheImage(
        AssetImage('assets/images/items/${ingredient.compositeAssetName}.png'),
        context,
      );
      return;
    }
    precacheImage(
      AssetImage('assets/images/items/${ingredient.assetName}.png'),
      context,
    );
  }
}

class _RecipeCardTable extends StatefulWidget {
  const _RecipeCardTable();

  static const double topBarHeight = 50;

  @override
  State<_RecipeCardTable> createState() => _RecipeCardTableState();
}

class _RecipeCardTableState extends State<_RecipeCardTable> {
  final _RecipeCardTableModel model = _RecipeCardTableModel();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 36 + _RecipeCardTable.topBarHeight, left: 42, right: 42, bottom: 36),
            child: Center(
              child: ListenableBuilder(
                  listenable: model,
                  builder: (context, child) {
                    return Wrap(
                      spacing: 40,
                      runSpacing: 40,
                      children: [
                        ...model.getRecipes(context).map((recipe) {
                          switch (model.recipeCardMode) {
                            case RecipeCardMode.basic:
                              return DefaultRecipeCard(recipe: recipe);
                            case RecipeCardMode.detail:
                              return DetailRecipeCard(recipe: recipe);
                            case RecipeCardMode.simple:
                              return SimpleRecipeCard(recipe: recipe);
                            case RecipeCardMode.onlyImage:
                              return OnlyImageRecipeCard(recipe: recipe);
                          }
                        }),
                      ],
                    );
                  }),
            ),
          ),
        ),
        _TopBar(model: model),
      ],
    );
  }
}

class _RecipeCardTableModel extends ChangeNotifier {
  RecipeCardMode _recipeCardMode = RecipeCardMode.basic;
  RecipeCardMode get recipeCardMode => _recipeCardMode;
  set recipeCardMode(RecipeCardMode value) {
    _recipeCardMode = value;
    notifyListeners();
  }

  String _searchKeyword = '';
  set searchKeyword(String value) {
    _searchKeyword = value;
    notifyListeners();
  }

  List<Recipe> getRecipes(BuildContext context) {
    final entireRecipes = Items.recipes;

    if (_searchKeyword.isEmpty) {
      return entireRecipes;
    }

    final searchedRecipes = entireRecipes.where((recipe) {
      final recipeName = L10ns.of(context).localized('${recipe.code}_name');
      final adjustedName = recipeName.replaceAll(' ', '').toLowerCase();
      final searchKeyword = _searchKeyword.toLowerCase();
      return adjustedName.contains(searchKeyword);
    });

    return searchedRecipes.toList();
  }
}

class _TopBar extends StatelessWidget {
  _TopBar({
    required this.model,
  });

  final _RecipeCardTableModel model;

  final _searchKeywordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _RecipeCardTable.topBarHeight,
      margin: const EdgeInsets.only(left: 12, right: 20),
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.black12,
          ),
        ),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchBar(
            constraints: const BoxConstraints(maxWidth: 400),
            padding: const WidgetStatePropertyAll(EdgeInsets.only(left: 8, right: 2)),
            controller: _searchKeywordController,
            elevation: const WidgetStatePropertyAll(2),
            shape: const WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            ),
            onSubmitted: (text) => model.searchKeyword = text,
            leading: const Icon(Icons.search),
            trailing: [
              IconButton(
                iconSize: 18,
                constraints: const BoxConstraints(minWidth: 30, minHeight: 30),
                onPressed: () {
                  _searchKeywordController.text = '';
                  model.searchKeyword = '';
                },
                icon: const Icon(Icons.clear),
              ),
            ],
          ),
          _ModeChangeSwitch(
            model: model,
          ),
        ],
      ),
    );
  }
}

class _ModeChangeSwitch extends StatefulWidget {
  const _ModeChangeSwitch({
    required this.model,
  });

  final _RecipeCardTableModel model;

  @override
  State<_ModeChangeSwitch> createState() => _ModeChangeSwitchState();
}

class _ModeChangeSwitchState extends State<_ModeChangeSwitch> {
  static const _order = [
    RecipeCardMode.basic,
    RecipeCardMode.detail,
    RecipeCardMode.simple,
    RecipeCardMode.onlyImage,
  ];

  final List<bool> _selectedModes = List.filled(_order.length, false);

  @override
  void initState() {
    super.initState();
    final index = _order.indexOf(widget.model.recipeCardMode);
    _selectedModes[index] = true;
  }

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      onPressed: (index) => setState(() {
        for (int i = 0; i < _selectedModes.length; i++) {
          _selectedModes[i] = i == index;
        }
        widget.model.recipeCardMode = _order[index];
      }),
      constraints: const BoxConstraints(minWidth: 64, minHeight: 32),
      isSelected: _selectedModes,
      children: [..._order.map((mode) => Text(mode.name))],
    );
  }
}
