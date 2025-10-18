import '../../../../core/utils/basic_import.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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

  @override
  void onInit() {
    super.onInit();
    emailController.text = 'rakib10.devs@gmail.com';
    passwordController.text = '1232456';
  }

  /// Dispose
  @override
  void onClose() {
    emailController.dispose();
    emailFocus.dispose();
    passwordController.dispose();
    passwordFocus.dispose();
    super.onClose();
  }
}
