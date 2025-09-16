part of 'friends_screen.dart';

class FriendsScreenMobile extends GetView<FriendsController> {
  const FriendsScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Friends", isBack: false),
      body: SafeArea(
        child: ListView(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          physics: const BouncingScrollPhysics(),
          children: [
            TabWidget(),
            Space.height.v10,
            Obx(
              () => controller.selectedIndex.value == 0
                  ? Column(
                      crossAxisAlignment: crossStart,
                      children: [
                        Container(
                          margin: Dimensions.heightSize.edgeBottom,
                          alignment: Alignment.center,
                          height: Dimensions.inputBoxHeight * 0.7,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(
                              Dimensions.radius,
                            ),
                          ),
                          child: TextFormField(
                            style: const TextStyle(color: Colors.white),
                            // text color
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: const Icon(
                                CupertinoIcons.search,
                                color: Colors.white,
                              ),
                              hintText: 'Search...',
                              hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                              ),
                              contentPadding: EdgeInsetsGeometry.only(
                                top: Dimensions.heightSize,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: Dimensions.verticalSize * 0.8,
                          ),
                          child: Row(
                            children: [
                              TextWidget(
                                'All Friends',
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(width: 4.w),
                              TextWidget(
                                '(20)',
                                fontSize: Dimensions.titleSmall * 0.8,
                                color: CustomColors.primary,
                              ),
                            ],
                          ),
                        ),
                        AllFriendsWidget(),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: crossStart,
                      children: [
                        Container(
                          margin: Dimensions.heightSize.edgeBottom,
                          alignment: Alignment.center,
                          height: Dimensions.inputBoxHeight * 0.7,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(
                              Dimensions.radius,
                            ),
                          ),
                          child: TextFormField(
                            style: const TextStyle(color: Colors.white),
                            // text color
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: const Icon(
                                CupertinoIcons.search,
                                color: Colors.white,
                              ),
                              hintText: 'Search...',
                              hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                              ),
                              contentPadding: EdgeInsetsGeometry.only(
                                top: Dimensions.heightSize,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: Dimensions.verticalSize * 0.8,
                          ),
                          child: Wrap(
                            children: [
                              TextWidget(
                                'Friends Request',
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(width: 4.w),
                              TextWidget(
                                '(5)',
                                fontSize: Dimensions.titleSmall * 0.8,
                                color: CustomColors.primary,
                              ),
                            ],
                          ),
                        ),
                        FriendsRequestWidget(),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
