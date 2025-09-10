import '../../../core/utils/basic_import.dart';
import '../controller/reset_password_controller.dart';

part 'reset_password_screen_mobile.dart';

class ResetPasswordScreen extends GetView<ResetPasswordController> {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: ResetPasswordScreenMobile());
  }
}
