part of '../screen/goal_screen.dart';

enum GoalType { daily, weekly, suggested }

class GoalListWidget extends StatelessWidget {
  final String title;
  final List<Goal> goals;
  final GoalController controller;
  final GoalType type;

  const GoalListWidget({
    super.key,
    required this.title,
    required this.goals,
    required this.controller,
    this.type = GoalType.daily,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSuggested = type == GoalType.suggested;
    final bool isWeekly = type == GoalType.weekly;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ---------- Header ----------
        Space.height.v5,

        Row(
          children: [
            if (isSuggested)
              Icon(
                Icons.lightbulb_outline,
                color: Colors.amberAccent,
                size: 20.sp,
              ),
            if (isSuggested) SizedBox(width: 8.w),
            TextWidget(
              title,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
              color: CustomColors.whiteColor,
            ),
          ],
        ),
        // ---------- Goal List ----------
        Space.height.v10,

        Container(
          constraints: BoxConstraints(maxHeight: isSuggested ? 200.h : 220.h),
          decoration: BoxDecoration(
            color: CustomColors.grayShade.withOpacity(0.1),
            borderRadius: BorderRadius.circular(Dimensions.radius),
          ),
          child: goals.isEmpty
              ? _empty(isSuggested)
              : ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  shrinkWrap: true,
                  itemCount: goals.length,
                  separatorBuilder: (_, __) => Divider(
                    height: 1,
                    color: CustomColors.grayShade.withOpacity(0.2),
                    indent: 16.w,
                    endIndent: 16.w,
                  ),
                  itemBuilder: (context, index) {
                    final goal = goals[index];
                    final bool showActions = !isSuggested;

                    return ListTile(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 4.h,
                      ),

                      // Checkbox
                      leading: SizedBox(
                        height: 20.w,
                        width: 20.w,
                        child: Checkbox(
                          side: BorderSide(
                            color: CustomColors.grayShade,
                            width: 1.5,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          value: goal.completed,
                          activeColor: CustomColors.progressColor,
                          checkColor: CustomColors.blackColor,
                          onChanged: (_) => controller.toggleGoal(
                            index,
                            isWeekly: isWeekly,
                            isSuggested: isSuggested,
                          ),
                        ),
                      ),

                      title: Text(
                        goal.title,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: goal.completed
                              ? CustomColors.grayShade
                              : CustomColors.whiteColor,
                          decoration: goal.completed
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          decorationColor: CustomColors.grayShade,
                        ),
                      ),

                      // Edit / Delete buttons
                      trailing: showActions
                          ? Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.edit_outlined,
                                    color: CustomColors.progressColor,
                                    size: 20.sp,
                                  ),
                                  onPressed: () => _editDialog(index, isWeekly),
                                  padding: EdgeInsets.all(8.w),
                                  constraints: const BoxConstraints(),
                                ),
                                SizedBox(width: 4.w),
                                IconButton(
                                  icon: Icon(
                                    Icons.delete_outline,
                                    color: Colors.redAccent,
                                    size: 20.sp,
                                  ),
                                  onPressed: () =>
                                      _deleteDialog(index, isWeekly),
                                  padding: EdgeInsets.all(8.w),
                                  constraints: const BoxConstraints(),
                                ),
                              ],
                            )
                          : null,
                    );
                  },
                ),
        ),
      ],
    );
  }

  // --- Helper: Empty List UI ---
  Widget _empty(bool isSuggested) => Center(
    child: Padding(
      padding: EdgeInsets.all(24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.inbox_outlined,
            size: 48.sp,
            color: CustomColors.grayShade.withOpacity(0.5),
          ),
          SizedBox(height: 12.h),
          TextWidget(
            'No goals yet',
            fontSize: 14.sp,
            color: CustomColors.grayShade,
          ),
          SizedBox(height: 4.h),
          TextWidget(
            isSuggested
                ? 'Check back later for suggestions'
                : 'Tap + to add a new goal',
            fontSize: 12.sp,
            color: CustomColors.grayShade.withOpacity(0.7),
          ),
        ],
      ),
    ),
  );

  // --- Helper: Edit Dialog ---
  void _editDialog(int index, bool isWeekly) {
    controller.editGoalController.text = goals[index].title;
    Get.defaultDialog(
      title: "Edit Goal",
      content: Column(
        children: [
          PrimaryInputFieldWidget(
            controller: controller.editGoalController,
            hintText: goals[index].title,
          ),
          SizedBox(height: 16.h),
        ],
      ),
      actions: [
        PrimaryButtonWidget(
          title: 'Save',
          onPressed: () {
            if (controller.editGoalController.text.isNotEmpty) {
              controller.editGoal(
                index,
                controller.editGoalController.text,
                isWeekly: isWeekly,
              );
            }
            Get.back();
          },
        ),
      ],
    );
  }

  // --- Helper: Delete Dialog ---
  void _deleteDialog(int index, bool isWeekly) {
    Get.defaultDialog(
      title: "Delete Goal",
      middleText: "Are you sure?",
      actions: [
        ElevatedButton(
          onPressed: () {
            controller.deleteGoal(index, isWeekly: isWeekly);
            Get.back();
          },
          child: TextWidget("Delete"),
        ),
      ],
    );
  }
}
