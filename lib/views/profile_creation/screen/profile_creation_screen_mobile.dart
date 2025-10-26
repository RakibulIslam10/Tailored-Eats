part of 'profile_creation_screen.dart';

class ProfileCreationScreenMobile extends GetView<ProfileCreationController> {
  const ProfileCreationScreenMobile({super.key});

  List<Widget> get _screens => [
    GenderViewWidget(),
    AgeViewWidget(),
    WeightPicker(),
    HeightSelectorWidget(),
    SelectableListWidget(
      title: "What’s Your Activity Level?",
      items: controller.activityList,
    ),
    SelectableListWidget(
      title: "What are your dietary requirements",
      items: controller.foodVibeList,
    ),
    SelectableListWidget(
      title: "What’s your main goal?",
      items: controller.mainGoalList,
    ),
    SelectableListWidget(
      title: "How fast do you want results?",
      items: controller.wantResultList,
    ),
    SelectableListWidget(
      title: "How often can you train?",
      items: controller.trainList,
    ),
    DailyCalorieIntake(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => controller.currentStep.value == 0
            ? SizedBox()
            : PrimaryButtonWidget(
                buttonTextColor: CustomColors.blackColor,
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.defaultHorizontalSize,
                  vertical: Dimensions.verticalSize * 2,
                ),
                title: controller.currentStep.value == 9
                    ? "Go to home"
                    : "Next",
                onPressed: () => controller.nextStep(),
              ),
      ),

      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0,
        backgroundColor: CustomColors.blackColor,
        toolbarHeight: 100.h,
        flexibleSpace: ProgressAppBarWidget(),
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
