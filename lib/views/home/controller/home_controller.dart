import 'package:tailored_eats/core/api/model/basic_success_model.dart';

import '../../../core/api/end_point/api_end_points.dart';
import '../../../core/api/services/api_request.dart';
import '../../../core/utils/basic_import.dart';
import '../../profile_creation/model/profile_creation_model.dart';
import '../model/home_consistency_model.dart';
import '../model/macros_model.dart';

class HomeController extends GetxController {
  final TextEditingController weightController = TextEditingController();
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

  var currentFood = <String, String>{}.obs;

  @override
  void onInit() {
    shuffleList();
    loadInitialData();
    super.onInit();
  }

  RxBool isLoading = false.obs;

  Future<void> loadInitialData() async {
    try {
      isLoading.value = true;
      await Future.wait([getMacrosApiProcess(), getConsistencyApiProcess()]);
    } finally {
      isLoading.value = false;
    }
  }

  RxBool getMacrosLoading = false.obs;

  MacrosModel? macrosModel;

  Future<MacrosModel> getMacrosApiProcess() async {
    return await ApiRequest.get(
      fromJson: MacrosModel.fromJson,
      endPoint: ApiEndPoints.macros,
      isLoading: getMacrosLoading,
      onSuccess: (result) {
        macrosModel = result;
      },
    );
  }

  RxBool getConsistencyLoading = false.obs;

  HomeConsistencyModel? consistencyModel;

  List<Consistency> friendsProgressList = [];
  List<FriendData> friendsDoingPercentList = [];

  Future<HomeConsistencyModel> getConsistencyApiProcess() async {
    return await ApiRequest.get(
      fromJson: HomeConsistencyModel.fromJson,
      endPoint: ApiEndPoints.consistency,
      isLoading: getConsistencyLoading,
      onSuccess: (result) {
        consistencyModel = result;
        friendsProgressList.clear();
        friendsDoingPercentList.clear();
        friendsProgressList.addAll(result.data.consistency);
        friendsDoingPercentList.addAll(result.data.friendsData);
      },
    );
  }

  // add weight
  RxBool isLoadingAddWeight = false.obs;

  Future<BasicSuccessModel> saveWeight() async {
    return await ApiRequest.post(
      fromJson: BasicSuccessModel.fromJson,
      endPoint: ApiEndPoints.addWeight,
      isLoading: isLoadingAddWeight,
      body: {'weight': weightController.text},
      showSuccessSnackBar: true,
    );
  }

  void shuffleList() {
    if (nextBiteFoodsList.isEmpty) return;
    currentFood.value = (nextBiteFoodsList..shuffle()).first;
  }
}
