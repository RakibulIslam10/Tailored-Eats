part of '../screen/details_screen.dart';

class IngredientsWidget extends GetView<DetailsController> {
  const IngredientsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final meal = controller.mealDetails.value;

      if (meal == null || meal.ingredients.isEmpty) {
        return SizedBox.shrink();
      }

      return Padding(
        padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
        child: Column(
          crossAxisAlignment: crossStart,
          children: [
            TextWidget(
              'Ingredients',
              fontWeight: FontWeight.bold,
              padding: Dimensions.verticalSize.edgeVertical * 0.6,
            ),

            // ✅ Dynamic ingredient grid
            Wrap(
              spacing: 8.w,
              runSpacing: 12.h,
              children: meal.ingredients.map((ingredient) {
                return SizedBox(
                  width: (MediaQuery.of(context).size.width - 64.w) / 5,
                  child: Column(
                    children: [
                      ProfileAvatarWidget(
                        imageUrl:
                        'https://cdn.britannica.com/36/123536-050-95CB0C6E/Variety-fruits-vegetables.jpg',
                        size: 40,
                      ),
                      Space.height.v5,
                      TextWidget(
                        ingredient.item,
                        fontSize: Dimensions.titleSmall * 0.8,
                        color: Colors.white70,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                      TextWidget(
                        ingredient.quantity,
                        fontSize: Dimensions.titleSmall * 0.7,
                        color: CustomColors.grayShade,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      );
    });
  }
}