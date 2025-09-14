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
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: InkWell(
        borderRadius: BorderRadius.circular(Dimensions.radius * 0.85),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(Dimensions.radius * 0.85),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              ClipRRect(
                borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: 100.w,
                  height: 85.h,
                  fit: BoxFit.cover,

                  // 🟡 Shimmer while loading
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      width: 100.w,
                      height: 85.h,
                      color: Colors.grey.shade300,
                    ),
                  ),

                  // 🔴 Error fallback
                  errorWidget: (context, url, error) => Container(
                    width: 100.w,
                    height: 85.h,
                    color: Colors.grey.shade600,
                    child: Icon(
                      Icons.image_not_supported,
                      size: Dimensions.iconSizeLarge,
                      color: Colors.grey.shade200,
                    ),
                  ),
                ),
              ),

              // Details
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.defaultHorizontalSize * 0.6,
                    vertical: Dimensions.verticalSize * 0.25,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      TextWidget(
                        title,
                        fontWeight: FontWeight.bold,
                        fontSize: Dimensions.titleSmall,
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                      Space.height.v5,
                      // Description
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
                              SvgPicture.asset(Assets.icons.calories),
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

                          // Shuffle Button
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
