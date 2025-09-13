import 'dart:ui';

import '../../../core/utils/basic_import.dart';
import '../../../widgets/auth_app_bar.dart';
import '../controller/home_controller.dart';

part 'home_screen_mobile.dart';
part '../widget/progress_widget.dart';
part '../widget/NutrientCard_widget.dart';
part '../widget/top_text_header_widget.dart';
part '../widget/calories_remaining_widget.dart';
part '../widget/home_app_bar_widget.dart';
part '../widget/circular_box_widget.dart';
part '../widget/study_progress_widget.dart';
part '../widget/friends_progress_widget.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: HomeScreenMobile());
  }
}
