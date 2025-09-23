import 'package:tailored_eats/widgets/custom_drop_down_widget.dart';

import '../../../core/utils/basic_import.dart';
import '../../../widgets/auth_app_bar.dart';
import '../controller/report_controller.dart';

part 'report_screen_mobile.dart';

class ReportScreen extends GetView<ReportController> {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: ReportScreenMobile());
  }
}
