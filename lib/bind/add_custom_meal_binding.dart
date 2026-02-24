import 'package:get/get.dart';
import 'package:tailored_eats/views/add_custom_meal_screen/add_custom_meal_controller.dart';
import '../views/find_frined/controller/find_frined_controller.dart';

class AddCustomMealBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddCustomMealController>(() => AddCustomMealController());
  }
}
