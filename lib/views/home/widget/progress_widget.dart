part of '../screen/home_screen.dart';

class CalorieProgressWidget extends GetView<HomeController> {
  final double totalCalories;
  final double size;

  const CalorieProgressWidget({
    super.key,
    required this.totalCalories,
    this.size = 76.0,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final progress = controller.currentCalories.value / totalCalories;
      final displayValue = controller.currentCalories.value.toInt();

      return Column(
        mainAxisAlignment: mainCenter,
        children: [
          SizedBox(
            width: size.w,
            height: size.h,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  size: Size(size, size),
                  painter: CircularProgressClipper(
                    progress: progress,
                    strokeWidth: 7,
                  ),
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: Dimensions.heightSize.edgeBottom * 0.25,
                      child: Image.asset(Assets.icons.agun.path),
                    ),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.end,
                      children: [
                        TextWidget(
                          '$displayValue',
                          fontSize: Dimensions.titleSmall * 0.8,
                          fontWeight: FontWeight.bold,
                          padding: Dimensions.widthSize.edgeRight * 0.2,
                        ),
                        TextWidget(
                          ' kcal',
                          color: CustomColors.grayShade,
                          fontSize: Dimensions.titleSmall * 0.65,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          TextWidget(
            "250/2000",
            fontWeight: FontWeight.bold,
            fontSize: Dimensions.titleSmall,
          ),
        ],
      );
    });
  }
}
