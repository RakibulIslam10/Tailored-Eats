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
              Center(
                child: GestureDetector(
                  onTap: () => Get.toNamed(Routes.swapScreen),
                  child: Container(
                    margin: Dimensions.heightSize.edgeTop,
                    padding: EdgeInsetsGeometry.symmetric(
                      horizontal: Dimensions.widthSize,
                      vertical: Dimensions.heightSize * 0.5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.withAlpha(852),
                      borderRadius: BorderRadius.circular(
                        Dimensions.radius * 0.4,
                      ),
                    ),
                    child: TextWidget(
                      fontWeight: FontWeight.bold,
                      "More Breakfast Option",
                      fontSize: Dimensions.titleSmall * 0.9,
                    ),
                  ),
                ),
              ),
              PlanCardWidget(
                title: 'Your Lunch Meal Plan',
                currentMeal: controller.currentLunch,
                onShuffle: controller.shuffleLunchListList,
              ),

              Center(
                child: GestureDetector(
                  onTap: () => Get.toNamed(Routes.swapScreen),

                  child: Container(
                    margin: Dimensions.heightSize.edgeTop,
                    padding: EdgeInsetsGeometry.symmetric(
                      horizontal: Dimensions.widthSize,
                      vertical: Dimensions.heightSize * 0.5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.withAlpha(852),
                      borderRadius: BorderRadius.circular(
                        Dimensions.radius * 0.4,
                      ),
                    ),
                    child: TextWidget(
                      "More Lunch Option",
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.titleSmall,
                    ),
                  ),
                ),
              ),
              PlanCardWidget(
                title: 'Your Dinner Meal Plan',
                currentMeal: controller.currentDinner,
                onShuffle: controller.shuffleDinnerList,
              ),
              Center(
                child: GestureDetector(
                  onTap: () => Get.toNamed(Routes.swapScreen),

                  child: Container(
                    margin: Dimensions.heightSize.edgeTop,
                    padding: EdgeInsetsGeometry.symmetric(
                      horizontal: Dimensions.widthSize,
                      vertical: Dimensions.heightSize * 0.5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.withAlpha(852),
                      borderRadius: BorderRadius.circular(
                        Dimensions.radius * 0.4,
                      ),
                    ),
                    child: TextWidget(
                      "More Dinner Option",
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.titleSmall,
                    ),
                  ),
                ),
              ),
              PlanCardWidget(
                title: 'Your Snack Meal Plan',
                currentMeal: controller.currentSnacks,
                onShuffle: controller.shuffleSnacksList,
              ),
              Center(
                child: GestureDetector(
                  onTap: () => Get.toNamed(Routes.swapScreen),

                  child: Container(
                    margin: Dimensions.heightSize.edgeTop,
                    padding: EdgeInsetsGeometry.symmetric(
                      horizontal: Dimensions.widthSize,
                      vertical: Dimensions.heightSize * 0.5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.withAlpha(852),
                      borderRadius: BorderRadius.circular(
                        Dimensions.radius * 0.4,
                      ),
                    ),
                    child: TextWidget(
                      "More Snack Option",
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.titleSmall,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
