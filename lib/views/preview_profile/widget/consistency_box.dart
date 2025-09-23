import 'package:tailored_eats/core/utils/basic_import.dart';
import '../../home/screen/home_screen.dart';

class ConsistencyBox extends StatelessWidget {
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
              10,
              (index) => StudyProgressWidget(percentage: 0.92, date: '27 July'),
            ),
          ),
        ),
      ],
    );
  }
}
