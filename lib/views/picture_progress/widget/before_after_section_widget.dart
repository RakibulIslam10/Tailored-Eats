part of '../screen/picture_progress_screen.dart';

class BeforeAfterSectionWidget extends GetView<PictureProgressController> {
  const BeforeAfterSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimensions.verticalSize * 0.5),
      child: Row(
        children: [
          Expanded(
            child: ToggleImageCard(
              imageUrl:
                  'https://images.stockcake.com/public/f/6/1/f6162e66-9b24-4cfb-aca1-5f9589dda882_large/focused-gym-workout-stockcake.jpg',
              label: "Before",
              date: "25 July 2025",
              toggleValue: controller.beforeToggle,
              onToggle: () => controller.beforeToggle.value =
                  !controller.beforeToggle.value,
            ),
          ),

          Space.width.v10,
          Expanded(
            child: ToggleImageCard(
              imageUrl:
                  'https://images.stockcake.com/public/f/6/1/f6162e66-9b24-4cfb-aca1-5f9589dda882_large/focused-gym-workout-stockcake.jpg',
              label: "Before",
              date: "25 July 2025",
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
