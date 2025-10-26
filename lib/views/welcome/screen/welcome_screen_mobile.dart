part of 'welcome_screen.dart';

class WelcomeScreenMobile extends GetView<WelcomeController> {
  const WelcomeScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: CustomColors.blackColor),
      body: SafeArea(
        child: ListView(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          children: [
            TextWidget(
              padding: Dimensions.heightSize.edgeBottom * 0.8,
              'Let’s get to know you',
              fontSize: Dimensions.titleLarge,
              fontWeight: FontWeight.bold,
            ),
            TextWidget(
              'A few quick questions to personalize your experience',
              fontSize: Dimensions.titleSmall,
              color: CustomColors.grayShade,
            ),
            Space.height.v30,
            SvgPicture.asset(Assets.dummy.welcom),
            PrimaryButtonWidget(
              padding: Dimensions.verticalSize.edgeVertical * 2.5,
              title: 'Continue',
              onPressed: () => Get.toNamed(Routes.loginScreen),
            ),
          ],
        ),
      ),
    );
  }
}
