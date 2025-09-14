part of 'nutrition_screen.dart';

class NutritionScreenMobile extends GetView<NutritionController> {
  const NutritionScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! < 0) {
          Get.toNamed(Routes.swapScreen);
        }
      },
      child: Scaffold(
        appBar: CommonAppBar(title: "Nutrition", isBack: false),
        body: SafeArea(
          child: ListView(
            padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
            children: [
              PlanCardWidget(
                title: 'Your Breakfast Meal Plan',
                currentMeal: controller.currentBreakFast,
                onShuffle: controller.shuffleBreakFastList,
              ),
              PlanCardWidget(
                title: 'Your Lunch Meal Plan',
                currentMeal: controller.currentLunch,
                onShuffle: controller.shuffleLunchListList,
              ),
              PlanCardWidget(
                title: 'Your Dinner Meal Plan',
                currentMeal: controller.currentDinner,
                onShuffle: controller.shuffleDinnerList,
              ),
              PlanCardWidget(
                title: 'Your Snack Meal Plan',
                currentMeal: controller.currentSnacks,
                onShuffle: controller.shuffleSnacksList,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
