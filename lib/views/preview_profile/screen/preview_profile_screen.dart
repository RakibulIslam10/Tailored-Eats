import 'package:tailored_eats/views/consistency/controller/consistency_controller.dart';
import 'package:tailored_eats/views/preview_profile/widget/consistency_box.dart';
import 'package:tailored_eats/views/preview_profile/widget/image_progress.dart';
import 'package:tailored_eats/views/preview_profile/widget/profile_image_and_button.dart';
import 'package:tailored_eats/widgets/loading_widget.dart';
import 'package:tailored_eats/widgets/profile_avater_widget.dart';

import '../../../core/api/end_point/api_end_points.dart';
import '../../../core/utils/basic_import.dart';
import '../../../widgets/auth_app_bar.dart';
import '../../home/screen/home_screen.dart';
import '../controller/preview_profile_controller.dart';

part 'preview_profile_screen_mobile.dart';

class PreviewProfileScreen extends GetView<PreviewProfileController> {
  const PreviewProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: PreviewProfileScreenMobile());
  }
}
