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
          await Get.find<ConsistencyController>().getUsersImageProgress();
        },
        child: Obx(
              () {
            final consistencyController = Get.find<ConsistencyController>();

            // ✅ যেকোনো একটা loading থাকলে full screen loading দেখাবে
            if (consistencyController.isGetImageLoading.value ||
                controller.isLoadingAddImag.value) {
              return const Center(child: LoadingWidget());
            }

            // ✅ Loading শেষ হলে data দেখাবে
            return ListView(
              padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
              children: const [
                BeforeAfterSectionWidget(),
                StorySectionWidget(),
              ],
            );
          },
        ),
      ),
    );
  }
}