part of 'two_fa_screen.dart';

class TwoFaScreenMobile extends GetView<TwoFaController> {
  const TwoFaScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: 'Verify Code'),
      body: SafeArea(
        child: ListView(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          children:  [
            Padding(
              padding: Dimensions.verticalSize.edgeVertical * 1.5,
              child: Image.asset(
                Assets.dummy.logo.path,
                height: 100.h,
                width: 100.w,
              ),
            ),

            Space.height.v30,
            TextWidget(
              textAlign: TextAlign.center,
              padding: EdgeInsetsGeometry.only(bottom: Dimensions.heightSize),
              'Two Fa Verify Verification',
              fontWeight: FontWeight.bold,
              fontSize: Dimensions.titleLarge * 0.95,
            ),
            TextWidget(
              textAlign: TextAlign.center,
              padding: EdgeInsetsGeometry.only(
                top: Dimensions.heightSize,
                bottom: Dimensions.verticalSize,
              ),
              "Please check your email or phone to get the 6-digit code.",
              color: CustomColors.secondaryDarkText,
            ),

            PinCodeTextField(
              length: 6,
              appContext: context,
              keyboardType: TextInputType.number,
              animationType: AnimationType.fade,
              controller: controller.otpController,
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: true,
              onCompleted: (v) {
                print("Completed");
              },
              beforeTextPaste: (text) {
                print("Allowing to paste $text");
                return true;
              },
              textStyle: TextStyle(
                color: CustomColors.primary, // ✅ Input text color
                fontSize: Dimensions.titleMedium,
                fontWeight: FontWeight.w500,
              ),
              pinTheme: PinTheme(
                selectedFillColor: CustomColors.whiteColor,
                // ✅ box fill always white
                inactiveFillColor: CustomColors.whiteColor,
                // ✅ box fill always white
                activeFillColor: CustomColors.whiteColor,

                // ✅ box fill always white
                inactiveColor: CustomColors.secondaryDarkText,
                selectedColor: CustomColors.primary,
                activeColor: CustomColors.primary,
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
                fieldHeight: 40.h,
                fieldWidth: 40.w,
              ),
            ),

            // Row(
            //   mainAxisAlignment: mainCenter,
            //   children: [TimerWidget(onResendCode: () {})],
            // ),

            Space.height.betweenInputBox,
            PrimaryButtonWidget(
              title: "Submit",
              onPressed: () {

              },
              // onPressed: () =>  Get.toNamed(Routes.reset_passwordScreen),
            )
          ],
        ),
      ),
    );
  }
}
