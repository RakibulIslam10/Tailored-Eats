import 'package:tailored_eats/routes/routes.dart';
import 'package:tailored_eats/views/auth/register/controller/register_controller.dart';

import '../../../core/api/end_point/api_end_points.dart';
import '../../../core/api/services/api_request.dart';
import '../../../core/api/services/auth_services.dart';
import '../../../core/utils/app_storage.dart';
import '../../../core/utils/basic_import.dart';
import '../model/profile_creation_model.dart';

class ProfileCreationController extends GetxController {
  RxInt currentStep = 0.obs;
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
  final int totalSteps = 10;

  // Added variables for dynamic values
  RxString selectedActivityLevel = ''.obs;
  RxString selectedFoodVibe = ''.obs;
  RxString selectedMainGoal = ''.obs;
  RxString selectedResult = ''.obs;
  RxString selectedTraining = ''.obs;

  final List<Map<String, String>> activityList = [
    {
      "title": "Sedentary",
      "subtitle": "Less then 3000 steps daily",
      "iconPath": "assets/icons/Group 1000004246.svg",
      "sendBacked": "Sedentary",
    },
    {
      "title": "Lightly Active",
      "subtitle": "3000-6000 steps daily",
      "iconPath": "assets/icons/Group 1000004247.svg",
      "sendBacked": "Light",
    },
    {
      "title": "Active",
      "subtitle": "6000-10000 steps daily",
      "iconPath": "assets/icons/Group 1000004254.svg",
      "sendBacked": "Active",
    },
    {
      "title": "Very Active",
      "subtitle": "More than 10000 steps daily",
      "iconPath": "assets/icons/Group 1000004254.svg",
      "sendBacked": "Very_Active",
    },
  ];
  final List<Map<String, String>> foodVibeList = [
    {
      "title": "None",
      "subtitle": "",
      "iconPath": "assets/icons/Group 1000004258.svg",
      "sendBacked": "None",
    },
    {
      "title": "Vegetarian",
      "subtitle": "",
      "iconPath": "assets/icons/Group 1000004255.svg",
      "sendBacked": "Vegetarian",
    },
    {
      "title": "Vegan",
      "subtitle": "",
      "iconPath": "assets/icons/Group 1000004256.svg",
      "sendBacked": "Vegan",
    },
    {
      "title": "Dairy Free",
      "subtitle": "",
      "iconPath": "assets/icons/Group 1000004257.svg",
      "sendBacked": "Dairy_Free",
    },
  ];
  final List<Map<String, String>> mainGoalList = [
    {
      "title": "Lose Weight",
      "subtitle": "",
      "iconPath": "assets/icons/Gray.svg",
      "sendBacked": "Loose_Weight",
    },
    {
      "title": "Gain Weight",
      "subtitle": "",
      "iconPath": "assets/icons/Group 1000004259.svg",
      "sendBacked": "Gain_Weight",
    },
    {
      "title": "Body Re-comp (Maintain weight)",
      "subtitle": "Lose body fat whilst slowly gaining muscle",
      "iconPath": "assets/icons/image 467 (traced).svg",
      "sendBacked": "Body_Recamp",
    },
  ];
  final List<Map<String, String>> wantResultList = [
    {
      "title": "I want fast results!",
      "subtitle":
          "Achieve your goals as fast as possible using harsher methods!",
      "iconPath": "assets/icons/Group 1000004261.svg",
      "sendBacked": "Fast_As_Possible",
    },
    {
      "title": "Change my lifestyle",
      "subtitle":
          "Achieve your goals a little slower but with a much more sustainable approach.",
      "iconPath": "assets/icons/image 470 (traced).svg",
      "sendBacked": "Life_Style_Change",
    },
  ];
  final List<Map<String, String>> trainList = [
    {
      "title": "1-2 sessions / week",
      "subtitle": "Easy start, light commitment",
      "iconPath": "assets/icons/Group 1000004266.svg",
      "sendBacked": "1-2_sessions/week",
    },
    {
      "title": "3 sessions / week",
      "subtitle": "Balanced & flexible",
      "iconPath": "assets/icons/Group 1000004267.svg",
      "sendBacked": "2-3_sessions/week",
    },
    {
      "title": "4 sessions / week",
      "subtitle": "Serious progress ahead",
      "iconPath": "assets/icons/Group 1000004268.svg",
      "sendBacked": "4-5_sessions/week",
    },
    {
      "title": "5 sessions / week",
      "subtitle": "Full dedication mode",
      "iconPath": "assets/icons/Group 1000004269.svg",
      "sendBacked": "5+_sessions/week",
    },
  ];

  void previousStep() {
    if (currentStep.value > 0) {
      currentStep.value--;
    }
  }

  void setGender(String newGender) {
    gender.value = newGender;
    nextStep();
  }

  // Helper method to get sendBacked value from title
  String getSendBackedValue(List<Map<String, String>> list, String title) {
    final item = list.firstWhere(
      (item) => item["title"] == title,
      orElse: () => {"sendBacked": ""},
    );
    return item["sendBacked"] ?? "";
  }

  // void nextStep() async {
  //   // Save selected values based on current step
  //   if (currentStep.value == 4) {
  //     // Activity Level step
  //     selectedActivityLevel.value = getSendBackedValue(
  //       activityList,
  //       selectedLevel.value,
  //     );
  //   } else if (currentStep.value == 5) {
  //     // Food Vibe step
  //     selectedFoodVibe.value = getSendBackedValue(
  //       foodVibeList,
  //       selectedLevel.value,
  //     );
  //   } else if (currentStep.value == 6) {
  //     // Main Goal step
  //     selectedMainGoal.value = getSendBackedValue(
  //       mainGoalList,
  //       selectedLevel.value,
  //     );
  //   } else if (currentStep.value == 7) {
  //     // Result step
  //     selectedResult.value = getSendBackedValue(
  //       wantResultList,
  //       selectedLevel.value,
  //     );
  //   } else if (currentStep.value == 8) {
  //     // Training step
  //     selectedTraining.value = getSendBackedValue(
  //       trainList,
  //       selectedLevel.value,
  //     );
  //   }
  //
  //   // if still within normal steps (0–7)
  //   if (currentStep.value < 8) {
  //     currentStep.value++;
  //     print("STEP: ${currentStep.value}");
  //     return;
  //   }
  //
  //   // now at step 8 → call process
  //   if (currentStep.value == 8) {
  //     await profileCompleteProcess();
  //     currentStep.value = 9; // go to step 9 after
  //     print("COMPLETED & MOVED TO STEP 9");
  //     return;
  //   }
  //
  //   // if beyond profile step
  //   if (currentStep.value >= 9) {
  //     Get.toNamed(Routes.navigationScreen);
  //   }
  // }

  // Add this method in ProfileCreationController
  bool isCurrentStepValid() {
    switch (currentStep.value) {
      case 0: // Gender step
        return gender.value.isNotEmpty;

      case 1: // Age step
        return selectedAge.value >= 13;

      case 2: // Weight step
        return weight.value > 0;

      case 3: // Height step
        return height.value > 0;

      case 4: // Activity Level
        return selectedLevel.value.isNotEmpty;

      case 5: // Food Vibe
        return selectedLevel.value.isNotEmpty;

      case 6: // Main Goal
        return selectedLevel.value.isNotEmpty;

      case 7: // Result
        return selectedLevel.value.isNotEmpty;

      case 8: // Training
        return selectedLevel.value.isNotEmpty;

      case 9: // Profile complete
        return true;

      default:
        return true;
    }
  }

  void nextStep() async {
    // Validate before proceeding
    if (!isCurrentStepValid()) {
      return; // Don't proceed if validation fails
    }

    // Save selected values based on current step
    if (currentStep.value == 4) {
      selectedActivityLevel.value = getSendBackedValue(
        activityList,
        selectedLevel.value,
      );
      selectedLevel.value = ''; // Reset for next step
    } else if (currentStep.value == 5) {
      selectedFoodVibe.value = getSendBackedValue(
        foodVibeList,
        selectedLevel.value,
      );
      selectedLevel.value = ''; // Reset for next step
    } else if (currentStep.value == 6) {
      selectedMainGoal.value = getSendBackedValue(
        mainGoalList,
        selectedLevel.value,
      );
      selectedLevel.value = ''; // Reset for next step
    } else if (currentStep.value == 7) {
      selectedResult.value = getSendBackedValue(
        wantResultList,
        selectedLevel.value,
      );
      selectedLevel.value = ''; // Reset for next step
    } else if (currentStep.value == 8) {
      selectedTraining.value = getSendBackedValue(
        trainList,
        selectedLevel.value,
      );
      selectedLevel.value = ''; // Reset for next step
    }

    // if still within normal steps (0–7)
    if (currentStep.value < 8) {
      currentStep.value++;
      print("STEP: ${currentStep.value}");
      return;
    }

    // now at step 8 → call process
    if (currentStep.value == 8) {
      await profileCompleteProcess();
      currentStep.value = 9;
      print("COMPLETED & MOVED TO STEP 9");
      return;
    }

    // if beyond profile step
    if (currentStep.value >= 9) {
      Get.toNamed(Routes.navigationScreen);
    }
  }

  RxBool isLoading = false.obs;
  RxString totalCalories = ''.obs;

  Future<ProfileCreationModel> profileCompleteProcess() async {
    Map<String, dynamic> inputBody = {
      "gender": gender.value,
      "age": selectedAge.value,
      "weight": weight.value,
      "height": height.value,
      "foodVibe": selectedFoodVibe.value,
      "activityLevel": selectedActivityLevel.value,
      "mainGoal": selectedMainGoal.value,
      "result": selectedResult.value,
      "training": selectedTraining.value,

      "name": Get.find<RegisterController>().nameController.text,
      "email": Get.find<RegisterController>().emailController.text,
      "password": Get.find<RegisterController>().passwordController.text,
    };

    return await ApiRequest.patch(
      fromJson: ProfileCreationModel.fromJson,
      endPoint: ApiEndPoints.completeProfile,
      isLoading: isLoading,
      body: inputBody,
      onSuccess: (result) {
        AppStorage.save(
          token: result.data.accessToken,
          userId: result.data.user.id,
          userEmail: result.data.user.email,
          isLoggedIn: true,
        );
        totalCalories.value = result.data.totalCalorie.toString();
      },
    );
  }

  void setAge(int newAge) {
    selectedAge.value = newAge;
  }

  void setWeight(double newWeight) {
    weight.value = newWeight;
  }

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
