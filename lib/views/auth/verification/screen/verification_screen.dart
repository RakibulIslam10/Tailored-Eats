import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tailored_eats/widgets/auth_app_bar.dart';
import '../../../../core/utils/basic_import.dart';

import '../../../../routes/routes.dart';
import '../controller/verification_controller.dart';

part 'verification_screen_mobile.dart';

class VerificationScreen extends GetView<VerificationController> {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: VerificationScreenMobile());
  }
}
