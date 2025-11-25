import 'package:tailored_eats/core/utils/basic_import.dart';
import '../../../../routes/routes.dart';
import '../controller/register_controller.dart';

class RegisterFields extends GetView<RegisterController> {
  const RegisterFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.fromKey,
      child: Column(
        children: [
          Space.height.v20,
          PrimaryInputFieldWidget(
            controller: controller.nameController,
            hintText: 'Enter your name',
            label: 'Full Name',
            nextFocusNode: controller.emailFocus,
            requiredField: false,
          ),
          Space.height.betweenInputBox,
          PrimaryInputFieldWidget(
            label: "Email",
            isEmail: true,
            controller: controller.emailController,
            focusNode: controller.emailFocus,
            nextFocusNode: controller.passwordFocus,
            hintText: "Enter your email",
          ),
          Space.height.betweenInputBox,
          PrimaryInputFieldWidget(
            hintText: "Enter your password",
            label: "Create Password",
            isPassword: true,
            controller: controller.passwordController,
            focusNode: controller.passwordFocus,
            nextFocusNode: null,
          ),
          Space.height.betweenInputBox,
          Space.height.betweenInputBox,

          PrimaryButtonWidget(
            title: "Next",
            onPressed: () {
              if (controller.fromKey.currentState!.validate()) {
                // Get.toNamed(Routes.profileCreationScreen);
              }
            },
          ),
          Space.height.v10,
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              TextWidget(
                padding: Dimensions.widthSize.edgeLeft,
                'Don’t have an account?',
                color: CustomColors.grayShade,
                fontWeight: FontWeight.w400,
                fontSize: Dimensions.titleMedium * 0.96,
              ),
              TextWidget(
                padding: Dimensions.widthSize.edgeLeft,
                'Log In',
                onTap: () => Get.offAllNamed(Routes.loginScreen),
                color: CustomColors.primary,
                fontWeight: FontWeight.w500,
                fontSize: Dimensions.titleMedium * 0.96,
              ),
            ],
          ),
          // Space.height.betweenInputBox,
          // PrimaryInputFieldWidget(
          //   hintText: "Confirm your password",
          //   label: "Confirm Password",
          //   isPassword: true,
          //   controller: controller.passConfirmController,
          //   focusNode: controller.confirmPasswordFocus,
          //   nextFocusNode: null,
          //   confirmWith: controller.passwordController, // only checks matching
          // ),
        ],
      ),
    );
  }
}
