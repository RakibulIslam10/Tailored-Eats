part of '../screen/friends_screen.dart';

class TabWidget extends GetView<FriendsController> {
  const TabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(Dimensions.radius * 0.85),
      ),
      child: Obx(
        () => Row(
          children: [
            _buildTab(text: 'All Friends', index: 0),
            _buildTab(text: 'Friends Request', index: 1),
          ],
        ),
      ),
    );
  }

  _buildTab({required String text, required int index}) {
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.changeTab(index),
        child: Container(
          padding: Dimensions.verticalSize.edgeVertical * 0.25,
          decoration: BoxDecoration(
            color: controller.selectedIndex.value == index
                ? CustomColors.primary
                : Colors.transparent,

            borderRadius: BorderRadius.circular(Dimensions.radius * 0.85),
          ),
          alignment: Alignment.center,
          child: TextWidget(
            text,
            fontSize: Dimensions.titleSmall,
            fontWeight: FontWeight.w500,
            color: controller.selectedIndex.value == index
                ? CustomColors.blackColor
                : Colors.white,
          ),
        ),
      ),
    );
  }
}
