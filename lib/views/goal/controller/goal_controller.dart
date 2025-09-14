import '../../../core/utils/basic_import.dart';
import '../model/goalModel.dart';

class GoalController extends GetxController {
  final addGoalController = TextEditingController();
  final editGoalController = TextEditingController();

  RxDouble progress = 0.0.obs;

  RxList<Goal> dailyGoals = <Goal>[].obs;
  RxList<Goal> suggestedGoals = <Goal>[].obs;

  @override
  void onInit() {
    super.onInit();
    dailyGoals.addAll([
      Goal(title: 'Drink 2L water'),
      Goal(title: 'Morning walk 30 min'),
      Goal(title: 'Meditation 10 min'),
    ]);

    suggestedGoals.addAll([
      Goal(title: 'Read 20 pages'),
      Goal(title: 'Sleep by 11 PM'),
      Goal(title: 'Avoid sugar'),
    ]);

    updateProgress();
  }

  void toggleGoal(int index) {
    dailyGoals[index].completed = !dailyGoals[index].completed;
    updateProgress();
  }

  void addSuggestedGoal(int index) {
    final goal = suggestedGoals.removeAt(index);
    dailyGoals.add(goal);
    updateProgress();
  }

  void editGoal(int index, String newTitle) {
    dailyGoals[index].title = newTitle;
    dailyGoals.refresh();
  }

  void deleteGoal(int index) {
    dailyGoals.removeAt(index);
    updateProgress();
  }

  void updateProgress() {
    if (dailyGoals.isEmpty) {
      progress.value = 0.0;
      return;
    }
    int completedCount = dailyGoals.where((g) => g.completed).length;
    progress.value = completedCount / dailyGoals.length;
  }
}
