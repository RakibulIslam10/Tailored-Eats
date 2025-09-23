part of 'notification_screen.dart';

class NotificationScreenMobile extends GetView<NotificationController> {
  const NotificationScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Notification"),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: crossEnd,
          children: [
            TextWidget(
              padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
              'Clear all',
              color: CustomColors.primary,
            ),
            DividerWidget(),
            Space.height.v10,
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                physics: const ClampingScrollPhysics(),
                padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: Dimensions.heightSize.edgeBottom * 1.2,
                    padding: EdgeInsets.all(Dimensions.paddingSize * 0.5),
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
                      border: Border.all(color: CustomColors.primary, width: 1.5),
                    ),
                    child: Row(
                      mainAxisAlignment: mainSpaceBet,
                      children: [
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black,
                              ),
                              padding: EdgeInsets.all(Dimensions.paddingSize * 0.26),
                              child: SvgPicture.asset(
                                Assets.icons.notification,
                                height: 23.h,
                                width: 23.w,
                              ),
                            ),
                            TextWidget(
                              'Hey, You need to add photo',
                              maxLines: 1,
                              padding: Dimensions.widthSize.edgeLeft,
                            ),
                          ],
                        ),
                        TextWidget(
                          '9 min ago',
                          color: CustomColors.grayShade,
                          fontSize: Dimensions.titleSmall,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
