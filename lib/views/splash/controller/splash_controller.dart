import '../../../core/utils/app_storage.dart';
import '../../../core/utils/basic_import.dart';
import '../../../routes/routes.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Future.delayed(Duration(seconds: 2), () {
      if (AppStorage.isLoggedIn) {
        Get.offAllNamed(Routes.navigationScreen);
      } else {
        Get.offAllNamed(Routes.welcomeScreen);
      }
    });
  }
}
