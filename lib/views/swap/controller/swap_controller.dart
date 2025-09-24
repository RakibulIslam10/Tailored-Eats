import '../../../core/utils/basic_import.dart';

class SwapController extends GetxController {
  RxList foods = <Map<String, String>>[
    {
      "title": "Grilled Chicken",
      "description":
          "Served with fresh seasonal vegetables and a light drizzle of olive oil for extra flavor.",
      "calories": "250 kcal",
      "time": "20 min",
      "imageUrl": "https://picsum.photos/200/150",
    },
    {
      "title": "Pasta Carbonara",
      "description":
          "Classic Italian pasta cooked to perfection with creamy sauce, bacon bits, and freshly grated parmesan cheese.",
      "calories": "320 kcal",
      "time": "15 min",
      "imageUrl": "https://picsum.photos/200/160",
    },
    {
      "title": "Avocado Toast",
      "description":
          "Whole grain bread topped with smashed avocado, a pinch of salt, pepper, and a sprinkle of chili flakes.",
      "calories": "180 kcal",
      "time": "10 min",
      "imageUrl": "https://picsum.photos/200/170",
    },
    {
      "title": "Caesar Salad",
      "description":
          "Crispy lettuce, homemade croutons, and Caesar dressing topped with shaved parmesan and grilled chicken slices.",
      "calories": "220 kcal",
      "time": "12 min",
      "imageUrl": "https://picsum.photos/200/180",
    },
    {
      "title": "Beef Burger",
      "description":
          "Juicy beef patty grilled to perfection, served with melted cheese, fresh lettuce, tomato, and golden crispy fries.",
      "calories": "450 kcal",
      "time": "25 min",
      "imageUrl": "https://picsum.photos/200/190",
    },
    {
      "title": "Fruit Smoothie",
      "description":
          "A refreshing blend of mixed berries, banana, and yogurt, perfect for a healthy breakfast or snack.",
      "calories": "150 kcal",
      "time": "8 min",
      "imageUrl": "https://picsum.photos/200/200",
    },
    {
      "title": "Sushi Platter",
      "description":
          "Assorted sushi rolls including salmon, tuna, and vegetarian options served with soy sauce, wasabi, and pickled ginger.",
      "calories": "280 kcal",
      "time": "18 min",
      "imageUrl": "https://picsum.photos/200/210",
    },
    {
      "title": "Vegetable Soup",
      "description":
          "Light and healthy soup with seasonal vegetables, herbs, and a touch of olive oil for added flavor.",
      "calories": "120 kcal",
      "time": "15 min",
      "imageUrl": "https://picsum.photos/200/220",
    },
    {
      "title": "Steak & Potatoes",
      "description":
          "Grilled steak cooked to your liking with roasted potatoes and a side of sautéed vegetables.",
      "calories": "500 kcal",
      "time": "30 min",
      "imageUrl": "https://picsum.photos/200/230",
    },
    {
      "title": "Pancakes",
      "description":
          "Fluffy pancakes served with warm maple syrup, fresh berries, and a dollop of whipped cream.",
      "calories": "300 kcal",
      "time": "20 min",
      "imageUrl": "https://picsum.photos/200/240",
    },
  ].obs;

  // Sort By options
  var selectedSortBy = 'All Meals'.obs;
  final sortByOptions = ['All Meals', 'Favorites'];

  // Price filter
  var minPrice = 0.0.obs;
  var maxPrice = 100.0.obs;
  final minPriceLimit = 0.0;
  final maxPriceLimit = 200.0;

  // Prep Time filter
  var selectedPrepTimes = <String>[].obs;
  final prepTimeOptions = ['0m - 15m', '15m - 30m', '30m - 45m', '45m - 1hr'];

  // Macros filter
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
    maxPrice.value = 100.0;
    selectedPrepTimes.clear();
    selectedMacros.clear();
  }

  void applyFilters() {
    print('Applied Filters:');
    print('Sort By: ${selectedSortBy.value}');
    print('Price Range: ${minPrice.value} - ${maxPrice.value}');
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
