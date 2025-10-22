import '../../../core/utils/basic_import.dart';
class FaqController extends GetxController {
  var faqList = <String>[].obs;
  var expandedIndex = (-1).obs;

  void toggleExpand(int index) {
    if (expandedIndex.value == index) {
      expandedIndex.value = -1;
    } else {
      expandedIndex.value = index;
    }
  }


  RxBool isLoading = false.obs;

// Future<FaqModel> fetchFaqs() async {
//   return await ApiRequest.get(
//     endPoint: ApiEndPoints.faqGet,
//     fromJson: FaqModel.fromJson,
//     onSuccess: (result) {
//       // result.data -> List<Datum>
//       faqList.assignAll(result.data);
//     },
//     isLoading: isLoading,
//   );
// }
}
