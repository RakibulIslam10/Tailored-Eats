import 'package:tailored_eats/core/api/end_point/api_end_points.dart';
import 'package:tailored_eats/core/api/services/api_request.dart';
import 'package:tailored_eats/views/friends/model/friends_model.dart';
import '../../../core/utils/basic_import.dart';
import '../model/friends_request_model.dart';

class FriendsController extends GetxController {
  final selectedIndex = 0.obs;
  RxBool isRequest = false.obs;

  void changeTab(int index) {
    selectedIndex.value = index;
    isRequest.value = selectedIndex.value == 1;
    print(isRequest.value);
  }

  @override
  void onInit() {
    super.onInit();

    // Load initial data
    getAllFriends();

    // Listen to tab changes
    ever(selectedIndex, (_) {
      if (selectedIndex.value == 0) {
        if (allFriendsList.isEmpty) {
          getAllFriends();
        }
      } else {
        if (allFriendRequestsList.isEmpty) {
          getAllFriendRequest();
        }
      }
    });
  }

  // Get all friends
  RxBool isLoading = false.obs;
  RxList<Friends> allFriendsList = <Friends>[].obs;

  Future<FriendsModel> getAllFriends() async {
    allFriendsList.clear(); // Clear before loading new data

    return await ApiRequest.get(
      fromJson: FriendsModel.fromJson,
      endPoint: ApiEndPoints.getAllFriends,
      isLoading: isLoading,
      onSuccess: (result) {
        allFriendsList.addAll(result.friends);
      },
    );
  }

  // Get all friend requests
  RxBool isLoadingF = false.obs;
  RxList<Requests> allFriendRequestsList = <Requests>[].obs;

  Future<FriendsRequestModel> getAllFriendRequest() async {
    allFriendRequestsList.clear();

    return await ApiRequest.get(
      fromJson: FriendsRequestModel.fromJson,
      endPoint: ApiEndPoints.getAllFriendRequest,
      isLoading: isLoadingF,
      onSuccess: (result) {
        allFriendRequestsList.addAll(result.requests);
      },
    );
  }
}
