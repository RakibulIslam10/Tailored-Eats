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
    _initializeData();
  }

  @override
  void onClose() {
    addGoalController.dispose();
    editGoalController.dispose();
    super.onClose();
  }

  // Initialize data from API
  Future<void> _initializeData() async {
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
        // Clear existing goals
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

      // TODO: Add API call to update goal completion status
      // updateGoalStatus(goalList[index].id, goalList[index].completed);
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

  // Generic edit method
  void editGoal(int index, String newTitle, {bool isWeekly = false}) {
    final goalList = isWeekly ? weeklyGoals : dailyGoals;
    goalList[index].title = newTitle;
    goalList.refresh();

    // TODO: Add API call to update goal title
    // updateGoalTitle(goalList[index].id, newTitle);
  }

  // Generic delete method
  void deleteGoal(int index, {bool isWeekly = false}) {
    final goalList = isWeekly ? weeklyGoals : dailyGoals;
    final progressVar = isWeekly ? weeklyProgress : dailyProgress;

    // TODO: Add API call to delete goal
    // deleteGoalFromAPI(goalList[index].id);

    goalList.removeAt(index);
    _updateProgress(goalList, progressVar);
  }

  // Generic add method
  void addGoal(String title, {bool isWeekly = false}) {
    if (title.isEmpty) return;

    final goalList = isWeekly ? weeklyGoals : dailyGoals;
    final progressVar = isWeekly ? weeklyProgress : dailyProgress;

    goalList.add(Goal(title: title));
    _updateProgress(goalList, progressVar);
    addGoalController.clear();

    // TODO: Add API call to create new goal
    // createGoalInAPI(title, isWeekly ? 'Weekly' : 'Daily');
  }

  // Generic progress calculation
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
}
