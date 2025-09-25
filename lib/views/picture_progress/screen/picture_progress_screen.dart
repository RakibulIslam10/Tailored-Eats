import 'dart:ui';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tailored_eats/routes/routes.dart';

import '../../../core/utils/basic_import.dart';
import '../../../widgets/auth_app_bar.dart';
import '../../home/widget/d.dart';
import '../controller/picture_progress_controller.dart';

part 'picture_progress_screen_mobile.dart';
part '../widget/before_after_section_widget.dart';
part '../widget/story_section_widget.dart';

class PictureProgressScreen extends GetView<PictureProgressController> {
  const PictureProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: PictureProgressScreenMobile());
  }
}
