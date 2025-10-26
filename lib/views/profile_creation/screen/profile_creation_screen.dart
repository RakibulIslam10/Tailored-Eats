import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:tailored_eats/routes/routes.dart';

import '../../../core/utils/basic_import.dart';
import '../controller/profile_creation_controller.dart';
import '../widget/activity_card.dart';
import '../widget/pogress_widget.dart';

part 'profile_creation_screen_mobile.dart';
part '../widget/age_view_widget.dart';
part '../widget/weight_view_widget.dart';
part '../widget/height_view_widget.dart';
part '../widget/activity_level_widget.dart';
part '../widget/gender_view_widget.dart';
part '../widget/last_widget.dart';

class ProfileCreationScreen extends GetView<ProfileCreationController> {
  const ProfileCreationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: ProfileCreationScreenMobile());
  }
}
