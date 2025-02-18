import 'dst_object.dart';
import 'food_value.dart';
import 'ingredients_analyser.dart';

sealed class Requirement {
  const Requirement();

  bool isMetFor(IngredientsAnalyser ingredientsAnalyser);
}

typedef Requirements = AndRequirements;

/// A requirement indicating `and` logic for a couple of requirements.
class AndRequirements extends Requirement {
  const AndRequirements(this.rawRequirements);

  final Set<Requirement> rawRequirements;

  @override
  bool isMetFor(IngredientsAnalyser ingredientsAnalyser) {
    return rawRequirements.every((requirement) => requirement.isMetFor(ingredientsAnalyser));
  }
}

/// A requirement indicating `or` logic for a couple of requirements.
class OrRequirement extends Requirement {
  const OrRequirement(this.requirements);

  final Set<Requirement> requirements;

  @override
  bool isMetFor(IngredientsAnalyser ingredientsAnalyser) {
    return requirements.any((requirement) => requirement.isMetFor(ingredientsAnalyser));
  }
}

/// A requirement indicating required minimum food values.
///
/// It is used by food values like a meat value or fruit value so on.
class MeetRequirement extends Requirement {
  const MeetRequirement(this.minimumValues);

  final FoodValues minimumValues;

  @override
  bool isMetFor(IngredientsAnalyser ingredientsAnalyser) {
    return minimumValues.every((minimumValue) {
      final actualValue = ingredientsAnalyser.foodValueFor(minimumValue.category);
      return actualValue >= minimumValue.quantifiedValue;
    });
  }
}

/// A requirement indicating the threshold must be exceeded.
///
/// This requirement really only applies to some recipes such as [HoneyHam].
///
/// Setting the threashold value to 0 is the same as using [AtLeastRequirement], but it is recommended to use [AtLeastRequirement].
class ExcessRequirement extends Requirement {
  const ExcessRequirement(this.thresholdValues);

  final FoodValues thresholdValues;

  @override
  bool isMetFor(IngredientsAnalyser ingredientsAnalyser) {
    return thresholdValues.every((thresholdValue) {
      final actualValue = ingredientsAnalyser.foodValueFor(thresholdValue.category);
      return actualValue > thresholdValue.quantifiedValue;
    });
  }
}

/// A requirement indicating containing at least one even if the smallest.
class AtLeastRequirement extends Requirement {
  const AtLeastRequirement(this.categories);

  final Set<FoodValueCategory> categories;

  @override
  bool isMetFor(IngredientsAnalyser ingredientsAnalyser) {
    return categories.every((category) => ingredientsAnalyser.containsCategory(category));
  }
}

/// A requirement indicating that it must contain a specific item.
///
/// It is useful for [Mandrake] or [TallbirdEgg] such as.
class ContainingRequirement extends Requirement {
  const ContainingRequirement(this.ingredient, [this.count = 1]);

  final IngredientObject ingredient;
  final int count;

  @override
  bool isMetFor(IngredientsAnalyser ingredientsAnalyser) {
    return ingredientsAnalyser.contains(ingredient, count: count);
  }
}

// class ExactRequirement extends Requirement {
//   const ExactRequirement();

//   final

//   @override
//   bool isMetFor(IngredientsAnalyser ingredientsAnalyser) {

//   }
// }

/// A requirement indicating that specific ingredients must not be contained.
class NoRequirement extends Requirement {
  const NoRequirement({
    this.ingredients,
    this.categories,
    // this.excluded = const {},
  });

  final Set<IngredientObject>? ingredients;
  final Set<FoodValueCategory>? categories;
  // final Set<Ingredient> excluded;

  @override
  bool isMetFor(IngredientsAnalyser ingredientsAnalyser) {
    final ingredients = this.ingredients;
    if (ingredients != null) {
      // assert(ingredients.intersection(excluded).isEmpty);
      for (final ingredient in ingredients) {
        if (ingredientsAnalyser.contains(ingredient)) return false;
      }
    }
    final categories = this.categories;
    if (categories != null) {
      for (final category in categories) {
        if (ingredientsAnalyser.containsCategory(category)) return false;
      }
    }
    return true;
  }
}

/// A requirement indicating the threshold of a specific ingredient's food value.
class MaxRequirement extends Requirement {
  const MaxRequirement(this.maximum);

  final FoodValue maximum;

  @override
  bool isMetFor(IngredientsAnalyser ingredientsAnalyser) {
    final foodValue = ingredientsAnalyser.foodValueFor(maximum.category);
    return foodValue <= maximum.quantifiedValue;
  }
}
