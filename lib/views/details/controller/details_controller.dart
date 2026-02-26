import 'package:tailored_eats/core/utils/app_storage.dart';
import 'package:tailored_eats/views/details/model/single_meals_model.dart';
import '../../../core/api/end_point/api_end_points.dart';
import '../../../core/api/services/api_request.dart';
import '../../../core/utils/basic_import.dart';

class DetailsController extends GetxController {
  RxDouble progress = 0.45.obs;

  // Meal data
  Rx<SingleMealsModel?> mealDetails = Rx<SingleMealsModel?>(null);
  RxBool isLoading = false.obs;

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

        // ✅ FIXED HERE
        endPoint: 'meal/${Uri.encodeComponent(recipeName)}',

        useAiBaseUrl: true,

        // ❌ REMOVE recipe-name from query param
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
}
