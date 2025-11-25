import 'dart:math' as math;
import 'dart:ui';
import 'package:shadify/shadify.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tailored_eats/core/api/helpers/helpers.dart';
import 'package:tailored_eats/routes/routes.dart';
import 'package:tailored_eats/views/home/widget/shimmer_home.dart';
import 'package:tailored_eats/widgets/loading_widget.dart';
import 'package:tailored_eats/widgets/profile_avater_widget.dart';
import '../../../core/utils/basic_import.dart';
import '../controller/home_controller.dart';
import '../model/home_goal_model.dart';
import '../widget/weight_widget.dart';

part 'home_screen_mobile.dart';

part '../widget/home_app_bar_widget.dart';

part '../widget/circular_box_widget.dart';

part '../widget/top_text_header_widget.dart';

part '../widget/study_progress_widget.dart';

part '../widget/nutrition_card_widget.dart';

part '../widget/friends_progress_widget.dart';

part '../widget/progress_widget.dart';

part '../widget/calories_remaining_widget.dart';

part '../widget/food_card_widget.dart';

part '../widget/task_list_widget.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: HomeScreenMobile(),);
  }
}
