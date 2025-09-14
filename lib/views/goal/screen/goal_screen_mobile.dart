part of 'goal_screen.dart';

class GoalScreenMobile extends GetView<GoalController> {
  const GoalScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'Yet to Achieve',
        actions: [GoalAddPopWidget()],
      ),
      body: Obx(
        () => Padding(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          child: Column(
            children: [
              Space.height.v10,
              TopProgressWidget(value: controller.progress.value),
              GoalListWidget(
                title: "Daily Goals",
                goals: controller.dailyGoals,
                controller: controller,
              ),
              GoalListWidget(
                title: "Suggested Goals for You",
                goals: controller.suggestedGoals,
                controller: controller,
                isSuggested: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
