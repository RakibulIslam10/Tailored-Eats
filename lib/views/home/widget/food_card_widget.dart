part of '../screen/home_screen.dart';

class FoodCardWidget extends StatelessWidget {
  final String title;
  final String description;
  final String calories;
  final String time;
  final String imageUrl;
  final VoidCallback? onShuffle;
  final VoidCallback? onTap;
  final bool isShuffle;
  final Meal? meal;

  const FoodCardWidget({
    super.key,
    required this.title,
    required this.description,
    required this.calories,
    required this.time,
    required this.imageUrl,
    this.onShuffle,
    this.onTap,
    this.isShuffle = false,
    this.meal,
  });

  @override
  Widget build(BuildContext context) {
    final nutritionController = Get.find<NutritionController>();

    return RepaintBoundary(
      child: InkWell(
        borderRadius: BorderRadius.circular(Dimensions.radius * 0.85),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(Dimensions.radius * 0.85),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ✅ Image with Favorite Button
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      Dimensions.radius * 0.8,
                    ),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      width: 100.w,
                      height: 85.h,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          width: 100.w,
                          height: 85.h,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        width: 100.w,
                        height: 85.h,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.broken_image_outlined,
                          color: Colors.grey[400],
                          size: 24,
                        ),
                      ),
                    ),
                  ),

                  // ✅ Favorite Icon - InkWell দিয়ে wrap করুন
// ✅ Favorite button section
          if (meal != null)
      Positioned(
      top: 0,
      left: 0,
      child: Obx(() {
        final isFav = meal!.isFavorite.value;
        print('🎨 Widget rebuilding - Meal: ${meal!.mealName} (ID: ${meal!.id}), isFavorite: $isFav');

        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              print('👆 Clicked favorite for: ${meal!.mealName} (ID: ${meal!.id})');
              nutritionController.toggleFavorite(meal!);
            },
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius * 0.8),
              bottomRight: Radius.circular(Dimensions.radius * 0.8),
            ),
            child: Container(
              padding: EdgeInsets.all(Dimensions.paddingSize * 0.4),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius * 0.8),
                  bottomRight: Radius.circular(Dimensions.radius * 0.8),
                ),
              ),
              child: Icon(
                isFav ? Icons.favorite : Icons.favorite_border,
                color: isFav ? Colors.red : Colors.white,
                size: Dimensions.iconSizeDefault * 1.2,
              ),
            ),
          ),
        );
      }),
    )
                  else
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        padding: EdgeInsets.all(
                          Dimensions.paddingSize * 0.4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                              Dimensions.radius * 0.8,
                            ),
                            bottomRight: Radius.circular(
                              Dimensions.radius * 0.8,
                            ),
                          ),
                        ),
                        child: Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                          size: Dimensions.iconSizeDefault * 1.2,
                        ),
                      ),
                    ),
                ],
              ),

              // Details Section
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.defaultHorizontalSize * 0.6,
                    vertical: Dimensions.verticalSize * 0.25,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        title,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.titleSmall,
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                      ),

                      Space.height.v5,

                      TextWidget(
                        description,
                        fontSize: Dimensions.titleSmall * 0.85,
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
                              SvgPicture.asset(
                                Assets.icons.calories,
                                height: Dimensions.heightSize * 1.5,
                              ),
                              TextWidget(
                                calories,
                                fontSize: Dimensions.titleSmall * 0.8,
                                color: CustomColors.grayShade,
                                padding: Dimensions.widthSize.edgeLeft * 0.5,
                              ),
                              Space.width.v5,
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

                          Visibility(
                            visible: isShuffle,
                            child: InkWell(
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
      ),
    );
  }
}