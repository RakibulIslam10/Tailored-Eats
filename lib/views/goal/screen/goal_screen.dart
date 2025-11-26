import 'package:tailored_eats/widgets/loading_widget.dart';

import '../../../core/utils/basic_import.dart';
import '../../../widgets/auth_app_bar.dart';
import '../../../widgets/bottom_sheet_dialog.dart';
import '../controller/goal_controller.dart';
import '../model/goalModel.dart';

part 'goal_screen_mobile.dart';
part '../widget/top_progress_widget.dart';
part '../widget/goal_add_pop_widget.dart';
part '../widget/goal_list_widget.dart';

class GoalScreen extends GetView<GoalController> {
  const GoalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: GoalScreenMobile());
  }
}
