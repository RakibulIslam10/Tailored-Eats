import 'package:get/get.dart';
import '../views/goal/controller/goal_controller.dart';

class GoalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GoalController>(() => GoalController());
  }
}
