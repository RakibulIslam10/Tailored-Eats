part of '../screen/nutrition_screen.dart';


class PlanCardWidget extends StatelessWidget {
  final String title;
  final Rx<Meal?> currentMeal;
  final VoidCallback onShuffle;

  const PlanCardWidget({
    super.key,
    required this.title,
    required this.currentMeal,
    required this.onShuffle,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NutritionController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          title,
          fontWeight: FontWeight.bold,
          padding: EdgeInsets.only(
            bottom: Dimensions.heightSize,
            top: Dimensions.heightSize * 1.5,
          ),
        ),
        Obx(() {
          final meal = currentMeal.value;
          if (meal == null) {
            return Center(
              child: CircularProgressIndicator(
                color: CustomColors.primary,
              ),
            );
          }

          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            transitionBuilder: (child, animation) =>
                FadeTransition(opacity: animation, child: child),
            child: FoodCardWidget(
              key: ValueKey(meal.id),
              title: meal.mealName,
              description: meal.description,
              calories: "${meal.caloriesKcal} kcal",
              time: "${meal.totalTimeMinutes} min",
              imageUrl: controller.getRandomImage(),
              isShuffle: true,
              onShuffle: onShuffle,
              meal: meal,
              onTap: () {
                Get.toNamed(Routes.detailsScreen, arguments: meal.mealName,);
              },
            ),
          );
        }),
      ],
    );
  }
}