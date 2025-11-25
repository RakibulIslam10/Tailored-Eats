import '../../../core/api/services/auth_services.dart';
import '../../../core/utils/basic_import.dart';

class ChangePasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();

  //new password
  final oldPasswordController = TextEditingController();
  final isOldPasswordFocus = FocusNode();

  // password
  final passConfirmController = TextEditingController();
  final confirmPasswordFocus = FocusNode();
  final passwordController = TextEditingController();
  final passwordFocus = FocusNode();
  final isPasswordValid = false.obs;
  final isPasswordVisible = false.obs;




  RxBool isLoading = false.obs;

  changePasswordProcess() async {
    return await AuthService.changePasswordService(
      isLoading: isLoading,
      oldPassword: oldPasswordController.text,
      newPassword: passwordController.text,
    );
  }
}
