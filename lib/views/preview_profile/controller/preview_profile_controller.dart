import 'package:tailored_eats/core/api/end_point/api_end_points.dart';
import 'package:tailored_eats/core/api/model/basic_success_model.dart';
import 'package:tailored_eats/core/api/services/api_request.dart';
import 'package:tailored_eats/views/friends/controller/friends_controller.dart';
import 'package:tailored_eats/views/preview_profile/model/friend_details_model.dart';
import '../../../core/utils/basic_import.dart';

class PreviewProfileController extends GetxController {
  final List<String> items = [
    'https://picsum.photos/id/1011/600/800',
    'https://picsum.photos/id/1012/600/800',
    'https://picsum.photos/id/1013/600/800',
    'https://picsum.photos/id/1014/600/800',
    'https://picsum.photos/id/1015/600/800',
  ];

  String friendId = '';

  @override
  void onInit() {
    super.onInit();
    friendId = Get.arguments;
    getFriendDetails();
  }

  List<ProgressImages> progressImageList = [];
  List<Consistency> consistencyList = [];

  FriendDetailsModel? friendDetailsModel;

  RxBool isLoading = false.obs;

  Future<FriendDetailsModel> getFriendDetails() async {
    return await ApiRequest.get(
      fromJson: FriendDetailsModel.fromJson,
      endPoint: ApiEndPoints.friendDetails,
      id: friendId,
      isLoading: isLoading,
      onSuccess: (result) {
        friendDetailsModel = result;
        progressImageList.addAll(result.data.progressImages);
        consistencyList.addAll(result.data.details.consistency);
      },
    );
  }

  // reject api
  RxBool isLoadingDelete = false.obs;

  Future<BasicSuccessModel> rejectRequest() async {
    return await ApiRequest.patch(
      fromJson: BasicSuccessModel.fromJson,
      endPoint: ApiEndPoints.rejectRequest,
      showSuccessSnackBar: true,
      isLoading: isLoadingDelete,
      body: {"friendId": friendId},
      onSuccess: (result) {
        Get.find<FriendsController>().getAllFriendRequest();
        Get.close(1);
      },
    );
  }

  // accept api
  RxBool isLoadingAccept = false.obs;

  Future<BasicSuccessModel> acceptRequest() async {
    return await ApiRequest.patch(
      fromJson: BasicSuccessModel.fromJson,
      endPoint: ApiEndPoints.acceptRequest,
      showSuccessSnackBar: true,
      isLoading: isLoadingDelete,
      body: {"friendId": friendId},
      onSuccess: (result) {
        Get.find<FriendsController>().getAllFriendRequest();
        Get.close(1);
      },
    );
  }

  // accept api
  RxBool isLoadingUnfriend = false.obs;

  Future<BasicSuccessModel> unFriendRequest() async {
    return await ApiRequest.delete(
      fromJson: BasicSuccessModel.fromJson,
      endPoint: ApiEndPoints.unfriedRequest,
      showSuccessSnackBar: true,
      isLoading: isLoadingDelete,
      id: friendId,
      onSuccess: (result) {
        Get.find<FriendsController>().getAllFriendRequest();
        Get.close(1);
      },
    );
  }
}
