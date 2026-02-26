import 'package:get/get.dart';
import 'package:tailored_eats/views/my_meal/my_meal_controller.dart';
import '../views/find_frined/controller/find_frined_controller.dart';

class FindFrinedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FindFrinedController>(() => FindFrinedController());
  }
}

class MyMealBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyMealController>(() => MyMealController());
  }
}
