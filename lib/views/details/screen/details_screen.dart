import 'dart:ui';

import 'package:tailored_eats/widgets/profile_avater_widget.dart';

import '../../../core/utils/basic_import.dart';
import '../../../routes/routes.dart';
import '../../../widgets/auth_app_bar.dart';
import '../../home/screen/home_screen.dart';
import '../controller/details_controller.dart';

part 'details_screen_mobile.dart';
part '../widget/macros_widget.dart';
part '../widget/breakfast_time_kcal_min_widget.dart';
part '../widget/images_header_widget.dart';
part '../widget/Ingredients_widget.dart';
part '../widget/Instruction_widget.dart';

class DetailsScreen extends GetView<DetailsController> {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: DetailsScreenMobile());
  }
}
