import 'package:tailored_eats/core/api/end_point/api_end_points.dart';
import 'package:tailored_eats/core/api/services/api_request.dart';
import 'package:tailored_eats/views/terms/terms_model.dart';

import '../../../core/utils/basic_import.dart';

class TermsController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getTermsCondition();
  }

  RxBool isLoading = false.obs;
  String termsDescription = '';

  Future<TermsModel> getTermsCondition() async {
    return ApiRequest.get(
      fromJson: TermsModel.fromJson,
      endPoint: ApiEndPoints.terms,
      isLoading: isLoading,
      onSuccess: (result) => termsDescription = result.data.description,
    );
  }
}
