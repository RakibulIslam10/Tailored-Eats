class SingleMealsModel {
  final String recipeName;
  final String description;
  final String cuisine;
  final String mealType;
  final String macroProfile;

  final int caloriesKcal;
  final double proteinG;
  final double carbsG;
  final double fatG;
  final double fiberG;

  final List<Ingredient> ingredients;
  final List<String> instructions;

  final int prepTimeMinutes;
  final int cookTimeMinutes;
  final int totalTimeMinutes;

  final double costGbp;
  final String imagePrompt;
  final bool isFavorite;

  SingleMealsModel({
    required this.recipeName,
    required this.description,
    required this.cuisine,
    required this.mealType,
    required this.macroProfile,
    required this.caloriesKcal,
    required this.proteinG,
    required this.carbsG,
    required this.fatG,
    required this.fiberG,
    required this.ingredients,
    required this.instructions,
    required this.prepTimeMinutes,
    required this.cookTimeMinutes,
    required this.totalTimeMinutes,
    required this.costGbp,
    required this.imagePrompt,
    required this.isFavorite,
  });

  factory SingleMealsModel.fromJson(Map<String, dynamic> json) {
    return SingleMealsModel(
      recipeName: json["recipe_name"] ?? "",
      description: json["description"] ?? "",
      cuisine: json["cuisine"] ?? "",
      mealType: json["meal_type"] ?? "",
      macroProfile: json["macro_profile"] ?? "",

      caloriesKcal: json["calories_kcal"] ?? 0,

      proteinG: (json["protein_g"] as num?)?.toDouble() ?? 0.0,
      carbsG: (json["carbs_g"] as num?)?.toDouble() ?? 0.0,
      fatG: (json["fat_g"] as num?)?.toDouble() ?? 0.0,
      fiberG: (json["fiber_g"] as num?)?.toDouble() ?? 0.0,

      ingredients: (json["ingredients"] as List?)
          ?.map((e) => Ingredient.fromJson(e))
          .toList() ??
          [],

      instructions:
      (json["instructions"] as List?)?.map((e) => e.toString()).toList() ??
          [],

      prepTimeMinutes: json["prep_time_minutes"] ?? 0,
      cookTimeMinutes: json["cook_time_minutes"] ?? 0,
      totalTimeMinutes: json["total_time_minutes"] ?? 0,

      costGbp: (json["cost_gbp"] as num?)?.toDouble() ?? 0.0,

      imagePrompt: json["image_prompt"] ?? "",
      isFavorite: json["is_favorite"] ?? false,
    );
  }
}

class Ingredient {
  final String item;
  final String quantity;
  final int calories;
  final double proteinG;
  final double carbsG;
  final double fatG;

  Ingredient({
    required this.item,
    required this.quantity,
    required this.calories,
    required this.proteinG,
    required this.carbsG,
    required this.fatG,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      item: json["item"] ?? "",
      quantity: json["quantity"] ?? "",
      calories: json["calories"] ?? 0,

      proteinG: (json["protein_g"] as num?)?.toDouble() ?? 0.0,
      carbsG: (json["carbs_g"] as num?)?.toDouble() ?? 0.0,
      fatG: (json["fat_g"] as num?)?.toDouble() ?? 0.0,
    );
  }
}
