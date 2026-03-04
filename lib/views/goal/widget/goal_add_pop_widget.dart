part of '../screen/goal_screen.dart';

class GoalAddDialogWidget extends GetView<GoalController> {
  const GoalAddDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: EdgeInsets.all(Dimensions.paddingSize * 0.4),
        child: Obx(
              () => Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// Title
              TextWidget(
                 "Add New Goal",
                fontSize: Dimensions.titleLarge,
                fontWeight: FontWeight.bold,
              ),

              SizedBox(height: Dimensions.verticalSize),

              /// Goal Title Field
              PrimaryInputFieldWidget(
                controller: controller.addGoalController,
                hintText: "Enter goal title",
              ),

              SizedBox(height: Dimensions.verticalSize),

              /// Type Dropdown
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.defaultHorizontalSize,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: CustomColors.grayShade),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButton<String>(
                  value: controller.goalType.value,
                  isExpanded: true,
                  underline: SizedBox(),
                  items: const [
                    DropdownMenuItem(
                      value: 'daily',
                      child: Text("Daily"),
                    ),
                    DropdownMenuItem(
                      value: 'weekly',
                      child: Text("Weekly"),
                    ),
                  ],
                  onChanged: (value) {
                    controller.goalType.value = value!;
                  },
                ),
              ),

              SizedBox(height: Dimensions.verticalSize * 1.5),

              /// Button
              controller.isAddGoalLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : PrimaryButtonWidget(
                onPressed: controller.addNewGoal,
                title: 'Add',
              ),
            ],
          ),
        ),
      ),
    );
  }
}