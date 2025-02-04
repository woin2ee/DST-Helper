import 'package:dst_helper/cook_page/recipe_card/recipe_card.dart';
import 'package:dst_helper/cook_page/recipe_list/recipe_list.dart';
import 'package:dst_helper/models/v2/item/item.dart';
import 'package:flutter/material.dart';

class CookPage extends StatefulWidget {
  const CookPage({super.key});

  static const double topBarHeight = 50;

  @override
  State<CookPage> createState() => _CookPageState();
}

class _CookPageState extends State<CookPage> {
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
}

class _RecipeCardTable extends StatefulWidget {
  const _RecipeCardTable();

  @override
  State<_RecipeCardTable> createState() => _RecipeCardTableState();
}

class _RecipeCardTableState extends State<_RecipeCardTable> {
  RecipeCardMode _recipeCardMode = RecipeCardMode.basic;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 36 + CookPage.topBarHeight, left: 42, right: 42, bottom: 36),
            child: Center(
              child: Wrap(
                spacing: 40,
                runSpacing: 40,
                children: [
                  ...Items.recipes.map((recipe) {
                    switch (_recipeCardMode) {
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
              ),
            ),
          ),
        ),
        Container(
          height: CookPage.topBarHeight,
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
              Container(
                color: Colors.red.withOpacity(0),
                width: 400,
              ), // TODO: Implement a search bar
              _ModeChangeSwitch(
                mode: _recipeCardMode,
                onChangedMode: (mode) => setState(() {
                  _recipeCardMode = mode;
                }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ModeChangeSwitch extends StatefulWidget {
  const _ModeChangeSwitch({
    required this.mode,
    required this.onChangedMode,
  });

  final RecipeCardMode mode;
  final void Function(RecipeCardMode)? onChangedMode;

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
    _updateState();
  }

  @override
  void didUpdateWidget(covariant _ModeChangeSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateState();
  }

  void _updateState() {
    _selectedModes.setAll(0, List.filled(_order.length, false));
    var index = _order.indexOf(widget.mode);
    _selectedModes[index] = true;
  }

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      onPressed: (index) {
        var selectedMode = _order[index];
        widget.onChangedMode?.call(selectedMode);
      },
      constraints: const BoxConstraints(minWidth: 64, minHeight: 32),
      isSelected: _selectedModes,
      children: [..._order.map((mode) => Text(mode.name))],
    );
  }
}
