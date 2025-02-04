enum RecipeCardMode {
  basic,
  detail,
  simple,
  onlyImage;

  String get name {
    switch (this) {
      case RecipeCardMode.basic:
        return 'Basic';
      case RecipeCardMode.detail:
        return 'Detail';
      case RecipeCardMode.simple:
        return 'Simple';
      case RecipeCardMode.onlyImage:
        return 'Image';
    }
  }
}
