part of 'goal_screen.dart';

class GoalScreenMobile extends GetView<GoalController> {
  const GoalScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'Yet to Achieve',
        isBack: false,
        actions: [GoalAddPopWidget()],
      ),
      body: Obx(
        () => Padding(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          child: Column(
            children: [
              Space.height.v10,
// Daily Goals
              TopProgressWidget(value: controller.dailyProgress.value),
              GoalListWidget(
                title: "Daily Goals",
                goals: controller.dailyGoals,
                controller: controller,
                type: GoalType.daily, // Clean type definition
              ),

// Weekly Goals
              TopProgressWidget(value: controller.weeklyProgress.value),
              GoalListWidget(
                title: "Weekly Goals",
                goals: controller.weeklyGoals,
                controller: controller,
                type: GoalType.weekly,
              ),

// Suggested Goals
              GoalListWidget(
                title: "Suggested Goals for You",
                goals: controller.suggestedGoals,
                controller: controller,
                type: GoalType.suggested,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
