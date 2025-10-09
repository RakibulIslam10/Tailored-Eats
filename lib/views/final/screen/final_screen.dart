import 'package:tailored_eats/routes/routes.dart';

import '../../../core/utils/basic_import.dart';
import '../../../widgets/auth_app_bar.dart';
import '../controller/final_controller.dart';

part 'final_screen_mobile.dart';

class FinalScreen extends GetView<FinalController> {
  const FinalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: FinalScreenMobile());
  }
}



