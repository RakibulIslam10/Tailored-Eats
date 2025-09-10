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
          child: ListView(
            children: [
              Padding(
                padding: Dimensions.verticalSize.edgeVertical * 1.5,
                child: Image.asset(
                  Assets.dummy.logo.path,
                  height: 100.h,
                  width: 100.w,
                ),
              ),

              Space.height.v30,
              PrimaryInputFieldWidget(
                hintText: "Enter your password",
                label: "Create Password",
                isPassword: true,
                controller: controller.passwordController,
                // focusNode: controller.passwordFocus,
                nextFocusNode: null,
              ),
              Space.height.v30,
              PrimaryButtonWidget(
                title: 'Confirm',
                onPressed: () => Get.offAllNamed(Routes.loginScreen),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
