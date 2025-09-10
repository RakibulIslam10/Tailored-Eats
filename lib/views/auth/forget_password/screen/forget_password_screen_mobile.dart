part of 'forget_password_screen.dart';

class ForgetPasswordScreenMobile extends GetView<ForgetPasswordController> {
  const ForgetPasswordScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: 'Forgot Password'),
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
            TextWidget(
              textAlign: TextAlign.center,
              padding: EdgeInsetsGeometry.only(
                top: Dimensions.heightSize * 2,
                bottom: Dimensions.verticalSize,
              ),
              'Enter your email and we will send you a verification code',
              color: CustomColors.grayShade,
            ),

            PrimaryInputFieldWidget(
              label: "Email",
              isEmail: true,
              controller: controller.emailController,
              focusNode: controller.emailFocus,
              hintText: "Enter your email",
            ),
            Space.height.betweenInputBox,
            Space.height.betweenInputBox,

              PrimaryButtonWidget(title: "Send Code", onPressed: () {
              Get.toNamed(Routes.verificationScreen);
            }),
          ],
        ),
      ),
    );
  }
}
