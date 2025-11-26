part of '../screen/goal_screen.dart';

class GoalAddPopWidget extends GetView<GoalController> {
  const GoalAddPopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed:  () =>
        showModalBottomSheet(
          context: context,
          builder: (context) => BottomSheetDialogWidget(
            isLoading: controller.isAddGoalLoading,
            inputController: controller.addGoalController,
            title: "Add Goal",
            buttonTex: "Add",
            isInputField: true,
            subTitle: "Add New Goal",
            action: (){controller.addNewGoal();},
            buttonColor: CustomColors.primary,
            hintText: "Enter goal title",
          ),
        ),

      icon: Icon(Icons.add, color: CustomColors.whiteColor),
    );
  }

}
