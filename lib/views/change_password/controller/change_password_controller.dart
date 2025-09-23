import '../../../core/utils/basic_import.dart';

class ChangePasswordController extends GetxController {
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
}
