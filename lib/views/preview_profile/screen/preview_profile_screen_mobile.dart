part of 'preview_profile_screen.dart';

class PreviewProfileScreenMobile extends GetView<PreviewProfileController> {
  const PreviewProfileScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: CommonAppBar(title: "Profile"),
      body: SafeArea(
        child: Padding(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ProfileImageAndButton(),
                ConsistencyBox(),
                ReusableImageProgress(title: 'Progress in Pictures', items: controller.items)


              ],
            ),
          ),
        ),
      ),
    );
  }
}
