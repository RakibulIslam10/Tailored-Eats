part of 'details_screen.dart';

class DetailsScreenMobile extends GetView<DetailsController> {
  const DetailsScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: PrimaryButtonWidget(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.defaultHorizontalSize,
          vertical: Dimensions.verticalSize,
        ),
        title: 'I Ate this',
        onPressed: () {},
      ),
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: CommonAppBar(title: "Menu Details"),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          ImagesHeaderWidget(),
          BreakfastTimeKcalMinWidget(),
          MacrosWidget(),
          IngredientsWidget(),
          InstructionWidget(),
          Space.height.v100,
        ],
      ),
    );
  }
}
