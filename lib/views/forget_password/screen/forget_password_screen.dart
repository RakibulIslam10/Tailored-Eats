import '../../../core/utils/basic_import.dart';
import '../controller/forget_password_controller.dart';

part 'forget_password_screen_mobile.dart';

class ForgetPasswordScreen extends GetView<ForgetPasswordController> {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: ForgetPasswordScreenMobile());
  }
}
