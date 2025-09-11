import 'package:get/get.dart';
import 'package:tailored_eats/views/consistency/controller/consistency_controller.dart';
import 'package:tailored_eats/views/friends/controller/friends_controller.dart';
import 'package:tailored_eats/views/goal/controller/goal_controller.dart';
import 'package:tailored_eats/views/home/controller/home_controller.dart';
import 'package:tailored_eats/views/nutrition/controller/nutrition_controller.dart';
import 'package:tailored_eats/views/profile/controller/profile_controller.dart';
import '../views/navigation/controller/navigation_controller.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationController>(() => NavigationController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<NutritionController>(() => NutritionController());
    Get.lazyPut<GoalController>(() => GoalController());
    Get.lazyPut<ConsistencyController>(() => ConsistencyController());
    Get.lazyPut<FriendsController>(() => FriendsController());
  }
}
