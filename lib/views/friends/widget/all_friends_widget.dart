part of '../screen/friends_screen.dart';

class AllFriendsWidget extends GetView<FriendsController> {
  const AllFriendsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      cacheExtent: 800,
      shrinkWrap: true,
      itemCount: 21,
      itemBuilder: (context, index) {
        return InkWell(
          borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
          onTap: () => Get.toNamed(Routes.previewProfileScreen),
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
                          'https://i.pravatar.cc/150?u=$index',
                        ),
                        backgroundColor: Colors.grey.shade200,
                      ),
                    ),
                    SizedBox(width: Dimensions.widthSize),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          'Friend $index',
                          fontWeight: FontWeight.bold,
                        ),
                        TextWidget(
                          'Loose weight',
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
                        value: 0.92,
                        backgroundColor: CustomColors.grayShade,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          CustomColors.primary,
                        ),
                        strokeWidth: 2.5,
                      ),
                      TextWidget(
                        '${(0.92 * 100).toInt()}%',
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
