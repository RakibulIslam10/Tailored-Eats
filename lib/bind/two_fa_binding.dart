import 'package:get/get.dart';
import '../views/two_fa/controller/two_fa_controller.dart';

class TwoFaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TwoFaController>(() => TwoFaController());
  }
}
