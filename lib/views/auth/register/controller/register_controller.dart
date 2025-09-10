import '../../../../core/utils/basic_import.dart';

class RegisterController extends GetxController {
  final GlobalKey<FormState> fromKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final passController = TextEditingController();
  final passConfirmController = TextEditingController();
  // final confirmPasswordFocus = FocusNode();

  // email
  final emailController = TextEditingController();
  final emailFocus = FocusNode();
  final isEmailValid = false.obs;

  // password
  final passwordController = TextEditingController();
  final passwordFocus = FocusNode();
  final isPasswordValid = false.obs;
  final isPasswordVisible = false.obs;
  final rememberMe = false.obs;

  final isCheck = false.obs;
}
