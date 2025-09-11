import '../../../core/utils/basic_import.dart';
import '../../../widgets/auth_app_bar.dart';
import '../controller/friends_controller.dart';

part 'friends_screen_mobile.dart';

class FriendsScreen extends GetView<FriendsController> {
  const FriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: FriendsScreenMobile());
  }
}
