import '../../../core/api/end_point/api_end_points.dart';
import '../../../core/api/services/api_request.dart';
import '../../../core/utils/basic_import.dart';
import '../../terms/terms_model.dart';
class PolicyController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getTermsCondition();
  }

  RxBool isLoading = false.obs;
  String privacyDescription = '';

  Future<TermsModel> getTermsCondition() async {
    return ApiRequest.get(
      fromJson: TermsModel.fromJson,
      endPoint: ApiEndPoints.privacyPolicy,
      isLoading: isLoading,
      onSuccess: (result) => privacyDescription = result.data.description,
    );
  }}
