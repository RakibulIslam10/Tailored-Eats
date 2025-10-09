import 'package:get/get.dart';
import '../views/final/controller/final_controller.dart';

class FinalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FinalController>(() => FinalController());
  }
}
