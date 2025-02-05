import 'package:dst_helper/cook_page/recipe_card/recipe_card.dart';
import 'package:dst_helper/cook_page/recipe_card_table_model.dart';
import 'package:flutter/material.dart';

class RecipeCardTable extends StatefulWidget {
  const RecipeCardTable({super.key});

  static const double topBarHeight = 50;

  @override
  State<RecipeCardTable> createState() => _RecipeCardTableState();
}

class _RecipeCardTableState extends State<RecipeCardTable> {
  final RecipeCardTableModel model = RecipeCardTableModel();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 36 + RecipeCardTable.topBarHeight, left: 42, right: 42, bottom: 36),
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

class _TopBar extends StatelessWidget {
  _TopBar({
    required this.model,
  });

  final RecipeCardTableModel model;

  final _searchKeywordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: RecipeCardTable.topBarHeight,
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

  final RecipeCardTableModel model;

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
    var index = _order.indexOf(widget.model.recipeCardMode);
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
