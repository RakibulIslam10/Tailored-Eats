import '../../../core/utils/basic_import.dart';
import '../../../routes/routes.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Future.delayed(Duration(seconds: 2), () {
      Get.offAllNamed(Routes.navigationScreen);
    });
  }
}
