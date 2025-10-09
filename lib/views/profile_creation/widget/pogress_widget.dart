import '../../../core/utils/basic_import.dart';

class ProgressBar extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const ProgressBar({
    super.key,
    required this.currentStep,
    required this.totalSteps,
  });

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      minHeight: 7.h,
      borderRadius: BorderRadius.circular(Dimensions.radius),
      value: (currentStep + 1) / totalSteps,
      backgroundColor: Colors.grey[800],
      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
    );
  }
}
