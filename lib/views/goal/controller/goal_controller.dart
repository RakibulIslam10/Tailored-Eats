import '../../../core/utils/basic_import.dart';
import '../model/goalModel.dart';

class GoalController extends GetxController {
  final addGoalController = TextEditingController();
  final editGoalController = TextEditingController();
  RxDouble progress = 0.0.obs;
  RxDouble weeklyProgress = 0.0.obs;

  RxList<Goal> dailyGoals = <Goal>[].obs;
  RxList<Goal> weeklyGoals = <Goal>[].obs;
  RxList<Goal> suggestedGoals = <Goal>[].obs;

  @override
  void onInit() {
    super.onInit();
    dailyGoals.addAll([
      Goal(title: 'Drink 2L water'),
      Goal(title: 'Morning walk 30 min'),
      Goal(title: 'Meditation 10 min'),
    ]);

    weeklyGoals.addAll([
      Goal(title: 'Drink 10L water'),
      Goal(title: 'Morning walk 100 min'),
      Goal(title: 'Meditation 100 min'),
    ]);

    suggestedGoals.addAll([
      Goal(title: 'Read 50 pages'),
      Goal(title: 'Sleep by 11 PM'),
      Goal(title: 'Avoid sugar'),
    ]);

    updateProgress();
    updateWeeklyProgress();
  }

  /// Daily Goal logic
  void toggleGoal(int index) {
    dailyGoals[index].completed = !dailyGoals[index].completed;
    dailyGoals.refresh();
    updateProgress();
    update();
  }

  void editGoal(int index, String newTitle) {
    dailyGoals[index].title = newTitle;
    dailyGoals.refresh();
    update();
  }

  void deleteGoal(int index) {
    dailyGoals.removeAt(index);
    updateProgress();
    update();
  }

  void updateProgress() {
    if (dailyGoals.isEmpty) {
      progress.value = 0.0;
      return;
    }
    int completedCount = dailyGoals.where((g) => g.completed).length;
    progress.value = completedCount / dailyGoals.length;
  }

  /// Suggested Goal logic
  void toggleSuggestedGoal(int index) {
    final goal = suggestedGoals[index];
    goal.completed = !goal.completed;

    if (goal.completed) {
      if (!dailyGoals.any((g) => g.title == goal.title)) {
        dailyGoals.add(Goal(title: goal.title, completed: true));
      }
    } else {
      dailyGoals.removeWhere((g) => g.title == goal.title);
    }

    suggestedGoals.refresh();
    dailyGoals.refresh();
    updateProgress();
  }

  /// Weekly Goal logic
  void toggleWeeklyGoal(int index) {
    weeklyGoals[index].completed = !weeklyGoals[index].completed;
    weeklyGoals.refresh();
    updateWeeklyProgress();
  }

  void editWeeklyGoal(int index, String newTitle) {
    weeklyGoals[index].title = newTitle;
    weeklyGoals.refresh();
    updateWeeklyProgress();
  }

  void deleteWeeklyGoal(int index) {
    weeklyGoals.removeAt(index);
    updateWeeklyProgress();
  }

  void updateWeeklyProgress() {
    if (weeklyGoals.isEmpty) {
      weeklyProgress.value = 0.0;
      return;
    }
    int completedCount = weeklyGoals.where((g) => g.completed).length;
    weeklyProgress.value = completedCount / weeklyGoals.length;
  }
}
