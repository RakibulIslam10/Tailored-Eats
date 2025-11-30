import 'package:tailored_eats/core/api/end_point/api_end_points.dart';
import 'package:tailored_eats/core/utils/basic_import.dart';
import 'package:tailored_eats/views/friends/controller/friends_controller.dart';
import 'package:tailored_eats/views/preview_profile/controller/preview_profile_controller.dart';
import '../../../widgets/profile_avater_widget.dart';

class ProfileImageAndButton extends GetView<PreviewProfileController> {
  const ProfileImageAndButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: ProfileAvatarWidget(
            size: 100.r,
            imageUrl: controller.progressImageList.isNotEmpty
                ? "${ApiEndPoints.baseUrl}/${controller.progressImageList.first.url}"
                : 'https://www.cornwallbusinessawards.co.uk/wp-content/uploads/2017/11/dummy450x450.jpg',
          ),
        ),
        Space.height.v20,
        TextWidget(
          controller.friendDetailsModel?.data.details.name ?? '',
          fontWeight: FontWeight.bold,
        ),
        TextWidget(
          controller.friendDetailsModel?.data.details.mainGoal ?? '',
          color: CustomColors.grayShade,
        ),
        Space.height.v20,
        if (Get.find<FriendsController>().isRequest.value)
          Row(
            mainAxisAlignment: mainSpaceBet,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () => controller.rejectRequest(),
                  child: Obx(
                    () => controller.isLoadingDelete.value
                        ? CircularProgressIndicator()
                        : Container(
                            margin: Dimensions.heightSize.edgeTop * 0.5,
                            padding: EdgeInsetsGeometry.symmetric(
                              vertical: Dimensions.verticalSize * 0.25,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadiusGeometry.circular(
                                Dimensions.radius * 0.8,
                              ),
                              border: Border.all(color: CustomColors.primary),
                            ),
                            child: Center(
                              child: TextWidget(
                                'Reject',
                                fontWeight: FontWeight.bold,
                                color: CustomColors.primary,
                              ),
                            ),
                          ),
                  ),
                ),
              ),
              Space.width.v10,
              Expanded(
                child: InkWell(
                  onTap: () => controller.acceptRequest(),
                  child: Obx(
                    () => controller.isLoadingAccept.value
                        ? CircularProgressIndicator()
                        : Container(
                            margin: Dimensions.heightSize.edgeTop * 0.5,
                            padding: EdgeInsetsGeometry.symmetric(
                              vertical: Dimensions.verticalSize * 0.25,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadiusGeometry.circular(
                                Dimensions.radius * 0.8,
                              ),
                              color: CustomColors.primary,
                              border: Border.all(color: CustomColors.primary),
                            ),
                            child: Center(
                              child: TextWidget(
                                'Accept',
                                fontWeight: FontWeight.bold,
                                color: CustomColors.blackColor,
                              ),
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ),
        Space.height.v20,
      ],
    );
  }
}
