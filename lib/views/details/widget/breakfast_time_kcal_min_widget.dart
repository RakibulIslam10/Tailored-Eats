part of '../screen/details_screen.dart';

class BreakfastTimeKcalMinWidget extends GetView<DetailsController> {
  const BreakfastTimeKcalMinWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final meal = controller.mealDetails.value;

      if (meal == null) {
        return Center(child: CircularProgressIndicator());
      }

      return Column(
        crossAxisAlignment: crossCenter,
        children: [
          Container(
            margin: EdgeInsetsGeometry.symmetric(
              vertical: Dimensions.verticalSize * 0.8,
            ),
            padding: REdgeInsets.symmetric(
              horizontal: Dimensions.paddingSize * 0.4,
              vertical: Dimensions.verticalSize * 0.15,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadiusGeometry.circular(Dimensions.radius),
              color: Colors.white12,
            ),
            child: TextWidget(meal.mealType.capitalize ?? 'Meal'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.defaultHorizontalSize * 2,
            ),
            child: Row(
              mainAxisAlignment: mainSpaceBet,
              crossAxisAlignment: crossCenter,
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Assets.icons.calories,
                      color: CustomColors.grayShade,
                      height: 18.h,
                    ),
                    TextWidget(
                      '${meal.caloriesKcal} Kcal',
                      fontSize: Dimensions.titleSmall * 0.9,
                      color: CustomColors.grayShade,
                      padding: Dimensions.widthSize.edgeLeft * 0.5,
                    ),
                  ],
                ),
                Container(
                  height: 18.h,
                  color: CustomColors.grayShade,
                  width: 1,
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      size: Dimensions.iconSizeLarge * 0.8,
                      color: CustomColors.grayShade,
                    ),
                    TextWidget(
                      '${meal.totalTimeMinutes} min',
                      fontSize: Dimensions.titleSmall * 0.9,
                      color: CustomColors.grayShade,
                      padding: Dimensions.widthSize.edgeLeft * 0.5,
                    ),
                  ],
                ),
                Container(
                  height: 18.h,
                  color: CustomColors.grayShade,
                  width: 1,
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Icon(
                      Icons.wallet,
                      size: Dimensions.iconSizeLarge * 0.8,
                      color: CustomColors.grayShade,
                    ),
                    TextWidget(
                      '\$${meal.costGbp.toStringAsFixed(2)}',
                      fontSize: Dimensions.titleSmall * 0.9,
                      color: CustomColors.grayShade,
                      padding: Dimensions.widthSize.edgeLeft * 0.5,
                    ),
                  ],
                ),
              ],
            ),
          ),
          TextWidget(
            padding: EdgeInsetsGeometry.symmetric(
              vertical: Dimensions.verticalSize * 0.5,
              horizontal: Dimensions.defaultHorizontalSize,
            ),
            meal.description,
            color: CustomColors.grayShade,
            textAlign: TextAlign.center,
            fontSize: Dimensions.titleSmall * 0.9,
            maxLines: 3,
            textOverflow: TextOverflow.ellipsis,
          ),
        ],
      );
    });
  }
}