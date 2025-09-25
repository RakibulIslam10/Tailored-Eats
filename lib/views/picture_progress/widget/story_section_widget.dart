part of '../screen/picture_progress_screen.dart';

class StorySectionWidget extends GetView<PictureProgressController> {
  const StorySectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextWidget(
              "Every Picture Tells Your Story",
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            InkWell(
              // onTap: controller.showImageOptions,
              child: Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(Icons.camera_alt, color: Colors.white, size: 20.sp),
              ),
            ),
          ],
        ),

        SizedBox(height: 20.h),

        const ConsistentCardWidget(),
      ],
    );
  }
}

class ConsistentCardWidget extends GetView<PictureProgressController> {
  const ConsistentCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.storyImages.length,
      itemBuilder: (context, index) {
        final bool isBig = index.isEven;
        final image = controller.storyImages[index];

        return Container(
          height: isBig ? 210.h : 100.h,
          decoration: BoxDecoration(
            color: const Color(0xFF1F2937),
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Stack(
              fit: StackFit.expand,
              children: [
                CachedNetworkImage(
                  imageUrl: image["url"]!,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey.shade400,
                    child: Icon(
                      Icons.image_not_supported,
                      size: Dimensions.iconSizeLarge * 2,
                      color: CustomColors.grayShade,
                    ),
                  ),
                  placeholder: (context, url) =>
                      Container(color: Colors.grey.shade300),
                ),

                /// Date overlay
                Positioned(
                  bottom: 8.h,
                  left: 8.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Text(
                      image["date"]!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
