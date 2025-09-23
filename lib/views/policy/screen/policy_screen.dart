import '../../../core/utils/basic_import.dart';
import '../../../widgets/auth_app_bar.dart';
import '../controller/policy_controller.dart';

part 'policy_screen_mobile.dart';

class PolicyScreen extends GetView<PolicyController> {
  const PolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: PolicyScreenMobile());
  }
}
