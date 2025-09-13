part of '../screen/home_screen.dart';

class FoodCardWidget extends GetView<HomeController> {
  const FoodCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadiusGeometry.circular(Dimensions.radius * 0.85),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
            child: CachedNetworkImage(
              imageUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpK1noS9RwpA351YDfG9dRCvSON-j5nZHU0A&s',
              width: 100.w,
              height: 80.h,
              fit: BoxFit.cover,
            ),
          ),
          Space.width.v10,
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: Dimensions.verticalSize * 0.25,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    'Delicious lobster gourmet ',
                    fontWeight: FontWeight.bold,
                    fontSize: Dimensions.titleSmall,
                  ),
                  TextWidget(
                    'Use kitchen scissors to cut through the top shell lengthwise, ',
                    fontSize: Dimensions.titleSmall * 0.8,
                    maxLines: 2,
                    textOverflow: TextOverflow.ellipsis,
                    color: CustomColors.grayShade,
                  ),
                  Space.height.v5,
                  Row(
                    mainAxisAlignment: mainSpaceBet,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(Assets.icons.calories),
                          TextWidget(
                            '271 Kcal',
                            fontSize: Dimensions.titleSmall * 0.8,
                            color: CustomColors.grayShade,
                            padding: Dimensions.widthSize.edgeLeft * 0.5,
                          ),
                          Space.width.v5,
                          Wrap(
                            children: [
                              Icon(
                                Icons.access_time_rounded,
                                size: Dimensions.iconSizeDefault,
                                color: CustomColors.grayShade,
                              ),
                              TextWidget(
                                '15 min',
                                fontSize: Dimensions.titleSmall * 0.8,
                                color: CustomColors.grayShade,

                                padding: Dimensions.widthSize.edgeLeft * 0.5,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: Dimensions.widthSize.edgeRight,
                        child: Icon(
                          Icons.shuffle,
                          color: CustomColors.primary,
                          size: Dimensions.iconSizeDefault,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
