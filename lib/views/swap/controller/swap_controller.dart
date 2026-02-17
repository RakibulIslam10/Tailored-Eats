import '../../../core/utils/basic_import.dart';
import '../../nutrition/controller/nutrition_controller.dart';
import '../../nutrition/model/meals_model.dart';

class SwapController extends GetxController {
  late String mealType;

  @override
  void onInit() {
    super.onInit();
    mealType = Get.arguments ?? 'breakfast';
  }

  RxList<Meal> get currentMealList {
    final nutritionController = Get.find<NutritionController>();

    switch (mealType.toLowerCase()) {
      case 'breakfast':
        return nutritionController.breakFastList;
      case 'lunch':
        return nutritionController.lunchList;
      case 'dinner':
        return nutritionController.dinnerList;
      case 'snacks':
        return nutritionController.snacksList;
      default:
        return nutritionController.breakFastList;
    }
  }

  RxList<Meal> get filteredMealList {
    var meals = currentMealList.value;

    if (selectedSortBy.value == 'Favorites') {
      // Implement favorite logic if needed
      // meals = meals.where((meal) => meal.isFavorite).toList();
    }

    if (selectedPrepTimes.isNotEmpty) {
      meals = meals.where((meal) {
        return selectedPrepTimes.any((timeRange) {
          final time = meal.totalTimeMinutes;
          switch (timeRange) {
            case '0m - 15m':
              return time <= 15;
            case '15m - 30m':
              return time > 15 && time <= 30;
            case '30m - 45m':
              return time > 30 && time <= 45;
            case '45m - 1hr':
              return time > 45 && time <= 60;
            default:
              return true;
          }
        });
      }).toList();
    }

    if (selectedMacros.isNotEmpty) {
      meals = meals.where((meal) {
        return selectedMacros.any((macro) {
          final profile = meal.macroProfile.toLowerCase();
          switch (macro) {
            case 'High Protein':
              return profile.contains('high_protein') ||
                  profile.contains('high protein');
            case 'Balanced':
              return profile.contains('balanced');
            case 'Low Carbs':
              return profile.contains('low_carb') ||
                  profile.contains('low carb');
            default:
              return true;
          }
        });
      }).toList();
    }

    meals = meals.where((meal) {
      return meal.caloriesKcal >= minPrice.value &&
          meal.caloriesKcal <= maxPrice.value;
    }).toList();

    return meals.obs;
  }

  var selectedSortBy = 'All Meals'.obs;
  final sortByOptions = ['All Meals', 'Favorites'];

  var minPrice = 0.0.obs;
  var maxPrice = 800.0.obs;
  final minPriceLimit = 0.0;
  final maxPriceLimit = 1000.0;

  var selectedPrepTimes = <String>[].obs;
  final prepTimeOptions = ['0m - 15m', '15m - 30m', '30m - 45m', '45m - 1hr'];

  var selectedMacros = <String>[].obs;
  final macroOptions = ['High Protein', 'Balanced', 'Low Carbs'];

  // Methods
  void selectSortBy(String option) {
    selectedSortBy.value = option;
  }

  void updateMinPrice(double value) {
    minPrice.value = value;
    if (minPrice.value > maxPrice.value) {
      maxPrice.value = minPrice.value;
    }
  }

  void updateMaxPrice(double value) {
    maxPrice.value = value;
    if (maxPrice.value < minPrice.value) {
      minPrice.value = maxPrice.value;
    }
  }

  void togglePrepTime(String prepTime) {
    if (selectedPrepTimes.contains(prepTime)) {
      selectedPrepTimes.remove(prepTime);
    } else {
      selectedPrepTimes.add(prepTime);
    }
  }

  void toggleMacro(String macro) {
    if (selectedMacros.contains(macro)) {
      selectedMacros.remove(macro);
    } else {
      selectedMacros.add(macro);
    }
  }

  void clearAllFilters() {
    selectedSortBy.value = 'All Meals';
    minPrice.value = 0.0;
    maxPrice.value = 800.0;
    selectedPrepTimes.clear();
    selectedMacros.clear();
  }

  void applyFilters() {
    print('Applied Filters:');
    print('Sort By: ${selectedSortBy.value}');
    print('Calorie Range: ${minPrice.value} - ${maxPrice.value}');
    print('Prep Times: ${selectedPrepTimes.value}');
    print('Macros: ${selectedMacros.value}');

    Get.back();
  }

  bool isPrepTimeSelected(String prepTime) {
    return selectedPrepTimes.contains(prepTime);
  }

  bool isMacroSelected(String macro) {
    return selectedMacros.contains(macro);
  }
}