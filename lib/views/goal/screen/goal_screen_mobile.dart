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
      body: RefreshIndicator(
        backgroundColor: Colors.white,
        color: CustomColors.primary,
        onRefresh: () async => await controller.refreshGoals(),
        child: Obx(
          () => controller.isGoalLoading.value
              ? LoadingWidget()
              : ListView(
                  padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
                  children: [
                    TopProgressWidget(value: controller.dailyProgress.value),
                    GoalListWidget(
                      title: "Daily Goals",
                      goals: controller.dailyGoals,
                      controller: controller,
                      type: GoalType.daily,
                    ),
                    Space.height.v5,
                    TopProgressWidget(value: controller.weeklyProgress.value),
                    GoalListWidget(
                      title: "Weekly Goals",
                      goals: controller.weeklyGoals,
                      controller: controller,
                      type: GoalType.weekly,
                    ),
                    GoalListWidget(
                      title: "Suggested Goals for You",
                      goals: controller.suggestedGoals,
                      controller: controller,
                      type: GoalType.suggested,
                    ),
                    Space.height.v40,
                  ],
                ),
        ),
      ),
    );
  }
}
