part of 'picture_progress_screen.dart';

class PictureProgressScreenMobile extends GetView<PictureProgressController> {
  const PictureProgressScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CommonAppBar(title: "Progress In Picture"),
      body: ListView(
        padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
        children: [
          BeforeAfterSectionWidget(),

          StorySectionWidget()
        ],
      ),
    );
  }
}
