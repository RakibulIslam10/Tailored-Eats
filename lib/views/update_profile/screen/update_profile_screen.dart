import '../../../core/utils/basic_import.dart';
import '../../../widgets/auth_app_bar.dart';
import '../controller/update_profile_controller.dart';

part 'update_profile_screen_mobile.dart';

class UpdateProfileScreen extends GetView<UpdateProfileController> {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: UpdateProfileScreenMobile());
  }
}
