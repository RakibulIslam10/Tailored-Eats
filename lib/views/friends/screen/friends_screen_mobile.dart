part of 'friends_screen.dart';

class FriendsScreenMobile extends GetView<FriendsController> {
  const FriendsScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Friends", isBack: false),
      body: SafeArea(
        child: RefreshIndicator(
          backgroundColor: Colors.black,
          color: CustomColors.primary,
          onRefresh: () async {
            controller.getAllFriendRequest();
            controller.getAllFriends();
          },
          child: Column(
            children: [
              // Tab Widget at the top
              Padding(
                padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
                child: TabWidget(),
              ),
              Space.height.v10,

              // Content area with scroll
              Expanded(
                child: Obx(
                  () => controller.selectedIndex.value == 0
                      ? _buildAllFriendsTab()
                      : _buildFriendRequestsTab(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // All Friends Tab
  Widget _buildAllFriendsTab() {
    if (controller.isLoading.value) {
      return const Center(child: LoadingWidget());
    }

    if (controller.allFriendsList.isEmpty) {
      return const Center(child: EmptyDataWidget());
    }

    return ListView(
      padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
      physics: const BouncingScrollPhysics(),
      children: [
        _buildSearchBox(),
        Space.height.v15,
        _buildSectionHeader('All Friends', controller.allFriendsList.length),
        Space.height.v10,

        // Friends
        AllFriendsWidget(),
      ],
    );
  }

  Widget _buildFriendRequestsTab() {
    if (controller.isLoadingF.value) {
      return const Center(child: LoadingWidget());
    }

    if (controller.allFriendRequestsList.isEmpty) {
      return const Center(child: EmptyDataWidget());
    }

    return ListView(
      padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
      physics: const BouncingScrollPhysics(),
      children: [
        _buildSearchBox(),
        Space.height.v15,
        _buildSectionHeader(
          'Friend Requests',
          controller.allFriendRequestsList.length,
        ),
        Space.height.v10,
        FriendsRequestWidget(),
      ],
    );
  }

  Widget _buildSearchBox() {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.find_frinedScreen),
      child: Container(
        height: Dimensions.inputBoxHeight * 0.7,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(Dimensions.radius),
        ),
        child: TextFormField(
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: const Icon(CupertinoIcons.search, color: Colors.white),
            hintText: 'Search...',
            hintStyle: TextStyle(
              fontSize: Dimensions.titleSmall * 1.1,
              color: Colors.white.withOpacity(0.6),
            ),
            contentPadding: EdgeInsets.symmetric(
              vertical: Dimensions.heightSize * 0.5,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, int count) {
    return Row(
      children: [
        TextWidget(title, fontWeight: FontWeight.bold),
        SizedBox(width: 4.w),
        TextWidget(
          '($count)',
          fontSize: Dimensions.titleSmall * 0.8,
          color: CustomColors.primary,
        ),
      ],
    );
  }
}
