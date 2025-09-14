part of 'goal_screen.dart';

class GoalScreenMobile extends GetView<GoalController> {
  const GoalScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'Yet to Achieve',
        actions: [
          IconButton(
            onPressed: () {
              Get.defaultDialog(
                contentPadding: REdgeInsets.all(Dimensions.paddingSize * 0.5),
                backgroundColor: CustomColors.blackColor,
                title: 'Add New Goal',
                titleStyle: TextStyle(color: CustomColors.whiteColor),
                content: PrimaryInputFieldWidget(
                  controller: controller.addGoalController,
                  hintText: 'Enter goal',
                ),
                actions: [
                  PrimaryButtonWidget(
                    title: 'Add',
                    onPressed: () {
                      if (controller.addGoalController.text.isNotEmpty) {
                        controller.dailyGoals.add(
                          Goal(title: controller.addGoalController.text),
                        );
                      }
                      controller.updateProgress();
                      Get.back();
                    },
                  ),
                ],
              );
            },
            icon: Icon(Icons.add, color: CustomColors.whiteColor),
          ),
        ],
      ),
      body: Obx(
        () => Padding(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          child: Column(
            children: [
              LinearProgressIndicator(
                borderRadius: BorderRadiusGeometry.circular(Dimensions.radius),
                value: controller.progress.value,
                color: Colors.blueAccent,
                backgroundColor: Colors.grey[800],
                minHeight: 8,
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: TextWidget(
                  padding: EdgeInsetsGeometry.only(
                    top: Dimensions.verticalSize,
                    bottom: Dimensions.heightSize,
                  ),
                  'Daily Goals',
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),

              Expanded(
                flex: 1,
                child: ListView.builder(
                  itemCount: controller.dailyGoals.length,
                  itemBuilder: (context, index) {
                    final goal = controller.dailyGoals[index];
                    return Card(
                      color: Colors.grey[900],
                      child: ListTile(
                        leading: Checkbox(
                          value: goal.completed,
                          onChanged: (_) => controller.toggleGoal(index),
                          activeColor: Colors.blueAccent,
                        ),
                        title: Text(
                          goal.title,
                          style: const TextStyle(color: Colors.white),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.blueAccent,
                              ),
                              onPressed: () {
                                Get.defaultDialog(
                                  actions: [
                                    PrimaryButtonWidget(
                                      title: 'Add',
                                      onPressed: () {
                                        if (controller
                                            .editGoalController
                                            .text
                                            .isNotEmpty) {
                                          controller.editGoal(
                                            index,
                                            controller.editGoalController.text,
                                          );
                                          Get.back();
                                        }
                                        controller.updateProgress();
                                        Get.back();
                                      },
                                    ),
                                  ],
                                  contentPadding: REdgeInsets.all(
                                    Dimensions.paddingSize * 0.5,
                                  ),
                                  backgroundColor: CustomColors.blackColor,
                                  title: 'Edit Goal',
                                  content: PrimaryInputFieldWidget(
                                    controller: controller.editGoalController,
                                    hintText: goal.title,
                                  ),
                                );
                              },
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.redAccent,
                              ),
                              onPressed: () => controller.deleteGoal(index),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: TextWidget(
                  'Suggested Goals for You',
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
              Expanded(
                flex: 1,
                child: ListView.builder(
                  itemCount: controller.suggestedGoals.length,
                  itemBuilder: (context, index) {
                    final goal = controller.suggestedGoals[index];
                    return Card(
                      color: Colors.grey[900],
                      child: ListTile(
                        title: Text(
                          goal.title,
                          style: const TextStyle(color: Colors.white),
                        ),
                        trailing: Checkbox(
                          value: false,
                          onChanged: (_) => controller.addSuggestedGoal(index),
                          activeColor: Colors.blueAccent,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
