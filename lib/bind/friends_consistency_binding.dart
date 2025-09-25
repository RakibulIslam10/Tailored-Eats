import 'package:get/get.dart';
import '../views/friends/controller/friends_controller.dart';
import '../views/friends_consistency/controller/friends_consistency_controller.dart';

class FriendsConsistencyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FriendsConsistencyController>(
      () => FriendsConsistencyController(),
    );
    Get.lazyPut<FriendsController>(() => FriendsController());
  }
}
