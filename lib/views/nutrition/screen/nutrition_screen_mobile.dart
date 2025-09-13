part of 'nutrition_screen.dart';

class NutritionScreenMobile extends GetView<NutritionController> {
  const NutritionScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Nutrition"),
      body: SafeArea(
        child: ListView.builder(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          cacheExtent: 500,
          itemCount: 10,

          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: crossStart,
              children: [
                TextWidget(
                  'Your Breakfast Meal Plan',
                  fontWeight: FontWeight.bold,
                  padding: EdgeInsetsGeometry.only(
                    top: Dimensions.heightSize,
                    bottom: Dimensions.heightSize * 0.6,
                  ),
                ),
                FoodCardWidget(
                  title: 'Delicious lobster gourmet',
                  description:
                      'Use kitchen scissors to cut through the top shell lengthwise,',
                  calories: '271 Kcal',
                  time: '15 min',
                  imageUrl:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpK1noS9RwpA351YDfG9dRCvSON-j5nZHU0A&s',
                  onShuffle: () {
                    print("Shuffle clicked!");
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
