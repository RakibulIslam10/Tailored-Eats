import 'package:tailored_eats/routes/routes.dart';

import '../../../core/utils/basic_import.dart';
import '../controller/welcome_controller.dart';

part 'welcome_screen_mobile.dart';

class WelcomeScreen extends GetView<WelcomeController> {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: WelcomeScreenMobile());
  }
}
