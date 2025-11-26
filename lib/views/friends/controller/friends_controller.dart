import 'package:tailored_eats/core/api/end_point/api_end_points.dart';
import 'package:tailored_eats/core/api/services/api_request.dart';
import 'package:tailored_eats/views/friends/model/friends_model.dart';
import '../../../core/utils/basic_import.dart';

class FriendsController extends GetxController {
  final selectedIndex = 0.obs;

  void changeTab(int index) {
    selectedIndex.value = index;
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
  RxList<Friends> allFriendRequestsList = <Friends>[].obs;

  Future<FriendsModel> getAllFriendRequest() async {
    allFriendRequestsList.clear(); // Clear before loading new data

    return await ApiRequest.get(
      fromJson: FriendsModel.fromJson,
      endPoint: ApiEndPoints.getAllFriendRequest,
      isLoading: isLoadingF,
      onSuccess: (result) {
        allFriendRequestsList.addAll(result.friends);
      },
    );
  }

  // Search functionality (optional - implement if needed)
  final searchController = TextEditingController();
  RxString searchQuery = ''.obs;

  void onSearchChanged(String query) {
    searchQuery.value = query;
  }

  List<Friends> get filteredFriends {
    if (searchQuery.isEmpty) return allFriendsList;
    return allFriendsList
        .where((friend) =>
    friend.name?.toLowerCase().contains(searchQuery.value.toLowerCase()) ?? false)
        .toList();
  }

  List<Friends> get filteredRequests {
    if (searchQuery.isEmpty) return allFriendRequestsList;
    return allFriendRequestsList
        .where((friend) =>
    friend.name?.toLowerCase().contains(searchQuery.value.toLowerCase()) ?? false)
        .toList();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}