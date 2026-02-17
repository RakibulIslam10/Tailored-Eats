part of '../screen/home_screen.dart';


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
    double parseDouble(dynamic value) {
      if (value == null) return 0.0;
      if (value is double) return value;
      if (value is int) return value.toDouble();
      if (value is String) return double.tryParse(value) ?? 0.0;
      return 0.0;
    }
    double totalCal = parseDouble(
      controller.macrosModel.value?.data.calorie.calorieGoal,
    );
    double currentCal = parseDouble(
      controller.macrosModel.value?.data.calorie.consumedCalorie,
    );

    final progress = currentCal / totalCal;

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
                      padding: EdgeInsetsGeometry.only(
                        bottom: Dimensions.heightSize * 0.2,
                      ),
                      '${controller.macrosModel.value?.data.calorie.calorieGoal}',
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
          "${controller.macrosModel.value?.data.calorie.consumedCalorie}/${controller.macrosModel.value?.data.calorie.calorieGoal}",
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






  }
}
