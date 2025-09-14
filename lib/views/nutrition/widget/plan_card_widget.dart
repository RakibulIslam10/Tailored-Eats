part of '../screen/nutrition_screen.dart';

class PlanCardWidget extends StatelessWidget {
  final String title;
  final RxMap<String, String> currentMeal;
  final VoidCallback onShuffle;

  const PlanCardWidget({
    super.key,
    required this.title,
    required this.currentMeal,
    required this.onShuffle,
  });

  @override
  Widget build(BuildContext context) {
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
        Obx(
          () => AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            transitionBuilder: (child, animation) =>
                FadeTransition(opacity: animation, child: child),
            child: FoodCardWidget(
              key: ValueKey(currentMeal["title"]),
              title: currentMeal["title"] ?? "",
              description: currentMeal["description"] ?? "",
              calories: currentMeal["calories"] ?? "",
              time: currentMeal["time"] ?? "",
              imageUrl: currentMeal["imageUrl"] ?? "",
              isShuffle: true,
              onShuffle: onShuffle,
              onTap: () {
                Get.toNamed(Routes.detailsScreen);
              },
            ),
          ),
        ),
      ],
    );
  }
}
