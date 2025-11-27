part of 'picture_progress_screen.dart';

class PictureProgressScreenMobile extends GetView<PictureProgressController> {
  const PictureProgressScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CommonAppBar(title: "Progress In Picture"),
      body: RefreshIndicator(
        backgroundColor: Colors.black,
        color: CustomColors.primary,

        onRefresh: () async {
          Get.find<ConsistencyController>().getUsersImageProgress();
        },
        child: Obx(
          () => Get.find<ConsistencyController>().isGetImageLoading.value
              ? LoadingWidget()
              : ListView(
                  padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
                  children: [BeforeAfterSectionWidget(), StorySectionWidget()],
                ),
        ),
      ),
    );
  }
}
