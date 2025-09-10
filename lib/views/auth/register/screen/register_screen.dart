import 'package:tailored_eats/widgets/auth_app_bar.dart';

import '../../../../core/utils/basic_import.dart';
import '../controller/register_controller.dart';
import '../widget/register_fields.dart';

part 'register_screen_mobile.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: RegisterScreenMobile());
  }
}
