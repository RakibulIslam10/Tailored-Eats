import 'package:tailored_eats/views/auth/forget_password/controller/forget_password_controller.dart';

import '../../../../core/api/services/auth_services.dart';
import '../../../../core/utils/basic_import.dart';

class VerificationController extends GetxController {
  // TODO: Logic
  final otpController = TextEditingController();

  // otp verify api
  RxBool isLoading = false.obs;

  otpVerifyProcess() async {
    return await AuthService.forgetOtpVerifyService(
      isLoading: isLoading,
      code: otpController.text.toString(),
      email: Get.find<ForgetPasswordController>().emailController.text,
    );
  }
}
