import 'package:flutter/cupertino.dart';

import '../../../core/utils/basic_import.dart';
import '../../../widgets/auth_app_bar.dart';
import '../controller/find_frined_controller.dart';

part 'find_frined_screen_mobile.dart';

class FindFrinedScreen extends GetView<FindFrinedController> {
  const FindFrinedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: FindFrinedScreenMobile());
  }
}
