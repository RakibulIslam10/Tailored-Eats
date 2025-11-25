import '../../../core/api/end_point/api_end_points.dart';
import '../../../core/api/services/api_request.dart';
import '../../../core/utils/basic_import.dart';
import '../model/faq_model.dart';

class FaqController extends GetxController {
  RxList<FaqData> faqList = <FaqData>[].obs;
  var expandedIndex = (-1).obs;

  void toggleExpand(int index) {
    if (expandedIndex.value == index) {
      expandedIndex.value = -1;
    } else {
      expandedIndex.value = index;
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchFaqs();
  }

  RxBool isLoading = false.obs;

  Future<FaqModel> fetchFaqs() async {
    return await ApiRequest.get(
      endPoint: ApiEndPoints.faq,
      fromJson: FaqModel.fromJson,
      onSuccess: (result) {
        faqList.assignAll(result.data);
      },
      isLoading: isLoading,
    );
  }
}
