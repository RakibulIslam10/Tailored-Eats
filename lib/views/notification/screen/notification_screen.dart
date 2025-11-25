import 'package:intl/intl.dart';
import 'package:tailored_eats/widgets/divider_widget.dart';
import 'package:tailored_eats/widgets/empty_data_widget.dart';
import 'package:tailored_eats/widgets/loading_widget.dart';

import '../../../core/utils/basic_import.dart';
import '../../../widgets/auth_app_bar.dart';
import '../controller/notification_controller.dart';

part 'notification_screen_mobile.dart';

class NotificationScreen extends GetView<NotificationController> {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: NotificationScreenMobile());
  }
}
