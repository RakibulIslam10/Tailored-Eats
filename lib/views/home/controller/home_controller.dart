import '../../../core/utils/basic_import.dart';

class HomeController extends GetxController {
  final TextEditingController weightController = TextEditingController(
    text: '100 kg',
  );

  RxDouble currentCalories = 870.0.obs;
  RxDouble progress = 0.45.obs;
  RxDouble percentage = 0.65.obs;

  var currentFood = <String, String>{}.obs;
  RxList nextBiteFoodsList = <Map<String, String>>[
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

  @override
  void onInit() {
    shuffleList();
    super.onInit();
  }

  void shuffleList() {
    if (nextBiteFoodsList.isEmpty) return;
    currentFood.value = (nextBiteFoodsList..shuffle()).first;
  }
}
