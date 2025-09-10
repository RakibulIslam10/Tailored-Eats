import '../../../core/utils/basic_import.dart';
import '../controller/splash_controller.dart';

part 'splash_screen_mobile.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: SplashScreenMobile());
  }
}
