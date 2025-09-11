import '../../../core/utils/basic_import.dart';
import '../../../widgets/auth_app_bar.dart';
import '../controller/consistency_controller.dart';

part 'consistency_screen_mobile.dart';

class ConsistencyScreen extends GetView<ConsistencyController> {
  const ConsistencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: ConsistencyScreenMobile());
  }
}
