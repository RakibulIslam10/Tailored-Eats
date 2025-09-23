import '../../../core/utils/basic_import.dart';
import '../../../widgets/auth_app_bar.dart';
import '../../../widgets/empty_data_widget.dart';
import '../../../widgets/loading_widget.dart';
import '../controller/faq_controller.dart';

part 'faq_screen_mobile.dart';

class FaqScreen extends GetView<FaqController> {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: FaqScreenMobile());
  }
}
