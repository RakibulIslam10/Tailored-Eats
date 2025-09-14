import '../../../core/utils/basic_import.dart';
import '../../../widgets/auth_app_bar.dart';
import '../controller/goal_controller.dart';
import '../model/goalModel.dart';

part 'goal_screen_mobile.dart';

class GoalScreen extends GetView<GoalController> {
  const GoalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: GoalScreenMobile());
  }
}
