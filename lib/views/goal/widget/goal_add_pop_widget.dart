part of '../screen/goal_screen.dart';

class GoalAddPopWidget extends GetView<GoalController> {
  const GoalAddPopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _showAddDialog,
      icon: Icon(Icons.add, color: CustomColors.whiteColor),
    );
  }

  void _showAddDialog() {
    controller.addGoalController.clear();

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
            controller.addGoal(controller.addGoalController.text);
            Get.back();
          },
        ),
      ],
    );
  }
}