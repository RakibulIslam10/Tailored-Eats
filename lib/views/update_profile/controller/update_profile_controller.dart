import '../../../core/utils/basic_import.dart';

class UpdateProfileController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Text Editing Controllers
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Focus Nodes
  final FocusNode firstNameFocusNode = FocusNode();
  final FocusNode lastNameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode ageFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  // Observable variables
  final RxString selectedGender = ''.obs;
  final RxBool isLoading = false.obs;

  // Gender options
  final List<String> genderOptions = ['Male', 'Female', 'Other'];

  @override
  void onInit() {
    super.onInit();
    _loadExistingData();
  }

  @override
  void onClose() {
    // Dispose controllers
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    ageController.dispose();
    passwordController.dispose();

    // Dispose focus nodes
    firstNameFocusNode.dispose();
    lastNameFocusNode.dispose();
    emailFocusNode.dispose();
    ageFocusNode.dispose();
    passwordFocusNode.dispose();

    super.onClose();
  }

  /// Load existing user data (from local storage, API, etc.)
  void _loadExistingData() {
    firstNameController.text = "John";
    lastNameController.text = "Doe";
    emailController.text = "john.doe@example.com";
    ageController.text = "25";
    selectedGender.value = "Male";
  }

  /// Validate form data
  bool _validateForm() {
    if (!formKey.currentState!.validate()) {
      return false;
    }

    // Additional validations
    if (selectedGender.value.isEmpty) {
      Get.snackbar(
        "Validation Error",
        "Please select your gender",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.7),
        colorText: Colors.white,
      );
      return false;
    }

    // Validate age
    final age = int.tryParse(ageController.text);
    if (age == null || age < 13 || age > 100) {
      Get.snackbar(
        "Validation Error",
        "Please enter a valid age (13-100)",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.7),
        colorText: Colors.white,
      );
      return false;
    }

    return true;
  }

  /// Save profile changes
  Future<void> saveChanges() async {
    if (!_validateForm()) return;
  }

  /// Clear all form data
  void clearForm() {
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    ageController.clear();
    passwordController.clear();
    selectedGender.value = '';
  }

  /// Reset form to original data
  void resetForm() {
    _loadExistingData();
  }
}
