import 'package:tailored_eats/core/api/model/basic_success_model.dart';
import 'package:tailored_eats/views/home/controller/home_controller.dart';
import 'package:tailored_eats/views/profile/controller/profile_controller.dart';

import '../../../core/api/end_point/api_end_points.dart';
import '../../../core/api/services/api_request.dart';
import '../../../core/utils/basic_import.dart';
import '../../../routes/routes.dart';

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

  @override
  void onInit() {
    super.onInit();
    firstNameController.text =
        Get.find<HomeController>().macrosModel?.data.name ?? '';
    // lastNameController.text =   Get.find<HomeController>().macrosModel?.data.name ?? '';
    emailController.text =
        Get.find<HomeController>().macrosModel?.data.email ?? '';
    // ageController.text =   Get.find<HomeController>().macrosModel?.data.name ?? '';
    passwordController.text = '*********';
  }

  // Gender options
  final List<String> genderOptions = ['Male', 'Female', 'Other'];

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

  RxBool isLoadingUpdate = false.obs;

  Future<BasicSuccessModel> updateProfileInfo() async {
    return await ApiRequest.patch(
      fromJson: BasicSuccessModel.fromJson,
      endPoint: ApiEndPoints.updateProfile,
      isLoading: isLoadingUpdate,
      body: {
        "firstName": firstNameController.text.trim(),
        "lastName": lastNameController.text.trim(),
        "email": emailController.text.trim(),
        "gender": selectedGender.value,
        "age": ageController.text.trim(),
        "password": passwordController.text.trim(),
      },
      showSuccessSnackBar: true,
      onSuccess: (result) => Get.offAllNamed(Routes.navigationScreen),
    );
  }

  Future<void> saveChanges() async {
    if (!_validateForm()) return;
  }
}
