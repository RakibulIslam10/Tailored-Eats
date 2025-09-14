part of '../screen/goal_screen.dart';

class GoalAddPopWidget extends GetView<GoalController> {
  const GoalAddPopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return   IconButton(
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
    );
  }
}
