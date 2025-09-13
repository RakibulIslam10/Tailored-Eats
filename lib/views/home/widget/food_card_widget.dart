part of '../screen/home_screen.dart';

class FoodCardWidget extends StatelessWidget {
  final String title;
  final String description;
  final String calories;
  final String time;
  final String imageUrl;
  final VoidCallback? onShuffle; // 👈 optional callback

  const FoodCardWidget({
    super.key,
    required this.title,
    required this.description,
    required this.calories,
    required this.time,
    required this.imageUrl,
    this.onShuffle,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(Dimensions.radius * 0.85),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
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
                      title,
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.titleSmall,
                    ),
                    TextWidget(
                      description,
                      fontSize: Dimensions.titleSmall * 0.8,
                      maxLines: 2,
                      textOverflow: TextOverflow.ellipsis,
                      color: CustomColors.grayShade,
                    ),
                    Space.height.v5,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(Assets.icons.calories),
                            TextWidget(
                              calories,
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
                                  time,
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
                          child: GestureDetector(
                            onTap: onShuffle,
                            child: Icon(
                              Icons.shuffle,
                              color: CustomColors.primary,
                              size: Dimensions.iconSizeDefault,
                            ),
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
      ),
    );
  }
}
