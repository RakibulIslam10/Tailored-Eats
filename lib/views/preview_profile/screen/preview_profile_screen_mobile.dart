part of 'preview_profile_screen.dart';

class PreviewProfileScreenMobile extends GetView<PreviewProfileController> {
  const PreviewProfileScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CommonAppBar(
        title: "Profile",
        actions: [
          PopupMenuButton<String>(
            borderRadius: BorderRadius.circular(Dimensions.radius * 2),
            color: CustomColors.grayShade,
            icon: Icon(Icons.more_vert, color: Colors.white),
            onSelected: (value) {
              if (value == "unfriend") {
                CustomSnackBar.success(
                  title: 'unfriended',
                  message: "User has been unfriended",
                );
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: "unfriend",
                child: TextWidget("Unfriend"),
                onTap: () => controller.unFriendRequest(),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Obx(
          () => controller.isLoading.value
              ? LoadingWidget()
              : Padding(
                  padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: crossStart,
                      children: [
                        ProfileImageAndButton(),
                        ConsistencyBox(),
                        TextWidget(
                          'Image in progress',
                          fontSize: Dimensions.titleLarge * 0.8,
                          fontWeight: FontWeight.bold,
                          padding: EdgeInsets.symmetric(
                            vertical: Dimensions.verticalSize * 0.8,
                          ),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: screenHeight * 0.25,
                            minHeight: screenHeight * 0.10,
                          ),
                          child: SizedBox(
                            height: screenHeight * 0.25,
                            child: ListView.builder(
                              itemCount: controller.progressImageList.length,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              cacheExtent: 500,
                              physics: const ClampingScrollPhysics(),
                              itemBuilder: (context, index) {
                                final items = controller.progressImageList;
                                return Padding(
                                  padding: Dimensions
                                      .defaultHorizontalSize
                                      .edgeRight,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      Dimensions.radius,
                                    ),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          '${ApiEndPoints.mainDomain}/${items[index].url}',
                                      fit: BoxFit.cover,
                                      width: 175.w,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
