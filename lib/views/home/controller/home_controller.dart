import '../../../core/utils/basic_import.dart';
class HomeController extends GetxController {
  final currentCalories = 2500.0.obs;

  // Method to update the calories.
  void updateCalories(double value) {
    currentCalories.value = value;
  }}
