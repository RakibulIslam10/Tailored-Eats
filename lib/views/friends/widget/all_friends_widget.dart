part of '../screen/friends_screen.dart';

class AllFriendsWidget extends GetView<FriendsController> {
  const AllFriendsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      cacheExtent: 800,
      shrinkWrap: true,
      itemCount: controller.allFriendsList.length,
      itemBuilder: (context, index) {
        return InkWell(
          borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
          onTap: () => Get.toNamed(Routes.previewProfileScreen,arguments: controller.allFriendsList[index].friendId),
          child: Container(
            margin: EdgeInsets.only(bottom: Dimensions.verticalSize * 0.5),
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.defaultHorizontalSize,
              vertical: Dimensions.verticalSize * 0.3,
            ),
            decoration: BoxDecoration(
              color: CustomColors.whiteColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(Dimensions.radius),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: CustomColors.primary,
                          width: 1.5,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 20.r,
                        backgroundImage: CachedNetworkImageProvider(
                          controller.allFriendsList[index].image ??
                              'https://www.cornwallbusinessawards.co.uk/wp-content/uploads/2017/11/dummy450x450.jpg',
                        ),
                        backgroundColor: Colors.grey.shade200,
                      ),
                    ),
                    SizedBox(width: Dimensions.widthSize),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          controller.allFriendsList[index].name,
                          fontWeight: FontWeight.bold,
                        ),
                        TextWidget(
                          controller.allFriendsList[index].mainGoal,
                          fontSize: Dimensions.titleSmall,
                          color: CustomColors.grayShade,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 45.w,
                  height: 45.w,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircularProgressIndicator(
                        value:
                            (controller.allFriendsList[index].percentage / 100)
                                .clamp(0.0, 1.0),
                        backgroundColor: CustomColors.grayShade,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          CustomColors.primary,
                        ),
                        strokeWidth: 2.5,
                      ),
                      TextWidget(
                        '${controller.allFriendsList[index].percentage.toString()}%',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
