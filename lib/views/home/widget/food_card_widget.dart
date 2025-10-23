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
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(Dimensions.radius * 0.85),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
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
                  Padding(
                    padding: EdgeInsetsGeometry.all(
                      Dimensions.paddingSize * 0.1,
                    ),
                    child: Icon(Icons.favorite, color: Colors.white),
                  ),
                ],
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
                      Row(
                        mainAxisAlignment: mainSpaceBet,
                        children: [
                          TextWidget(
                            title,
                            fontWeight: FontWeight.bold,
                            fontSize: Dimensions.titleSmall,
                            maxLines: 1,
                            textOverflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 24.h,
                            width: 24.w,
                            child: Checkbox(
                              value: false,
                              onChanged: (bool? newValue) {
                                // _isChecked.value = newValue ?? false;
                              },
                              activeColor: CustomColors.progressColor,
                              checkColor: Colors.white,
                              fillColor:
                                  MaterialStateProperty.resolveWith<Color>((
                                    Set<MaterialState> states,
                                  ) {
                                    if (states.contains(
                                      MaterialState.selected,
                                    )) {
                                      return CustomColors.progressColor;
                                    }
                                    return const Color(0xFF3B3B3B);
                                  }),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              side: const BorderSide(
                                color: Color(0xFF3B3B3B),
                                width: 2,
                              ),
                            ),
                          ),
                        ],
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
