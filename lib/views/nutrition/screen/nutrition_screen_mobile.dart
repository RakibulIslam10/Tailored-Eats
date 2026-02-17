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
        appBar: CommonAppBar(title: "Meals", isBack: false),
        body: SafeArea(
          child: Obx(
            () => controller.generateMealsLoading.value
                ? MealLoadingWidget()
                : ListView(
                    padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
                    children: [
                      PlanCardWidget(
                        title: 'Your Breakfast Meal Plan',
                        currentMeal: controller.currentBreakFast,
                        onShuffle: controller.shuffleBreakFastList,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () => Get.toNamed(
                            Routes.swapScreen,
                            arguments: 'Breakfast',
                          ),
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
                          onTap: () => Get.toNamed(
                            Routes.swapScreen,
                            arguments: 'Lunch',
                          ),
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
                          onTap: () => Get.toNamed(
                            Routes.swapScreen,
                            arguments: 'Dinner',
                          ),
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
                          onTap: () => Get.toNamed(
                            Routes.swapScreen,
                            arguments: 'Snacks',
                          ),
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
      ),
    );
  }
}

class MealLoadingWidget extends GetView<NutritionController> {
  const MealLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.paddingSize),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 1),
            duration: const Duration(milliseconds: 1500),
            curve: Curves.easeInOut,
            builder: (context, double value, child) {
              return Transform.rotate(
                angle: value * 0.5,
                child: Icon(
                  Icons.restaurant,
                  size: 70.h,
                  color: CustomColors.primary,
                ),
              );
            },
          ),

          Space.height.v30,

          Obx(
            () => AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: TextWidget(
                key: ValueKey(controller.currentLoadingMeal.value),
                controller.currentLoadingMeal.value.isEmpty
                    ? 'Preparing your meals...'
                    : controller.currentLoadingMeal.value,
                fontSize: Dimensions.titleLarge * 0.8,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
                color: CustomColors.primary,
              ),
            ),
          ),

          Space.height.v40,

          _buildMealProgressGrid(),

          Space.height.v30,

          Obx(() {
            final totalCompleted = [
              controller.breakFastList.isNotEmpty,
              controller.lunchList.isNotEmpty,
              controller.dinnerList.isNotEmpty,
              controller.snacksList.isNotEmpty,
            ].where((e) => e).length;

            return TextWidget(
              totalCompleted == 0
                  ? 'Getting things ready for you...'
                  : totalCompleted == 4
                  ? 'Almost there! 🎉'
                  : '$totalCompleted of 4 meals ready',
              fontSize: Dimensions.bodyMedium,
              color: Colors.grey.shade600,
              textAlign: TextAlign.center,
            );
          }),
        ],
      ),
    );
  }

  Widget _buildMealProgressGrid() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.widthSize * 0.5),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                _buildCompactMealCard(
                  icon: Icons.breakfast_dining,
                  label: 'Breakfast',
                  isLoading: controller.breakfastLoading,
                  mealList: controller.breakFastList,
                ),
                Space.height.v20,
                _buildCompactMealCard(
                  icon: Icons.dinner_dining,
                  label: 'Dinner',
                  isLoading: controller.dinnerLoading,
                  mealList: controller.dinnerList,
                ),
              ],
            ),
          ),
          Space.width.v20,
          Expanded(
            child: Column(
              children: [
                _buildCompactMealCard(
                  icon: Icons.lunch_dining,
                  label: 'Lunch',
                  isLoading: controller.lunchLoading,
                  mealList: controller.lunchList,
                ),
                Space.height.v20,
                _buildCompactMealCard(
                  icon: Icons.cookie,
                  label: 'Snacks',
                  isLoading: controller.snacksLoading,
                  mealList: controller.snacksList,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompactMealCard({
    required IconData icon,
    required String label,
    required RxBool isLoading,
    required RxList mealList,
  }) {
    return Obx(() {
      final loading = isLoading.value;
      final completed = mealList.isNotEmpty && !loading;

      return AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(
          vertical: Dimensions.paddingSize,
          horizontal: Dimensions.paddingSize * 0.8,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius * 2),
          gradient: loading
              ? LinearGradient(
                  colors: [
                    CustomColors.primary.withOpacity(0.9),
                    CustomColors.primary,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : completed
              ? LinearGradient(
                  colors: [
                    CustomColors.success.withOpacity(0.9),
                    CustomColors.success,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          color: loading || completed ? null : Colors.white,
          border: Border.all(
            color: completed
                ? CustomColors.success.withOpacity(0.3)
                : loading
                ? CustomColors.primary.withOpacity(0.3)
                : Colors.grey.shade200,
          ),
          boxShadow: [
            BoxShadow(
              color:
                  (loading
                          ? CustomColors.primary
                          : completed
                          ? CustomColors.success
                          : Colors.black)
                      .withOpacity(0.08),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: AnimatedScale(
          scale: completed ? 1.05 : 1,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// ICON AREA
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                child: completed
                    ? Container(
                        key: const ValueKey("done"),
                        padding: EdgeInsets.all(Dimensions.paddingSize * 0.6),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.check_rounded,
                          color: CustomColors.success,
                          size: Dimensions.iconSizeLarge * 1.3,
                        ),
                      )
                    : loading
                    ? SizedBox(
                        key: const ValueKey("loading"),
                        width: Dimensions.iconSizeLarge * 1.3,
                        height: Dimensions.iconSizeLarge * 1.3,
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            CustomColors.whiteColor,
                          ),
                        ),
                      )
                    : Icon(
                        icon,
                        key: const ValueKey("idle"),
                        size: Dimensions.iconSizeLarge * 1.6,
                        color: Colors.grey.shade400,
                      ),
              ),

              Space.height.v10,

              /// LABEL
              TextWidget(
                label,
                fontSize: Dimensions.titleSmall,
                fontWeight: FontWeight.w600,
                color: loading || completed
                    ? Colors.white
                    : Colors.grey.shade700,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    });
  }
}
