import 'package:tailored_eats/core/api/model/basic_success_model.dart';
import 'package:tailored_eats/core/utils/app_storage.dart';

import '../../../core/api/end_point/api_end_points.dart';
import '../../../core/api/services/api_request.dart';
import '../../../core/utils/basic_import.dart';
import '../model/goalModel.dart';

class GoalController extends GetxController {
  final addGoalController = TextEditingController();
  final editGoalController = TextEditingController();

  RxDouble dailyProgress = 0.0.obs;
  RxDouble weeklyProgress = 0.0.obs;

  RxList<Goal> dailyGoals = <Goal>[].obs;
  RxList<Goal> weeklyGoals = <Goal>[].obs;
  RxList<Goal> suggestedGoals = <Goal>[].obs;

  RxBool isGoalLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    initializeData();
  }

  // Initialize data from API
  Future<void> initializeData() async {
    await getAllGoals();
    _initializeSuggestedGoals();
  }

  // Fetch all goals from API and separate by type
  Future<void> getAllGoals() async {
    await ApiRequest.get(
      fromJson: HomeGoalModel.fromJson,
      endPoint: ApiEndPoints.getALlGoal,
      isLoading: isGoalLoading,
      onSuccess: (HomeGoalModel result) {
        dailyGoals.clear();
        weeklyGoals.clear();

        // Separate goals by type
        for (var apiGoal in result.data ?? []) {
          final goal = Goal(
            id: apiGoal.id,
            title: apiGoal.title ?? '',
            completed: apiGoal.isCompleted ?? false,
          );

          if (apiGoal.type?.toLowerCase() == 'daily') {
            dailyGoals.add(goal);
          } else if (apiGoal.type?.toLowerCase() == 'weekly') {
            weeklyGoals.add(goal);
          }
        }

        // Update progress for both lists
        _updateProgress(dailyGoals, dailyProgress);
        _updateProgress(weeklyGoals, weeklyProgress);
      },
    );
  }

  void _initializeSuggestedGoals() {
    suggestedGoals.value = [
      Goal(title: 'Read 50 pages'),
      Goal(title: 'Sleep by 11 PM'),
      Goal(title: 'Avoid sugar'),
      Goal(title: 'Drink 2L water'),
      Goal(title: 'Exercise 30 minutes'),
    ];
  }

  // Generic toggle method
  void toggleGoal(
    int index, {
    bool isWeekly = false,
    bool isSuggested = false,
  }) {
    if (isSuggested) {
      _handleSuggestedToggle(index);
    } else {
      final goalList = isWeekly ? weeklyGoals : dailyGoals;
      final progressVar = isWeekly ? weeklyProgress : dailyProgress;

      goalList[index].completed = !goalList[index].completed;
      goalList.refresh();
      _updateProgress(goalList, progressVar);
    }
  }

  void _handleSuggestedToggle(int index) {
    final goal = suggestedGoals[index];
    goal.completed = !goal.completed;

    if (goal.completed) {
      if (!dailyGoals.any((g) => g.title == goal.title)) {
        dailyGoals.add(Goal(title: goal.title, completed: true));
        // TODO: Add API call to create new goal
      }
    } else {
      dailyGoals.removeWhere((g) => g.title == goal.title);
      // TODO: Add API call to delete goal
    }

    suggestedGoals.refresh();
    dailyGoals.refresh();
    _updateProgress(dailyGoals, dailyProgress);
  }

  void _updateProgress(RxList<Goal> goalList, Rx<double> progressVar) {
    if (goalList.isEmpty) {
      progressVar.value = 0.0;
      return;
    }
    int completedCount = goalList.where((g) => g.completed).length;
    progressVar.value = completedCount / goalList.length;
  }

  // Refresh goals from API
  Future<void> refreshGoals() async {
    await getAllGoals();
  }

  // add goal process api
  RxBool isAddGoalLoading = false.obs;

  Future<BasicSuccessModel> addNewGoal() async {
    return await ApiRequest.post(
      fromJson: BasicSuccessModel.fromJson,
      endPoint: ApiEndPoints.createGoal,
      isLoading: isAddGoalLoading,
      body: {'userId': AppStorage.userId, 'title': addGoalController.text},
      showSuccessSnackBar: true,
      onSuccess: (result) {
        Get.close(1);
        addGoalController.clear();
        refreshGoals();
      },
    );
  }

  // Edit Goal
  RxBool isEditGoalLoading = false.obs;

  Future<BasicSuccessModel> editGoal(String id) async {
    return await ApiRequest.patch(
      fromJson: BasicSuccessModel.fromJson,
      endPoint: ApiEndPoints.updateGoal,
      isLoading: isEditGoalLoading,
      body: {'goalId': id, 'title': editGoalController.text},
      showSuccessSnackBar: true,
      onSuccess: (result) {
        Get.close(1);
        editGoalController.clear();
        refreshGoals();
      },
    );
  }

  // Delete Goal
  RxBool isDeleteGoalLoading = false.obs;

  Future<BasicSuccessModel> deleteGoal(String id) async {
    return await ApiRequest.delete(
      fromJson: BasicSuccessModel.fromJson,
      endPoint: ApiEndPoints.deleteGoal,
      id: id,
      isLoading: isDeleteGoalLoading,
      showSuccessSnackBar: true,
      onSuccess: (result) {
        Get.close(1);
        refreshGoals();
      },
    );
  }
}
