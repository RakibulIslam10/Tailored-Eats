part of 'notification_screen.dart';

class NotificationScreenMobile extends GetView<NotificationController> {
  const NotificationScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime toBDTime(String timestamp) {
      final utcTime = DateTime.parse(timestamp).toUtc();
      return utcTime.add(const Duration(hours: 6)); // BD is UTC+6
    }

    String formatTimestamp(String? timestamp) {
      if (timestamp == null || timestamp.isEmpty) {
        return DateFormat('hh:mm a').format(DateTime.now());
      }

      try {
        final bdTime = toBDTime(timestamp); // converted BD time

        final now = DateTime.now().add(const Duration(hours: 6));
        final today = DateTime(now.year, now.month, now.day);

        final messageDate = DateTime(bdTime.year, bdTime.month, bdTime.day);

        // Today → only time
        if (messageDate == today) {
          return DateFormat('hh:mm a').format(bdTime);
        }

        // Yesterday
        final yesterday = today.subtract(const Duration(days: 1));
        if (messageDate == yesterday) {
          return "Yesterday ${DateFormat('hh:mm a').format(bdTime)}";
        }

        // This week → weekday name + time
        final diff = today.difference(messageDate).inDays;
        if (diff < 7) {
          return DateFormat('EEEE hh:mm a').format(bdTime);
        }

        // Old → full date
        return DateFormat('dd MMM, hh:mm a').format(bdTime);
      } catch (e) {
        return DateFormat('hh:mm a').format(DateTime.now());
      }
    }

    return Scaffold(
      appBar: CommonAppBar(title: "Notification"),
      body: SafeArea(
        child: Obx(
          () => controller.isLoading.value
              ? LoadingWidget()
              : controller.allNotificationList.isEmpty
              ? EmptyDataWidget()
              : Column(
                  crossAxisAlignment: crossEnd,
                  children: [
                    // TextWidget(
                    //   padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
                    //   'Clear all',
                    //   color: CustomColors.primary,
                    // ),
                    // DividerWidget(),
                    Space.height.v10,
                    Expanded(
                      child: ListView.builder(
                        itemCount: controller.allNotificationList.length,
                        physics: const ClampingScrollPhysics(),
                        padding:
                            Dimensions.defaultHorizontalSize.edgeHorizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: Dimensions.heightSize.edgeBottom * 1.2,
                            padding: EdgeInsets.all(
                              Dimensions.paddingSize * 0.5,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(
                                Dimensions.radius * 0.8,
                              ),
                              border: Border.all(
                                color: CustomColors.primary,
                                width: 1.5,
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: crossCenter,
                              mainAxisAlignment: mainSpaceBet,
                              children: [
                                Expanded(
                                  child: Wrap(
                                    alignment: WrapAlignment.start,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    children: [
                                      Container(
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.black,
                                        ),
                                        padding: EdgeInsets.all(
                                          Dimensions.paddingSize * 0.26,
                                        ),
                                        child: SvgPicture.asset(
                                          Assets.icons.notification,
                                          height: 23.h,
                                          width: 23.w,
                                        ),
                                      ),
                                      TextWidget(
                                        controller
                                            .allNotificationList[index]
                                            .message,
                                        maxLines: 1,
                                        padding: Dimensions.widthSize.edgeLeft,
                                      ),
                                    ],
                                  ),
                                ),
                                TextWidget(
                                  formatTimestamp(
                                    controller
                                        .allNotificationList[index]
                                        .createdAt
                                        .toString(),
                                  ),
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
      ),
    );
  }
}
