import 'package:tailored_eats/routes/routes.dart';

import '../../../core/utils/basic_import.dart';

class ProfileCreationController extends GetxController {
  RxInt currentStep = 0.obs;

  final List<Map<String, String>> activityList = [
    {
      "title": "Sedentary",
      "subtitle": "Less then 3000 steps daily",
      "iconPath": "assets/icons/Group 1000004246.svg",
    },
    {
      "title": "Lightly Active",
      "subtitle": "3000-6000 steps daily",
      "iconPath": "assets/icons/Group 1000004247.svg",
    },
    {
      "title": "Active",
      "subtitle": "6000-10000 steps daily",
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
      "title": "None",
      "subtitle": "",
      "iconPath": "assets/icons/Group 1000004258.svg",
    },
    {
      "title": "Vegetarian",
      "subtitle": "",
      "iconPath": "assets/icons/Group 1000004255.svg",
    },
    {
      "title": "Vegan",
      "subtitle": "",
      "iconPath": "assets/icons/Group 1000004256.svg",
    },
    {
      "title": "Dairy Free",
      "subtitle": "",
      "iconPath": "assets/icons/Group 1000004257.svg",
    },
  ];
  final List<Map<String, String>> mainGoalList = [
    {
      "title": "Lose Weight",
      "subtitle": "",
      "iconPath": "assets/icons/Gray.svg",
    },
    {
      "title": "Gain Weight",
      "subtitle": "",
      "iconPath": "assets/icons/Group 1000004259.svg",
    },
    {
      "title": "Body Re-comp (Maintain weight)",
      "subtitle": "Lose body fat whilst slowly gaining muscle",
      "iconPath": "assets/icons/image 467 (traced).svg",
    },
  ];
  final List<Map<String, String>> wantResultlList = [
    {
      "title": "I want fast results!",
      "subtitle":
          "Achieve your goals as fast as possible using harsher methods!",
      "iconPath": "assets/icons/Group 1000004261.svg",
    },
    // {
    //   "title": "Slow But Sustainable",
    //   "subtitle": "",
    //   "iconPath": "assets/icons/image 469 (traced).svg",
    // },
    {
      "title": "Change my lifestyle",
      "subtitle":
          "Achieve your goals a little slower but with a much more sustainable approach.",
      "iconPath": "assets/icons/image 470 (traced).svg",
    },
  ];
  final List<Map<String, String>> trainList = [
    {
      "title": "1-2 sessions / week",
      "subtitle": "Easy start, light commitment",
      "iconPath": "assets/icons/Group 1000004266.svg",
    },
    {
      "title": "3 sessions / week",
      "subtitle": "Balanced & flexible",
      "iconPath": "assets/icons/Group 1000004267.svg",
    },
    {
      "title": "4 sessions / week",
      "subtitle": "Serious progress ahead",
      "iconPath": "assets/icons/Group 1000004268.svg",
    },
    {
      "title": "5 sessions / week",
      "subtitle": "Full dedication mode",
      "iconPath": "assets/icons/Group 1000004269.svg",
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

  var weightInKg = 0.0.obs;
  var weightInLbs = 0.0.obs;
  var weightUnit = 'KG'.obs;

  RxString selectedLevel = ''.obs;

  final int totalSteps = 9;



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

  // void setHeight(double newHeight) {
  //   if (newHeight >= minHeight && newHeight <= maxHeight) {
  //     height.value = newHeight;
  //   }
  // }

  var heightInCm = 170.0.obs;
  var heightInFeet = 5.obs;
  var heightInInches = 7.obs;
  var isHeightInCm = true.obs;

  // Set height in CM
  void setHeight(double cm) {
    heightInCm.value = cm;
    _convertCmToFeet(cm);
  }

  // Toggle between CM and FT
  void toggleHeightUnit() {
    isHeightInCm.value = !isHeightInCm.value;
  }

  // Convert CM to Feet & Inches
  void _convertCmToFeet(double cm) {
    double totalInches = cm / 2.54;
    heightInFeet.value = (totalInches / 12).floor();
    heightInInches.value = (totalInches % 12).round();
  }
}
