import 'package:get/get.dart';

import '../../core/api/services/api_request.dart';
import '../nutrition/model/meals_model.dart';
import 'model/my_custom_meal_model.dart';

class MyMealController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    fetchMeals();
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

    RxList<Datum> myMealsList = <Datum>[].obs;

  RxBool isLoading = false.obs;

  Future<MyCustomMealModel> fetchMeals() async {
    return await ApiRequest.get(
      fromJson: MyCustomMealModel.fromJson,
      endPoint: 'meal/get-custom-meal',
      isLoading: isLoading,
      onSuccess: (result) {
        myMealsList.clear();
        myMealsList.addAll(result.data);
      },

    );
  }
}
