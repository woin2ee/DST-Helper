import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toastification/toastification.dart';

import '../l10n/l10ns.dart';
import '../models/v2/item/item.dart';
import '../utils/font_family.dart';

class RecipeList extends StatefulWidget {
  RecipeList() : super(key: GlobalKey());

  static const double width = 410;

  @override
  State<RecipeList> createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  late final _RecipeListModel _recipeListModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _recipeListModel = _RecipeListModel(
      repository: Provider.of<AsyncRepository>(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _recipeListModel,
      builder: (context, child) {
        if (!_recipeListModel.isLoaded) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return DragTarget<Recipe>(
          onAcceptWithDetails: (details) {
            final recipe = details.data;
            if (_recipeListModel.recipeList.contains(recipe)) {
              _showToast(context);
              return;
            }
            _recipeListModel.add(details.data);
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
              child: ListenableBuilder(
                listenable: _recipeListModel,
                builder: (context, child) {
                  final recipeList = _recipeListModel.recipeList;
                  if (recipeList.isEmpty) {
                    return const _EmptyListText();
                  }
                  return ReorderableListView(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    children: [
                      ..._recipeListModel.recipeList.asMap().entries.map((recipe) => _DraggableListItem(
                            key: Key('${recipe.key}'),
                            recipe: recipe.value,
                            recipeListWidgetKey: widget.key as GlobalKey,
                            recipeListModel: _recipeListModel,
                          )),
                    ],
                    onReorder: (oldIndex, newIndex) => setState(() {
                      if (oldIndex < newIndex) {
                        newIndex -= 1;
                      }
                      final item = _recipeListModel.removeAt(oldIndex);
                      _recipeListModel.insert(newIndex, item);
                    }),
                  );
                },
              ),
            );
          },
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

class _DraggableListItem extends StatelessWidget {
  const _DraggableListItem({
    super.key,
    required this.recipe,
    required this.recipeListWidgetKey,
    required this.recipeListModel,
  });

  final Recipe recipe;
  final GlobalKey recipeListWidgetKey;
  final _RecipeListModel recipeListModel;

  @override
  Widget build(BuildContext context) {
    const Offset draggingOffset = Offset(40, 40);

    return Draggable(
      dragAnchorStrategy: (draggable, context, position) => draggingOffset,
      onDragEnd: (details) {
        final globalPoint = details.offset;
        final recipeListBox = _getRecipeListRenderBox();
        if (!recipeListBox.contains(globalPoint + draggingOffset)) {
          recipeListModel.remove(recipe);
        }
      },
      feedback: Opacity(
        opacity: 0.85,
        child: Image(
          image: AssetImage('assets/images/items/${recipe.assetName}.png'),
          width: _ListItemImage.recipeFrameSize,
          height: _ListItemImage.recipeFrameSize,
        ),
      ),
      hitTestBehavior: HitTestBehavior.opaque,
      child: _ListItem(recipe: recipe),
    );
  }

  Rect _getRecipeListRenderBox() {
    final renderBox = recipeListWidgetKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) {
      return Rect.zero;
    }
    final globalOffset = renderBox.localToGlobal(Offset.zero);
    return globalOffset & renderBox.size;
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({
    required this.recipe,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _ListItemImage(assetName: recipe.assetName),
          _ListItemIngredients(recipe: recipe),
        ],
      ),
    );
  }
}

class _ListItemImage extends StatelessWidget {
  const _ListItemImage({
    required this.assetName,
  });

  final String assetName;

  static const double recipeFrameSize = 70;
  static const double recipeImageSize = 56;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const Image(
          image: AssetImage('assets/images/frame_1.png'),
          fit: BoxFit.fill,
          width: recipeFrameSize,
          height: recipeFrameSize,
        ),
        Image(
          image: AssetImage('assets/images/items/$assetName.png'),
          fit: BoxFit.fill,
          width: recipeImageSize,
          height: recipeImageSize,
        ),
      ],
    );
  }
}

class _ListItemIngredients extends StatelessWidget {
  const _ListItemIngredients({
    required this.recipe,
  });

  final Recipe recipe;

  static const double ingredientFrameSize = 56;
  static const double ingredientImageSize = 40;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 6,
        children: <Widget>[
          ...recipe.ingredientListAssetNames.map((assetName) => Stack(
                alignment: Alignment.center,
                children: [
                  const Image(
                    image: AssetImage('assets/images/frame_2_thick.png'),
                    fit: BoxFit.contain,
                    width: ingredientFrameSize,
                    height: ingredientFrameSize,
                  ),
                  Image(
                    image: AssetImage('assets/images/items/$assetName.png'),
                    fit: BoxFit.fill,
                    width: ingredientImageSize,
                    height: ingredientImageSize,
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

class _RecipeListModel extends ChangeNotifier {
  _RecipeListModel._({
    required this.recipeList,
    required AsyncRepository repository,
  }) : _repository = repository;

  factory _RecipeListModel({
    required AsyncRepository repository,
  }) {
    final self = _RecipeListModel._(
      recipeList: [],
      repository: repository,
    );

    repository.getRecipes().then((recipeList) {
      self.recipeList.addAll(recipeList);
      self.notifyListeners();
      self.isLoaded = true;
    });

    return self;
  }

  final List<Recipe> recipeList;

  /// Whether it has been loaded from [_repository].
  bool isLoaded = false;

  final AsyncRepository _repository;

  void add(Recipe recipe) {
    recipeList.add(recipe);
    notifyListeners();
  }

  void insert(int index, Recipe recipe) {
    recipeList.insert(index, recipe);
    notifyListeners();
  }

  void remove(Recipe recipe) {
    recipeList.remove(recipe);
    notifyListeners();
  }

  Recipe removeAt(int index) {
    final removed = recipeList.removeAt(index);
    notifyListeners();
    return removed;
  }

  @protected
  @override
  void notifyListeners() {
    super.notifyListeners();
    _repository.saveRecipes(recipeList);
  }
}

abstract interface class AsyncRepository {
  Future<void> saveRecipes(List<Recipe> recipes);

  Future<List<Recipe>> getRecipes();
}

class SharedPreferencesRepository implements AsyncRepository {
  const SharedPreferencesRepository({
    required Future<SharedPreferencesWithCache> prefs,
  }) : _prefs = prefs;

  final Future<SharedPreferencesWithCache> _prefs;

  @override
  Future<void> saveRecipes(List<Recipe> recipes) async {
    final prefs = await _prefs;
    final recipeCodeList = recipes.map((recipe) => recipe.code).toList();
    return prefs.setStringList('recipeList', recipeCodeList);
  }

  @override
  Future<List<Recipe>> getRecipes() async {
    final prefs = await _prefs;
    final recipeCodeList = prefs.getStringList('recipeList');

    if (recipeCodeList == null) {
      return [];
    }

    final recipeList = recipeCodeList.map((code) => Items.recipes.firstWhere((recipe) => recipe.code == code)).toList();
    return recipeList;
  }
}
