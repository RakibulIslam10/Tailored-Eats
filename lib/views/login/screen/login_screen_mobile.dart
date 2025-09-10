part of 'login_screen.dart';

class LoginScreenMobile extends GetView<LoginController> {
  const LoginScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: 'Login'),
      body: SafeArea(
        child: ListView(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          children: [
            Padding(
              padding: Dimensions.verticalSize.edgeVertical * 1.5,
              child: Image.asset(
                Assets.dummy.logo.path,
                height: 100.h,
                width: 100.w,
              ),
            ),
            PrimaryInputFieldWidget(
              label: "Email",
              isEmail: true,
              controller: controller.emailController,
              focusNode: controller.emailFocus,
              nextFocusNode: controller.passwordFocus,
              hintText: "Enter your email",
              fillColor: CustomColors.whiteColor.withAlpha(45),
            ),

            Space.height.betweenInputBox,
            PrimaryInputFieldWidget(
              hintText: "Enter your password",
              label: "Password",
              isPassword: true,

              controller: controller.passwordController,
              focusNode: controller.passwordFocus,
              nextFocusNode: null,
              showBorder: false,
              fillColor: CustomColors.whiteColor.withAlpha(45),
            ),
            Space.height.v10,
            Row(
              mainAxisAlignment: mainEnd,
              children: [
                TextWidget(
                  onTap: () => Get.toNamed(Routes.forget_passwordScreen),
                  "Forget Password",
                  color: CustomColors.primary,
                  fontWeight: FontWeight.w400,
                  fontSize: Dimensions.titleSmall,
                ),
              ],
            ),
            Space.height.v20,

            /// Button
            PrimaryButtonWidget(title: 'Log In', onPressed: () {}),

            Space.height.v20,

            Center(
              child: Wrap(
                children: [
                  TextWidget(
                    padding: Dimensions.widthSize.edgeLeft,
                    'Don’t have an account?',
                    color: CustomColors.secondaryDarkText,
                    fontWeight: FontWeight.w400,
                    fontSize: Dimensions.titleMedium * 0.96,
                  ),
                  TextWidget(
                    padding: Dimensions.widthSize.edgeLeft,
                    'Sign Up',
                    onTap: () => Get.toNamed(Routes.registerScreen),
                    color: CustomColors.primary,
                    fontWeight: FontWeight.w500,
                    fontSize: Dimensions.titleMedium * 0.96,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
