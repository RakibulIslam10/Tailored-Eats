import '../../../core/utils/basic_import.dart';
import '../../../routes/routes.dart';
import '../../../widgets/auth_app_bar.dart';
import '../../home/screen/home_screen.dart';
import '../controller/swap_controller.dart';

part 'swap_screen_mobile.dart';

class SwapScreen extends GetView<SwapController> {
  const SwapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: SwapScreenMobile());
  }
}
