part of 'final_screen.dart';

class FinalScreenMobile extends GetView<FinalController> {
  const FinalScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: PrimaryButtonWidget(
        buttonTextColor: CustomColors.blackColor,
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.defaultHorizontalSize,
          vertical: Dimensions.verticalSize * 4,
        ),
        title: "Go to home",
        onPressed: () => Get.offAllNamed(Routes.navigationScreen),
      ),

      appBar: CommonAppBar(title: ""),
      body: SafeArea(
        child: ListView(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          children: [
            Space.height.v100,
            TextWidget(
              textAlign: TextAlign.center,
              "You Are All Set",
              fontSize: Dimensions.titleLarge,
              fontWeight: FontWeight.bold,
            ),
            Space.height.v10,
            TextWidget(
              textAlign: TextAlign.center,
              'Your personalized plan is ready',
              color: CustomColors.grayShade,
            ),
          ],
        ),
      ),
    );
  }
}
