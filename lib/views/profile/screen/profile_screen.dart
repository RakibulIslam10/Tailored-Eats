import 'package:tailored_eats/widgets/profile_avater_widget.dart';

import '../../../core/utils/basic_import.dart';
import '../../../widgets/auth_app_bar.dart';
import '../controller/profile_controller.dart';

part 'profile_screen_mobile.dart';
part '../widget/profile_header_widget.dart';
part '../widget/info_card_widget.dart';
part '../widget/menu_items_card_widget.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: ProfileScreenMobile());
  }
}
