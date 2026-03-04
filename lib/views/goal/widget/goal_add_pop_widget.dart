part of '../screen/goal_screen.dart';

class GoalAddDialogWidget extends GetView<GoalController> {
  const GoalAddDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: CustomColors.blackColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(Dimensions.defaultHorizontalSize),
        child: Obx(
              () => Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                     "Add New Goal",
                    fontSize: Dimensions.titleLarge,
                    fontWeight: FontWeight.w600,
                    color: CustomColors.whiteColor,
                  ),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(Icons.close,
                        color: CustomColors.grayShade),
                  )
                ],
              ),

              SizedBox(height: Dimensions.verticalSize * 1.2),

              /// Goal Title Field
              Container(
                decoration: BoxDecoration(
                  color: CustomColors.primaryDark,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: CustomColors.grayShade.withOpacity(.2)),
                ),
                child: PrimaryInputFieldWidget(
                  controller: controller.addGoalController,
                  hintText: "Enter goal title",

                  fillColor: Colors.transparent,
                ),
              ),

              SizedBox(height: Dimensions.verticalSize),

              /// Type Label
              TextWidget(
                 "Goal Type",
                color: CustomColors.grayShade,
              ),

              SizedBox(height: Dimensions.verticalSize * .5),

              /// Type Selector
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.defaultHorizontalSize,
                ),
                decoration: BoxDecoration(
                  color: CustomColors.primaryDark,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: CustomColors.grayShade.withOpacity(.2),
                  ),
                ),
                child: DropdownButton<String>(
                  dropdownColor: CustomColors.blackColor,
                  value: controller.goalType.value,
                  isExpanded: true,
                  iconEnabledColor: CustomColors.whiteColor,
                  underline: const SizedBox(),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  items: controller.goalTypes
                      .map(
                        (type) => DropdownMenuItem(
                      value: type,
                      child: Text(type),
                    ),
                  )
                      .toList(),
                  onChanged: (value) {
                    controller.goalType.value = value!;
                  },
                ),
              ),

              SizedBox(height: Dimensions.verticalSize * 1.5),

              /// Button
              controller.isAddGoalLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : SizedBox(
                width: double.infinity,
                child: PrimaryButtonWidget(
                  title: "Add Goal",
                  onPressed: controller.addNewGoal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}