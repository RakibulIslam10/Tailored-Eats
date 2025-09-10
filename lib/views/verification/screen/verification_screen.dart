import '../../../core/utils/basic_import.dart';
import '../controller/verification_controller.dart';

part 'verification_screen_mobile.dart';

class VerificationScreen extends GetView<VerificationController> {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: VerificationScreenMobile());
  }
}
