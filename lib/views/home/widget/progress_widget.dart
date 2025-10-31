part of '../screen/home_screen.dart';

// class CalorieProgressWidget extends GetView<HomeController> {
//   final double totalCalories;
//   final double size;
//
//   const CalorieProgressWidget({
//     super.key,
//     required this.totalCalories,
//     this.size = 85.0,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       final progress = controller.currentCalories.value / totalCalories;
//       final displayValue = controller.currentCalories.value;
//
//       return Column(
//         mainAxisAlignment: mainCenter,
//         children: [
//           SizedBox(
//             width: size.w,
//             height: size.h,
//             child: Stack(
//               alignment: Alignment.center,
//               children: [
//                 CustomPaint(
//                   size: Size(size, size),
//                   painter: CircularProgressClipper(
//                     progress: progress,
//                     strokeWidth: 7,
//                   ),
//                 ),
//                 Image.asset(Assets.dummy.cc.path, height: 58.h),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     TextWidget(
//                       '$displayValue',
//                       fontSize: Dimensions.titleSmall * 0.8,
//                       fontWeight: FontWeight.bold,
//                       padding: Dimensions.widthSize.edgeRight * 0.2,
//                     ),
//                     TextWidget(
//                       'CALLEFT',
//                       fontSize: Dimensions.titleSmall * 0.7,
//                       fontWeight: FontWeight.bold,
//                       padding: Dimensions.widthSize.edgeRight * 0.2,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           TextWidget(
//             "250/1000",
//             fontWeight: FontWeight.bold,
//             fontSize: Dimensions.titleSmall * 0.8,
//           ),
//           TextWidget(
//             "CALORIES",
//             fontWeight: FontWeight.bold,
//             fontSize: Dimensions.titleSmall * 0.8,
//           ),
//         ],
//       );
//     });
//   }
// }

class CalorieProgressWidget extends GetView<HomeController> {
  final double totalCalories;
  final double size;

  const CalorieProgressWidget({
    super.key,
    required this.totalCalories,
    this.size = 85.0,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final progress = controller.currentCalories.value / totalCalories;
      final displayValue = controller.currentCalories.value;
      final responsiveSize = size.r;
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: responsiveSize,
            height: responsiveSize,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  size: Size(responsiveSize, responsiveSize),
                  painter: CircularProgressClipper(
                    progress: progress,
                    strokeWidth: 6.5.r,
                  ),
                ),
                Image.asset(Assets.dummy.cc.path, height: 56.r),
                Positioned.fill(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget(
                        padding: EdgeInsetsGeometry.only(bottom: Dimensions.heightSize * 0.2),
                        '$displayValue',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      TextWidget(
                        'CALLEFT',
                        fontSize: Dimensions.titleSmall * 0.75,
                        fontWeight: FontWeight.w900,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          TextWidget(
            "250/1000",
            fontWeight: FontWeight.bold,
            fontSize: Dimensions.titleSmall * 0.8,
          ),
          TextWidget(
            "CALORIES",
            fontWeight: FontWeight.bold,
            fontSize: Dimensions.titleSmall * 0.8,
          ),
        ],
      );
    });
  }
}
