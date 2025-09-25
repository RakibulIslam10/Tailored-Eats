import 'package:tailored_eats/views/friends/screen/friends_screen.dart';
import '../../../core/utils/basic_import.dart';
import '../../../widgets/auth_app_bar.dart';
import '../controller/friends_consistency_controller.dart';
part 'friends_consistency_screen_mobile.dart';

class FriendsConsistencyScreen extends GetView<FriendsConsistencyController> {
  const FriendsConsistencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: FriendsConsistencyScreenMobile());
  }
}
