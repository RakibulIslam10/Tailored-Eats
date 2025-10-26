part of '../screen/goal_screen.dart';

class GoalListWidget extends StatelessWidget {
  final String title;
  final List<Goal> goals;
  final bool isSuggested;
  final bool isWeekly;
  final GoalController controller;

  const GoalListWidget({
    super.key,
    required this.title,
    required this.goals,
    required this.controller,
    this.isSuggested = false,
    this.isWeekly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: Dimensions.verticalSize * 0.5,
              bottom: Dimensions.heightSize,
            ),
            child: TextWidget(
              title,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: CustomColors.grayShade.withOpacity(0.1),
                borderRadius: BorderRadius.circular(Dimensions.radius),
              ),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: goals.length,
                itemBuilder: (context, index) {
                  final goal = goals[index];
                  return ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: Dimensions.defaultHorizontalSize,
                    ),
                    leading: SizedBox(
                      height: 18.w,
                      width: 18.w,
                      child: Checkbox(
                        side: BorderSide(color: CustomColors.grayShade),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            Dimensions.radius * 0.2,
                          ),
                        ),
                        value: goal.completed,
                        activeColor: CustomColors.progressColor,
                        onChanged: (_) {
                          if (isSuggested) {
                            controller.toggleSuggestedGoal(index);
                          } else if (isWeekly) {
                            controller.toggleWeeklyGoal(index);
                          } else {
                            controller.toggleGoal(index);
                          }
                        },
                      ),
                    ),
                    title: TextWidget(
                      goal.title,
                      fontSize: Dimensions.titleSmall,
                    ),
                    trailing: (!isSuggested)
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.edit,
                                  color: CustomColors.progressColor,
                                ),
                                onPressed: () {
                                  Get.defaultDialog(
                                    contentPadding: REdgeInsets.all(
                                      Dimensions.paddingSize * 0.5,
                                    ),
                                    backgroundColor: CustomColors.blackColor,
                                    title: 'Edit Goal',
                                    titleStyle: const TextStyle(
                                      color: Colors.white,
                                    ),
                                    content: PrimaryInputFieldWidget(
                                      controller: controller.editGoalController,
                                      hintText: goal.title,
                                    ),
                                    actions: [
                                      PrimaryButtonWidget(
                                        title: 'Save',
                                        onPressed: () {
                                          if (controller
                                              .editGoalController
                                              .text
                                              .isNotEmpty) {
                                            if (isWeekly) {
                                              controller.editWeeklyGoal(
                                                index,
                                                controller
                                                    .editGoalController
                                                    .text,
                                              );
                                            } else {
                                              controller.editGoal(
                                                index,
                                                controller
                                                    .editGoalController
                                                    .text,
                                              );
                                            }
                                          }
                                          if (isWeekly) {
                                            controller.updateWeeklyProgress();
                                          } else {
                                            controller.updateProgress();
                                          }
                                          Get.back();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.redAccent,
                                ),
                                onPressed: () {
                                  if (isWeekly) {
                                    controller.deleteWeeklyGoal(index);
                                  } else {
                                    controller.deleteGoal(index);
                                  }
                                },
                              ),
                            ],
                          )
                        : null,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
