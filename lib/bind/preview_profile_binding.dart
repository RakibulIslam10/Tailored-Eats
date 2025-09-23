import 'package:get/get.dart';
import '../views/preview_profile/controller/preview_profile_controller.dart';

class PreviewProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PreviewProfileController>(() => PreviewProfileController());
  }
}
