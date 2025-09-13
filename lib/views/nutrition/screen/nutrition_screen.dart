import '../../../core/utils/basic_import.dart';
import '../../../widgets/auth_app_bar.dart';
import '../../home/screen/home_screen.dart';
import '../controller/nutrition_controller.dart';

part 'nutrition_screen_mobile.dart';

class NutritionScreen extends GetView<NutritionController> {
  const NutritionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: NutritionScreenMobile());
  }
}
