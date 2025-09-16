import '../../../core/utils/basic_import.dart';
import '../../../widgets/auth_app_bar.dart';
import '../../home/screen/home_screen.dart';
import '../controller/details_controller.dart';

part 'details_screen_mobile.dart';

class DetailsScreen extends GetView<DetailsController> {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: DetailsScreenMobile());
  }
}
