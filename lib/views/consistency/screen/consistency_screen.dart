import 'package:fl_chart/fl_chart.dart';

import '../../../core/utils/basic_import.dart';
import '../../../widgets/auth_app_bar.dart';
import '../../home/screen/home_screen.dart';
import '../controller/consistency_controller.dart';
import 'package:fl_chart/fl_chart.dart';

part 'consistency_screen_mobile.dart';
part '../widget/weight_chart_widget.dart';

class ConsistencyScreen extends GetView<ConsistencyController> {
  const ConsistencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(mobile: ConsistencyScreenMobile());
  }
}
