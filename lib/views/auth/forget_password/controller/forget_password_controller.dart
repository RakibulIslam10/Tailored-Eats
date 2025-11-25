import '../../../../core/api/services/auth_services.dart';
import '../../../../core/utils/basic_import.dart';

class ForgetPasswordController extends GetxController {

  final GlobalKey<FormState> fromKey = GlobalKey<FormState>();

  // email
  final emailController = TextEditingController();
  final emailFocus = FocusNode();
  final isEmailValid = false.obs;
  // Forget password api
  RxBool isLoading = false.obs;

  forgetPasswordProcess() async {
    return await AuthService.forgotPasswordService(
      isLoading: isLoading,
      email: emailController.text,
    );
  }

}

