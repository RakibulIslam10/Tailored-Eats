part of '../screen/details_screen.dart';

class BreakfastTimeKcalMinWidget extends GetView<DetailsController> {
  const BreakfastTimeKcalMinWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
          child: TextWidget('Breakfast'),
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
                    '271 Kcal',
                    fontSize: Dimensions.titleSmall * 0.9,
                    color: CustomColors.grayShade,
                    padding: Dimensions.widthSize.edgeLeft * 0.5,
                  ),
                ],
              ),
              Container(height: 18.h, color: CustomColors.grayShade, width: 1),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,

                children: [
                  Icon(
                    Icons.access_time_rounded,
                    size: Dimensions.iconSizeLarge * 0.8,
                    color: CustomColors.grayShade,
                  ),
                  TextWidget(
                    '15 min',
                    fontSize: Dimensions.titleSmall * 0.9,
                    color: CustomColors.grayShade,
                    padding: Dimensions.widthSize.edgeLeft * 0.5,
                  ),
                ],
              ),
              Container(height: 18.h, color: CustomColors.grayShade, width: 1),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Icon(
                    Icons.wallet,
                    size: Dimensions.iconSizeLarge * 0.8,
                    color: CustomColors.grayShade,
                  ),
                  TextWidget(
                    '\$125',
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
          'This classic French dish features lobster meat cooked in a creamy, wine-based sauce and returned to its shell to be broiled with a cheesy topping.',
          color: CustomColors.grayShade,
          textAlign: TextAlign.center,
          fontSize: Dimensions.titleSmall * 0.9,
          maxLines: 3,
        ),
      ],
    );
  }
}
