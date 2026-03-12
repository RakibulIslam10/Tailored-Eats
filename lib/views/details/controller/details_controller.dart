import 'package:tailored_eats/core/utils/app_storage.dart';
import 'package:tailored_eats/views/details/model/single_meals_model.dart';
import '../../../core/api/end_point/api_end_points.dart';
import '../../../core/api/model/basic_success_model.dart';
import '../../../core/api/services/api_request.dart';
import '../../../core/utils/basic_import.dart';

// details_controller.dart

import 'package:tailored_eats/core/utils/app_storage.dart';
import 'package:tailored_eats/views/details/model/single_meals_model.dart';
import '../../../core/api/end_point/api_end_points.dart';
import '../../../core/api/services/api_request.dart';
import '../../../core/utils/basic_import.dart';

class DetailsController extends GetxController {
  RxDouble progress = 0.45.obs;

  Rx<SingleMealsModel?> mealDetails = Rx<SingleMealsModel?>(null);
  RxBool isLoading = false.obs;
  RxBool isAteLoading = false.obs;

  late String recipeName;

  @override
  void onInit() {
    super.onInit();
    recipeName = Get.arguments ?? '';
    if (recipeName.isNotEmpty) {
      getMealDetails();
    } else {
      print("❌ Recipe name is empty");
    }
  }

  Future<void> getMealDetails() async {
    try {
      isLoading.value = true;
      print("🔎 Recipe Name: $recipeName");
      await ApiRequest.get(
        fromJson: SingleMealsModel.fromJson,
        endPoint: 'meal/${Uri.encodeComponent(recipeName)}',
        useAiBaseUrl: true,
        queryParams: {'user_id': AppStorage.userEmail.toString()},
        isLoading: RxBool(false),
        showResponse: true,
        onSuccess: (result) {
          mealDetails.value = result;
          print('✅ Meal details loaded: ${result.recipeName}');
        },
      );
    } catch (e) {
      print('❌ Error loading meal details: $e');
      CustomSnackBar.error('Failed to load meal details');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> ateMeal() async {
    final meal = mealDetails.value;
    if (meal == null) return;

    await ApiRequest.patch(
      fromJson: BasicSuccessModel.fromJson,
      endPoint: 'meal/ate-meal',
      isLoading: isAteLoading,
      showSuccessSnackBar: true,
      body: {
        'consumedCalorie': meal.caloriesKcal,
        'consumedProtein': meal.proteinG,
        'consumedCarb': meal.carbsG,
        'consumedFat': meal.fatG,
      },
      onSuccess: (result) {
        Get.close(1);
      },
    );
  }
}