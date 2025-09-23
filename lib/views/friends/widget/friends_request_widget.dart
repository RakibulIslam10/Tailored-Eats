part of '../screen/friends_screen.dart';

class FriendsRequestWidget extends GetView<FriendsController> {
  const FriendsRequestWidget({super.key});

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
          onTap: () => Get.toNamed(Routes.preview_profileScreen),
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
                        radius: 25.r,
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
                          fontWeight: FontWeight.w500,

                          fontSize: Dimensions.titleSmall,
                          color: CustomColors.grayShade,
                        ),

                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              margin: Dimensions.heightSize.edgeTop * 0.5,
                              padding: EdgeInsetsGeometry.symmetric(
                                horizontal:
                                    Dimensions.defaultHorizontalSize * 1.5,
                                vertical: Dimensions.verticalSize * 0.1,
                              ),

                              decoration: BoxDecoration(
                                borderRadius: BorderRadiusGeometry.circular(
                                  Dimensions.radius * 0.8,
                                ),
                                border: Border.all(color: CustomColors.primary),
                              ),

                              child: TextWidget(
                                'Reject',
                                color: CustomColors.primary,
                                fontSize: Dimensions.titleSmall,
                              ),
                            ),
                            Space.width.v10,
                            Container(
                              margin: Dimensions.heightSize.edgeTop * 0.5,
                              padding: EdgeInsetsGeometry.symmetric(
                                horizontal:
                                    Dimensions.defaultHorizontalSize * 1.5,
                                vertical: Dimensions.verticalSize * 0.1,
                              ),

                              decoration: BoxDecoration(
                                borderRadius: BorderRadiusGeometry.circular(
                                  Dimensions.radius * 0.8,
                                ),
                                color: CustomColors.primary,
                                border: Border.all(color: CustomColors.primary),
                              ),

                              child: TextWidget(
                                'Accept',
                                fontWeight: FontWeight.w500,
                                color: CustomColors.blackColor,
                                fontSize: Dimensions.titleSmall,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
