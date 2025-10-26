import 'package:get/get.dart';

import '../views/profile_creation/controller/profile_creation_controller.dart';

class ProfileCreationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileCreationController>(() => ProfileCreationController());
  }
}
