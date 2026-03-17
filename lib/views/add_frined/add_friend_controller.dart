import 'package:get/get.dart';

import 'package:get/get.dart';
import 'package:tailored_eats/core/api/end_point/api_end_points.dart';
import 'package:tailored_eats/core/api/model/basic_success_model.dart';
import 'package:tailored_eats/core/api/services/api_request.dart';
import 'package:tailored_eats/views/add_frined/model.dart';
import '../../../core/utils/basic_import.dart';

class AddFriendController extends GetxController {
  final isLoading = false.obs;
  final suggestions = <Suggests>[].obs;
  final sentRequests = <String>{}.obs;
  final sendingId = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchSuggestions();
  }

  // Future<void> fetchSuggestions() async {
  //   try {
  //     isLoading.value = true;
  //     final response = await ApiClient.get(ApiUrl.suggestFriends);
  //     if (response != null) {
  //       final model = SuggestFriendModel.fromJson(response);
  //       suggestions.value = model.data;
  //     }
  //   } catch (e) {
  //     CustomSnackBar.error(e.toString());
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }
  Future<void> fetchSuggestions() async {
    await ApiRequest.get(
      fromJson: SuggestFriendModel.fromJson,
      endPoint: 'friend/get-friend-suggestions',
      isLoading: isLoading,
      onSuccess: (result) {
        suggestions.assignAll(result.data);
      },
    );
  }

  Future<void> sendFriendRequest(String userId) async {
    sendingId.value = userId;
    await ApiRequest.post(
      fromJson: BasicSuccessModel.fromJson,
      endPoint: 'friend/add-friend',      // ✅ সঠিক endpoint
      isLoading: isLoading,
      body: {"receiverId": userId},         // ✅ সঠিক key
      showSuccessSnackBar: true,
      onSuccess: (_) {
        sentRequests.add(userId);
        suggestions.removeWhere((s) => s.id == userId);
        sendingId.value = '';
      },
    );
    sendingId.value = '';
  }

  // Future<void> sendFriendRequest(String userId) async {
  //   try {
  //     sendingId.value = userId;
  //     final response = await ApiRequest.get(fromJson: fromJson, endPoint: endPoint, isLoading: isLoading)
  //     if (response != null && response['success'] == true) {
  //       sentRequests.add(userId);
  //       CustomSnackBar.success(
  //         title: 'Success',
  //         message: 'Friend request sent!',
  //       );
  //     }
  //   } catch (e) {
  //     CustomSnackBar.error(e.toString());
  //   } finally {
  //     sendingId.value = '';
  //   }
  // }
}
