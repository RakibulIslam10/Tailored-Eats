import 'package:get/get.dart';
import '../views/auth/verification/controller/verification_controller.dart';

class VerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerificationController>(() => VerificationController());
  }
}
