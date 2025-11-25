part of 'reset_password_screen.dart';

class ResetPasswordScreenMobile extends GetView<ResetPasswordController> {
  const ResetPasswordScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: 'Reset Password'),
      body: SafeArea(
        child: Padding(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          child: Form(
            key: controller.formKey,
            child: ListView(
              children: [
                Space.height.v30,
                Image.asset(
                  Assets.dummy.logo.path,
                  height: 100.h,
                  width: 100.w,
                ),

                Space.height.v30,
                PrimaryInputFieldWidget(
                  hintText: "Enter your password",
                  label: "Password",
                  isPassword: true,
                  controller: controller.passwordController,
                  focusNode: controller.passwordFocus,
                  nextFocusNode: controller.confirmPasswordFocus,
                ),
                Space.height.betweenInputBox,
                PrimaryInputFieldWidget(
                  hintText: "Confirm your password",
                  label: "Confirm Password",
                  isPassword: true,
                  controller: controller.passConfirmController,
                  focusNode: controller.confirmPasswordFocus,
                  nextFocusNode: null,
                  confirmWith: controller.passwordController,
                ),
                Space.height.v30,
                Space.height.v30,
                Obx(
                  () => PrimaryButtonWidget(
                    title: 'Confirm',
                    onPressed: () => controller.resetPasswordProcess(),
                    isLoading: controller.isLoading.value,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
