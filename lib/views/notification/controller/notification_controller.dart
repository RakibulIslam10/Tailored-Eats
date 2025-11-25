import 'package:tailored_eats/core/api/end_point/api_end_points.dart';
import 'package:tailored_eats/core/api/services/api_request.dart';
import 'package:tailored_eats/views/notification/model/notification_mdoel.dart';

import '../../../core/utils/basic_import.dart';

class NotificationController extends GetxController {
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    allNotificationList.clear();
    getAllNotification();
  }

  RxList<Notifications> allNotificationList = <Notifications>[].obs;

  Future<NotificationModel> getAllNotification() async {
    return await ApiRequest.get(
      fromJson: NotificationModel.fromJson,
      endPoint: ApiEndPoints.notifications,
      isLoading: isLoading,
      onSuccess: (result) => allNotificationList.addAll(result.notifications),
    );
  }
}
