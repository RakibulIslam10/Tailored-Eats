import 'package:get/get.dart';
import '../views/consistency/controller/consistency_controller.dart';

class ConsistencyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConsistencyController>(() => ConsistencyController());
  }
}
