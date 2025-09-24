import 'package:tailored_eats/routes/routes.dart';

import '../../../core/utils/basic_import.dart';

class ProfileCreationController extends GetxController {
  RxInt currentStep = 0.obs;

  final List<Map<String, String>> activityList = [
    {
      "title": "Sedentary",
      "subtitle": "Less than 3000 steps daily",
      "iconPath": "assets/icons/Group 1000004246.svg",
    },
    {
      "title": "Lightly Active",
      "subtitle": "3000-6000 steps daily",
      "iconPath": "assets/icons/Group 1000004247.svg",
    },
    {
      "title": "Active",
      "subtitle": "More than 10000 steps daily",
      "iconPath": "assets/icons/Group 1000004254.svg",
    },
    {
      "title": "Very Active",
      "subtitle": "More than 10000 steps daily",
      "iconPath": "assets/icons/Group 1000004254.svg",
    },
  ];

  final List<Map<String, String>> foodVibeList = [
    {
      "title": "Sedentary",
      "subtitle": "Less than 3000 steps daily",
      "iconPath": "assets/icons/Group 1000004246.svg",
    },
    {
      "title": "Lightly Active",
      "subtitle": "3000-6000 steps daily",
      "iconPath": "assets/icons/Group 1000004247.svg",
    },
    {
      "title": "Active",
      "subtitle": "More than 10000 steps daily",
      "iconPath": "assets/icons/Group 1000004254.svg",
    },
    {
      "title": "Very Active",
      "subtitle": "More than 10000 steps daily",
      "iconPath": "assets/icons/Group 1000004254.svg",
    },
  ];



  //Selected all value saved
  RxInt currentSStep = 0.obs;
  RxList<String> selectedLevels = <String>[].obs;

  RxString gender = ''.obs;
  RxDouble weight = 50.0.obs;
  RxInt selectedAge = 13.obs;
  RxDouble height = 170.0.obs;
  final double minHeight = 100.0;
  final double maxHeight = 250.0;

  RxString selectedLevel = ''.obs;

  // Total number of steps
  final int totalSteps = 5;

  void nextStep() {
    if (currentStep.value < totalSteps - 1) {
      currentStep.value++;
    } else {
      Get.offAllNamed(Routes.navigationScreen);
    }
  }

  void previousStep() {
    if (currentStep.value > 0) {
      currentStep.value--;
    }
  }

  // Methods to update specific user data
  void setGender(String newGender) {
    gender.value = newGender;
  }

  void setAge(int newAge) {
    selectedAge.value = newAge;
  }

  void setWeight(double newWeight) {
    weight.value = newWeight;
  }

  void setHeight(double newHeight) {
    if (newHeight >= minHeight && newHeight <= maxHeight) {
      height.value = newHeight;
    }
  }
}
