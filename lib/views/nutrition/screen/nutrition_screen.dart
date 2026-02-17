import 'package:tailored_eats/routes/routes.dart';
import 'package:tailored_eats/widgets/loading_widget.dart';

import '../../../core/utils/basic_import.dart';
import '../../../widgets/auth_app_bar.dart';
import '../../home/screen/home_screen.dart';
import '../controller/nutrition_controller.dart';
import '../model/meals_model.dart';

part 'nutrition_screen_mobile.dart';
part '../widget/plan_card_widget.dart';

class NutritionScreen extends GetView<NutritionController> {
  const NutritionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: NutritionScreenMobile());
  }
}
