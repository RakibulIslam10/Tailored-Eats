part of '../screen/picture_progress_screen.dart';

class BeforeAfterSectionWidget extends GetView<PictureProgressController> {
  const BeforeAfterSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controllers = Get.find<ConsistencyController>();

    // ✅ Empty check করুন
    if (controllers.imageProgressList.isEmpty) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: Dimensions.verticalSize * 0.5),
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Center(
          child: Column(
            children: [
              Icon(Icons.image_not_supported, size: 48.sp, color: Colors.grey),
              SizedBox(height: 10.h),
              Text(
                'No progress images yet',
                style: TextStyle(color: Colors.grey, fontSize: 14.sp),
              ),
            ],
          ),
        ),
      );
    }

    // ✅ শুধুমাত্র 1টা image থাকলে
    if (controllers.imageProgressList.length == 1) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: Dimensions.verticalSize * 0.5),
        child: ToggleImageCard(
          imageUrl:
              '${ApiEndPoints.mainDomain}/${controllers.imageProgressList.first.url}',
          label: "Current",
          date: Helpers.formatDate(
            controllers.imageProgressList.first.createdAt.toString(),
          ),
          toggleValue: controller.beforeToggle,
          onToggle: () =>
              controller.beforeToggle.value = !controller.beforeToggle.value,
        ),
      );
    }

    // ✅ 2টা বা তার বেশি image থাকলে Before/After দেখান
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimensions.verticalSize * 0.5),
      child: Row(
        children: [
          Expanded(
            child: ToggleImageCard(
              imageUrl:
                  '${ApiEndPoints.mainDomain}/${controllers.imageProgressList.first.url}',
              label: "Before",
              date: Helpers.formatDate(
                controllers.imageProgressList.first.createdAt.toString(),
              ),
              toggleValue: controller.beforeToggle,
              onToggle: () => controller.beforeToggle.value =
                  !controller.beforeToggle.value,
            ),
          ),
          Space.width.v10,
          Expanded(
            child: ToggleImageCard(
              imageUrl:
                  '${ApiEndPoints.mainDomain}/${controllers.imageProgressList.last.url}',
              label: "After",
              date: Helpers.formatDate(
                controllers.imageProgressList.last.createdAt.toString(),
              ),
              toggleValue: controller.afterToggle,
              onToggle: () =>
                  controller.afterToggle.value = !controller.afterToggle.value,
            ),
          ),
        ],
      ),
    );
  }
}

// ToggleImageCard same থাকবে...
class ToggleImageCard extends StatelessWidget {
  final String imageUrl;
  final String label;
  final String date;
  final RxBool toggleValue;
  final VoidCallback onToggle;

  const ToggleImageCard({
    super.key,
    required this.imageUrl,
    required this.label,
    required this.date,
    required this.toggleValue,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => Get.toNamed(Routes.),
      child: Container(
        height: 240.h,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r)),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.network(
                imageUrl,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            Positioned(
              top: 12.h,
              right: 12.w,
              child: InkWell(
                onTap: onToggle,
                borderRadius: BorderRadius.circular(12.r),
                child: Obx(
                  () => Container(
                    width: 44.w,
                    height: 24.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: toggleValue.value ? Colors.blue : Colors.grey,
                    ),
                    child: AnimatedAlign(
                      duration: const Duration(milliseconds: 200),
                      alignment: toggleValue.value
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        width: 20.w,
                        height: 20.h,
                        margin: EdgeInsets.all(2.w),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            /// Blur when ON
            Obx(
              () => toggleValue.value
                  ? Positioned(
                      top: 35.h,
                      right: 0,
                      left: 0,
                      child: Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              width: 100.w,
                              height: 70.h,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),

            /// Label & Date
            Positioned(
              right: 0,
              left: 0,
              bottom: 12.h,
              child: Column(
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    date,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
