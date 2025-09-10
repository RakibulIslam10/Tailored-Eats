import 'package:tailored_eats/widgets/auth_app_bar.dart';

import '../../../core/utils/basic_import.dart';
import '../../../routes/routes.dart';
import '../../../widgets/divider_widget.dart';
import '../controller/login_controller.dart';

part 'login_screen_mobile.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: LoginScreenMobile());
  }
}
