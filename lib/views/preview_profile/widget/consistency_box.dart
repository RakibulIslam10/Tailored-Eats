import 'package:tailored_eats/core/utils/basic_import.dart';
import 'package:tailored_eats/views/preview_profile/controller/preview_profile_controller.dart';
import '../../../core/api/helpers/helpers.dart';
import '../../home/screen/home_screen.dart';

class ConsistencyBox extends GetView<PreviewProfileController> {
  const ConsistencyBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        TextWidget(
          'Consistency',
          fontWeight: FontWeight.bold,
          fontSize: Dimensions.titleLarge * 0.8,
          padding: EdgeInsetsGeometry.symmetric(
            vertical: Dimensions.verticalSize * 0.6,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.12,
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            children: List.generate(
              controller.consistencyList.length,
              (index) => StudyProgress(
                percentage: Helpers.parseDouble(
                  controller.consistencyList[index].completed,
                ),
                date: Helpers.formatDate(
                  controller.consistencyList[index].createdAt.toString(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
