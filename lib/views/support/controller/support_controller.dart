import 'package:tailored_eats/core/api/model/basic_success_model.dart';
import 'package:tailored_eats/core/api/services/api_request.dart';

import '../../../core/api/end_point/api_end_points.dart';
import '../../../core/utils/basic_import.dart';

class SupportController extends GetxController {
  final subjectController = TextEditingController();
  final bodyController = TextEditingController();

  RxBool isLoading = false.obs;

  Future<BasicSuccessModel> sendSupport() async {
    return await ApiRequest.post(
      fromJson: BasicSuccessModel.fromJson,
      endPoint: ApiEndPoints.support,
      isLoading: isLoading,
      body: {
        'subject': subjectController.text,
        'emailBody': subjectController.text,
      },
      showSuccessSnackBar: true,
      onSuccess: (result) => Get.close(1),
    );
  }
}
