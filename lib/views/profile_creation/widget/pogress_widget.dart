import '../../../core/utils/basic_import.dart';

class ProgressBar extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const ProgressBar({
    Key? key,
    required this.currentStep,
    required this.totalSteps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: (currentStep + 1) / totalSteps,
      backgroundColor: Colors.grey[800],
      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
    );
  }
}
