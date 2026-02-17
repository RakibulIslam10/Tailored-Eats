import 'package:get/get_rx/src/rx_types/rx_types.dart';

class MealsModel {
  final bool success;
  final String mealType;
  final int count;
  final int saved;
  final List<Meal> meals;

  MealsModel({
    required this.success,
    required this.mealType,
    required this.count,
    required this.saved,
    required this.meals,
  });

  factory MealsModel.fromJson(Map<String, dynamic> json) => MealsModel(
    success: json["success"],
    mealType: json["meal_type"],
    count: json["count"],
    saved: json["saved"],
    meals: List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
  );
}

class Meal {
  final int id;
  final String mealName;
  final String mealType;
  final String macroProfile;
  final String cuisine;
  final String description;
  final int caloriesKcal;
  final double proteinG;
  final double carbsG;
  final double fatG;
  final int totalTimeMinutes;
  final String difficulty;
  RxBool isFavorite; // ✅ এটা RxBool হতে হবে

  Meal({
    required this.id,
    required this.mealName,
    required this.mealType,
    required this.macroProfile,
    required this.cuisine,
    required this.description,
    required this.caloriesKcal,
    required this.proteinG,
    required this.carbsG,
    required this.fatG,
    required this.totalTimeMinutes,
    required this.difficulty,
    bool isFavorite = false,
  }) : isFavorite = isFavorite.obs; // ✅ .obs করতে হবে

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
    id: json["id"],
    mealName: json["meal_name"],
    mealType: json["meal_type"],
    macroProfile: json["macro_profile"],
    cuisine: json["cuisine"] ?? "",
    description: json["description"],
    caloriesKcal: json["calories_kcal"],
    proteinG: json["protein_g"]?.toDouble() ?? 0.0,
    carbsG: json["carbs_g"]?.toDouble() ?? 0.0,
    fatG: json["fat_g"]?.toDouble() ?? 0.0,
    totalTimeMinutes: json["total_time_minutes"],
    difficulty: json["difficulty"],
    isFavorite: json["is_favorite"] ?? false,
  );
}