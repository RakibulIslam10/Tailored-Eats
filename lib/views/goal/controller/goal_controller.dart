import '../../../core/utils/basic_import.dart';
class DailyGoal {
  String title;
  bool completed;

  DailyGoal({required this.title, this.completed = false});
}
class GoalController extends GetxController {
// Daily goals
  var dailyGoals = <DailyGoal>[
    DailyGoal(title: 'Steps Target - 9000 Steps', completed: true),
    DailyGoal(title: 'Drink 2L Water', completed: true),
    DailyGoal(title: '20 Min exercise', completed: true),
    DailyGoal(title: '30 Squats'),
    DailyGoal(title: '10 min sun bath'),
    DailyGoal(title: '10 min meditation'),
  ].obs;

  // Suggested goals (not yet added)
  var suggestedGoals = <DailyGoal>[
    DailyGoal(title: 'Steps Target - 9000 Steps'),
    DailyGoal(title: 'Drink 2L Water'),
    DailyGoal(title: '20 Min exercise'),
  ].obs;

  // Toggle completion
  void toggleGoal(int index) {
    dailyGoals[index].completed = !dailyGoals[index].completed;
    dailyGoals.refresh();
  }

  // Delete goal
  void deleteGoal(int index) {
    dailyGoals.removeAt(index);
  }

  // Edit goal
  void editGoal(int index, String newTitle) {
    dailyGoals[index].title = newTitle;
    dailyGoals.refresh();
  }

  // Add suggested goal
  void addSuggestedGoal(int index) {
    final goal = suggestedGoals[index];
    dailyGoals.add(DailyGoal(title: goal.title));
  }

  // Compute progress percentage
  double get progress {
    if (dailyGoals.isEmpty) return 0.0;
    final completedCount = dailyGoals.where((g) => g.completed).length;
    return completedCount / dailyGoals.length;
  }}
