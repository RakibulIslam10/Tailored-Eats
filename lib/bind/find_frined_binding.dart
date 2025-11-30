import 'package:get/get.dart';
import '../views/find_frined/controller/find_frined_controller.dart';

class FindFrinedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FindFrinedController>(() => FindFrinedController());
  }
}
