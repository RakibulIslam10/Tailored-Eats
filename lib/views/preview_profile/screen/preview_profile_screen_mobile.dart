part of 'preview_profile_screen.dart';

class PreviewProfileScreenMobile extends GetView<PreviewProfileController> {
  const PreviewProfileScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
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
              const PopupMenuItem<String>(
                value: "unfriend",
                child: TextWidget("Unfriend"),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ProfileImageAndButton(),
                ConsistencyBox(),
                ReusableImageProgress(
                  title: 'Progress in Pictures',
                  items: Get.find<ConsistencyController>().imageProgressList,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
