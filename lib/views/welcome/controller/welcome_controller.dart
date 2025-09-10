import '../../../core/utils/basic_import.dart';
class WelcomeController extends GetxController {
  // TODO: Logic
  // Use RxInt for an observable integer.
  // The .obs makes it a reactive variable.
  final RxInt selectedAge = 13.obs;

  // Method to update the selected age.
  void selectAge(int age) {
    selectedAge.value = age;
  }
}
