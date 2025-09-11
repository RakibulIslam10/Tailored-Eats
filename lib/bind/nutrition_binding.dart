import 'package:get/get.dart';
import '../views/nutrition/controller/nutrition_controller.dart';

class NutritionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NutritionController>(() => NutritionController());
  }
}
