import 'package:get/get.dart';
import '../views/picture_progress/controller/picture_progress_controller.dart';

class PictureProgressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PictureProgressController>(() => PictureProgressController());
  }
}
