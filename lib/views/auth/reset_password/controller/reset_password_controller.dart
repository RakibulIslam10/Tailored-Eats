import 'package:tailored_eats/views/auth/forget_password/controller/forget_password_controller.dart';

import '../../../../core/api/services/auth_services.dart';
import '../../../../core/utils/basic_import.dart';

class ResetPasswordController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //password reset
  final passwordController = TextEditingController();
  final passwordFocus = FocusNode();
  final isPasswordValid = false.obs;
  final passConfirmController = TextEditingController();

  final confirmPasswordFocus = FocusNode();
  // Reset password api
  RxBool isLoading = false.obs;

  resetPasswordProcess() async {
    return await AuthService.resetPasswordService(
      isLoading: isLoading,
      password: passwordController.text,
      email: Get.find<ForgetPasswordController>().emailController.text,
    );
  }
}
