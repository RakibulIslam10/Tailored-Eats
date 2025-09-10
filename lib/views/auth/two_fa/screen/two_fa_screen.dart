import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/utils/basic_import.dart';

import '../../../../routes/routes.dart';
import '../../../../widgets/auth_app_bar.dart';
import '../controller/two_fa_controller.dart';

part 'two_fa_screen_mobile.dart';

class TwoFaScreen extends GetView<TwoFaController> {
  const TwoFaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: TwoFaScreenMobile());
  }
}
