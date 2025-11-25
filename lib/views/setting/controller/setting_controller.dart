import '../../../core/api/end_point/api_end_points.dart';
import '../../../core/api/model/basic_success_model.dart';
import '../../../core/api/services/api_request.dart';
import '../../../core/utils/app_storage.dart';
import '../../../core/utils/basic_import.dart';
import '../../../routes/routes.dart';

class SettingController extends GetxController {
  // Delete profile api
  RxBool isLoading = false.obs;

  Future<BasicSuccessModel> deleteAccountProcess() async {
    return await ApiRequest.delete(
      fromJson: BasicSuccessModel.fromJson,
      endPoint: ApiEndPoints.deleteProfile,
      isLoading: isLoading,
      // body: {'password': passwordController.text},
      showSuccessSnackBar: true,
      onSuccess: (result) {
        AppStorage.clear();
        Get.offAllNamed(Routes.loginScreen);
      },
    );
  }
}
