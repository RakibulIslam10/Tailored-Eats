import 'package:get/get.dart';
import '../views/friends/controller/friends_controller.dart';

class FriendsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FriendsController>(() => FriendsController());
  }
}
