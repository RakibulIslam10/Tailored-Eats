import '../../../core/utils/basic_import.dart';
class ProfileCreationController extends GetxController {
  RxInt currentStep = 0.obs;
  RxString gender = ''.obs;
  RxDouble weight = 50.0.obs;
  RxDouble height = 0.0.obs;
  var selectedAge = 13.obs;


  // Total number of steps
  final int totalSteps = 4;

  void nextStep() {
    if (currentStep.value < totalSteps - 1) {
      currentStep.value++;
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
    height.value = newHeight;
  }}
