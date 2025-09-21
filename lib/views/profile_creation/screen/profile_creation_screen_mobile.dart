part of 'profile_creation_screen.dart';

class ProfileCreationScreenMobile extends GetView<ProfileCreationController> {
  const ProfileCreationScreenMobile({super.key});

  List<Widget> get _screens => [
    GenderViewWidget(),
    AgeViewWidget(),
    WeightPicker(),
    HeightSelectorWidget(),
    ActivityLevelWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => controller.currentStep.value == 0
            ? SizedBox()
            : PrimaryButtonWidget(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.defaultHorizontalSize,
                  vertical: Dimensions.verticalSize * 2,
                ),
                title: "Next",
                onPressed: () =>
                    Get.find<ProfileCreationController>().nextStep(),
              ),
      ),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: CustomColors.blackColor,
        toolbarHeight: 200,
        flexibleSpace: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.defaultHorizontalSize,
            ),
            child: Column(
              crossAxisAlignment: crossStart,
              children: [
                InkWell(
                  onTap: () => controller.previousStep(),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: CustomColors.whiteColor,
                  ),
                ),
                Space.height.v20,
                Obx(() {
                  return ProgressBar(
                    currentStep: controller.currentStep.value,
                    totalSteps: controller.totalSteps,
                  );
                }),
              ],
            ),
          ),
        ),
      ),
      body: Obx(() {
        return AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          child: _screens[controller.currentStep.value],
          transitionBuilder: (Widget child, Animation<double> animation) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
      }),
    );
  }
}
