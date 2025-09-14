part of 'details_screen.dart';

class DetailsScreenMobile extends GetView<DetailsController> {
  const DetailsScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Details"),
      body: SafeArea(
        child: ListView(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          children: [

          
          ],
        ),
      ),
    );
  }
}
