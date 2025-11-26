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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(),
        SizedBox(height: 8.h),
        _buildGoalsList(),
      ],
    );
  }

  Widget _buildHeader() {
    if (type == GoalType.suggested) {
      return Row(
        children: [
          Icon(Icons.lightbulb_outline, color: Colors.amberAccent, size: 20.sp),
          SizedBox(width: 8.w),
          TextWidget(
            title,
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
            color: CustomColors.whiteColor,
          ),
        ],
      );
    }

    return TextWidget(
      title,
      fontWeight: FontWeight.bold,
      fontSize: 16.sp,
      color: CustomColors.whiteColor,
    );
  }

  Widget _buildGoalsList() {
    return Container(
      constraints: BoxConstraints(
        maxHeight: type == GoalType.suggested ? 200.h : 220.h,
      ),
      decoration: BoxDecoration(
        color: CustomColors.grayShade.withOpacity(0.1),
        borderRadius: BorderRadius.circular(Dimensions.radius),
      ),
      child: goals.isEmpty
          ? _buildEmptyState()
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
                return _buildGoalItem(goal, index);
              },
            ),
    );
  }

  Widget _buildGoalItem(Goal goal, int index) {
    final bool showActions = type != GoalType.suggested;

    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      leading: _buildCheckbox(goal, index),
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
      trailing: showActions ? _buildActionButtons(index) : null,
    );
  }

  Widget _buildCheckbox(Goal goal, int index) {
    return SizedBox(
      height: 20.w,
      width: 20.w,
      child: Checkbox(
        side: BorderSide(color: CustomColors.grayShade, width: 1.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
        value: goal.completed,
        activeColor: CustomColors.progressColor,
        checkColor: CustomColors.blackColor,
        onChanged: (_) => _handleToggle(index),
      ),
    );
  }

  void _handleToggle(int index) {
    controller.toggleGoal(
      index,
      isWeekly: type == GoalType.weekly,
      isSuggested: type == GoalType.suggested,
    );
  }

  Widget _buildActionButtons(int index) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(
            Icons.edit_outlined,
            color: CustomColors.progressColor,
            size: 20.sp,
          ),
          onPressed: () => _showEditDialog(index),
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
          onPressed: () => _showDeleteConfirmation(index),
          padding: EdgeInsets.all(8.w),
          constraints: const BoxConstraints(),
        ),
      ],
    );
  }

  void _showEditDialog(int index) {
    controller.editGoalController.text = goals[index].title;

    Get.defaultDialog(
      contentPadding: EdgeInsets.all(20.w),
      backgroundColor: CustomColors.blackColor,
      title: 'Edit Goal',
      titleStyle: TextStyle(
        color: Colors.white,
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PrimaryInputFieldWidget(
            controller: controller.editGoalController,
            hintText: goals[index].title,
          ),
          SizedBox(height: 16.h),
        ],
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => Get.back(),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: CustomColors.grayShade),
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: TextWidget('Cancel', color: CustomColors.whiteColor),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: PrimaryButtonWidget(
                title: 'Save',
                onPressed: () {
                  if (controller.editGoalController.text.isNotEmpty) {
                    controller.editGoal(
                      index,
                      controller.editGoalController.text,
                      isWeekly: type == GoalType.weekly,
                    );
                  }
                  Get.back();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _showDeleteConfirmation(int index) {
    Get.defaultDialog(
      contentPadding: EdgeInsets.all(20.w),
      backgroundColor: CustomColors.blackColor,
      title: 'Delete Goal',
      titleStyle: TextStyle(
        color: Colors.white,
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
      ),
      middleText: 'Are you sure you want to delete this goal?',
      middleTextStyle: TextStyle(
        color: CustomColors.grayShade,
        fontSize: 14.sp,
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => Get.back(),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: CustomColors.grayShade),
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: TextWidget('Cancel', color: CustomColors.whiteColor),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  controller.deleteGoal(
                    index,
                    isWeekly: type == GoalType.weekly,
                  );
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: TextWidget('Delete', color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Center(
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
              type == GoalType.suggested
                  ? 'Check back later for suggestions'
                  : 'Tap + to add a new goal',
              fontSize: 12.sp,
              color: CustomColors.grayShade.withOpacity(0.7),
            ),
          ],
        ),
      ),
    );
  }
}
