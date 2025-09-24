import '../../../core/utils/basic_import.dart';
import '../../../routes/routes.dart';
import '../../../widgets/auth_app_bar.dart';
import '../../home/screen/home_screen.dart';
import '../controller/swap_controller.dart';

part 'swap_screen_mobile.dart';
part '../widget/sort_by_widget.dart';
part '../widget/price_filter_widget.dart';
part '../widget/prep_time_widget.dart';
part '../widget/macros_section_widget.dart';
part '../widget/button_section_widget.dart';

class SwapScreen extends GetView<SwapController> {
  const SwapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: SwapScreenMobile());
  }
}
