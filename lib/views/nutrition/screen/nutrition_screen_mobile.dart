part of 'nutrition_screen.dart';

class NutritionScreenMobile extends GetView<NutritionController> {
  const NutritionScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Nutrition"),
      body: SafeArea(
        child: ListView(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          children: const [

          
          ],
        ),
      ),
    );
  }
}
