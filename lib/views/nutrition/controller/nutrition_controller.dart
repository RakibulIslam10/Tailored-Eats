import 'package:flutter/services.dart';
import 'package:tailored_eats/core/utils/app_storage.dart';
import 'package:tailored_eats/views/nutrition/model/meals_model.dart';
import '../../../core/api/end_point/api_end_points.dart';
import '../../../core/api/services/api_request.dart';
import '../../../core/utils/basic_import.dart';

class NutritionController extends GetxController {
  Rx<Meal?> currentLunch = Rx<Meal?>(null);
  Rx<Meal?> currentDinner = Rx<Meal?>(null);
  Rx<Meal?> currentSnacks = Rx<Meal?>(null);
  Rx<Meal?> currentBreakFast = Rx<Meal?>(null);

  RxList<Meal> breakFastList = <Meal>[].obs;
  RxList<Meal> lunchList = <Meal>[].obs;
  RxList<Meal> dinnerList = <Meal>[].obs;
  RxList<Meal> snacksList = <Meal>[].obs;
  RxList<Meal> favoriteMealsList = <Meal>[].obs;

  RxBool breakfastLoading = false.obs;
  RxBool lunchLoading = false.obs;
  RxBool dinnerLoading = false.obs;
  RxBool snacksLoading = false.obs;

  RxBool generateMealsLoading = false.obs;
  RxBool loadAllData = false.obs;
  RxString currentLoadingMeal = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadInitialData();
  }

  Future<void> getAllMeals(String mealType) async {
    switch (mealType.toLowerCase()) {
      case 'breakfast':
        breakfastLoading.value = true;
        currentLoadingMeal.value = 'Generating Breakfast...';
        break;
      case 'lunch':
        lunchLoading.value = true;
        currentLoadingMeal.value = 'Generating Lunch...';
        break;
      case 'dinner':
        dinnerLoading.value = true;
        currentLoadingMeal.value = 'Generating Dinner...';
        break;
      case 'snacks':
        snacksLoading.value = true;
        currentLoadingMeal.value = 'Generating Snacks...';
        break;
    }

    try {
      await ApiRequest.get(
        fromJson: MealsModel.fromJson,
        endPoint: 'generate/$mealType',
        useAiBaseUrl: true,
        queryParams: {
          'user_id': AppStorage.userEmail.toString(),
          'num_meals': '2',
        },
        isLoading: RxBool(false),
        showResponse: false,
        onSuccess: (result) {
          print(
            '✅ Successfully loaded ${result.meals.length} meals for $mealType',
          );

          if (mealType == 'breakfast') {
            breakFastList.addAll(result.meals);
            shuffleBreakFastList();
          }
          if (mealType == 'lunch') {
            lunchList.addAll(result.meals);
            shuffleLunchListList();
          }
          if (mealType == 'dinner') {
            dinnerList.addAll(result.meals);
            shuffleDinnerList();
          }
          if (mealType == 'snacks') {
            snacksList.addAll(result.meals);
            shuffleSnacksList();
          }
        },
      );
    } finally {
      switch (mealType.toLowerCase()) {
        case 'breakfast':
          breakfastLoading.value = false;
          break;
        case 'lunch':
          lunchLoading.value = false;
          break;
        case 'dinner':
          dinnerLoading.value = false;
          break;
        case 'snacks':
          snacksLoading.value = false;
          break;
      }
    }
  }

  // ✅ Toggle Favorite with API Call
  Future<void> toggleFavorite(Meal meal) async {
    print('🔄 Toggle favorite for: ${meal.mealName}');

    final wasAlreadyFavorite = meal.isFavorite.value;

    // ✅ Instant UI update
    HapticFeedback.lightImpact();
    meal.isFavorite.value = !wasAlreadyFavorite;

    // ✅ Update local favorites list
    if (meal.isFavorite.value) {
      if (!favoriteMealsList.any((m) => m.id == meal.id)) {
        favoriteMealsList.add(meal);
      }
    } else {
      favoriteMealsList.removeWhere((m) => m.id == meal.id);
    }

    // ✅ Force refresh
    breakFastList.refresh();
    lunchList.refresh();
    dinnerList.refresh();
    snacksList.refresh();

    // ✅ API Call
    try {
      if (wasAlreadyFavorite) {
        await _removeFavorite(meal);
      } else {
        await _addFavorite(meal);
      }
    } catch (e) {
      print('❌ Favorite API error: $e');

      // ✅ Revert on error
      meal.isFavorite.value = wasAlreadyFavorite;
      if (wasAlreadyFavorite) {
        if (!favoriteMealsList.any((m) => m.id == meal.id)) {
          favoriteMealsList.add(meal);
        }
      } else {
        favoriteMealsList.removeWhere((m) => m.id == meal.id);
      }

      breakFastList.refresh();
      lunchList.refresh();
      dinnerList.refresh();
      snacksList.refresh();

      CustomSnackBar.error('Failed to update favorite');
    }
  }

  Future<void> _addFavorite(Meal meal) async {
    print('➕ Adding to favorites: ${meal.mealName}');

    await ApiRequest.post(
      fromJson: (json) => json,
      endPoint: 'favorite/add',
      isLoading: RxBool(false),
      useAiBaseUrl: true,


      body: {
        'user_id': AppStorage.userEmail.toString(),
        'meal_type': meal.mealType.toLowerCase(),
        'recipe_name': meal.mealName,
      },
      onSuccess: (result) {
        print('✅ Added to favorites successfully');
        print('📦 Response: $result');
      },
    );
  }

  // ✅ Remove from Favorites API
  Future<void> _removeFavorite(Meal meal) async {
    print('➖ Removing from favorites: ${meal.mealName}');

    await ApiRequest.delete(
      fromJson: (json) => json,
      endPoint: 'favorite/remove',
      isLoading: RxBool(false),
      body: {
        'user_id': AppStorage.userEmail.toString(),
        'recipe_name': meal.mealName,
      },
      onSuccess: (result) {
        print('✅ Removed from favorites successfully');
        print('📦 Response: $result');
      },
    );
  }

  void loadInitialData() async {
    loadAllData.value = true;
    generateMealsLoading.value = true;

    try {
      await getAllMeals('breakfast');
      await getAllMeals('lunch');
      await getAllMeals('dinner');
      await getAllMeals('snacks');
    } catch (e) {
      print("Error loading meals: $e");
    } finally {
      loadAllData.value = false;
      generateMealsLoading.value = false;
      currentLoadingMeal.value = '';
    }
  }

  void shuffleBreakFastList() {
    if (breakFastList.isEmpty) return;
    currentBreakFast.value = (breakFastList..shuffle()).first;
  }

  void shuffleLunchListList() {
    if (lunchList.isEmpty) return;
    currentLunch.value = (lunchList..shuffle()).first;
  }

  void shuffleDinnerList() {
    if (dinnerList.isEmpty) return;
    currentDinner.value = (dinnerList..shuffle()).first;
  }

  void shuffleSnacksList() {
    if (snacksList.isEmpty) return;
    currentSnacks.value = (snacksList..shuffle()).first;
  }

  final List<String> staticImages = [
    "https://picsum.photos/200/150",
    "https://picsum.photos/200/160",
    "https://picsum.photos/200/170",
    "https://picsum.photos/200/180",
    "https://picsum.photos/200/190",
    "https://picsum.photos/200/200",
    "https://picsum.photos/200/210",
    "https://picsum.photos/200/220",
    "https://picsum.photos/200/230",
    "https://picsum.photos/200/240",
  ];

  String getRandomImage() {
    return (staticImages..shuffle()).first;
  }
}
