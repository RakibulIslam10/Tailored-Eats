part of 'friends_screen.dart';

class FriendsScreenMobile extends GetView<FriendsController> {
  const FriendsScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Friends", isBack: false),
      body: SafeArea(
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
        // Search Box
        _buildSearchBox(),
        Space.height.v15,

        // Header with count
        _buildSectionHeader('All Friends', controller.allFriendsList.length),
        Space.height.v10,

        // Friends List
        AllFriendsWidget(),
      ],
    );
  }

  // Friend Requests Tab
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
        // Search Box
        _buildSearchBox(),
        Space.height.v15,

        // Header with count
        _buildSectionHeader(
          'Friend Requests',
          controller.allFriendRequestsList.length,
        ),
        Space.height.v10,

        // Friend Requests List
        FriendsRequestWidget(),
      ],
    );
  }

  // Reusable Search Box Widget
  Widget _buildSearchBox() {
    return Container(
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
    );
  }

  // Reusable Section Header Widget
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
