part of '../screen/home_screen.dart';

class NutrientCardWidget extends GetView<HomeController> {
  const NutrientCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double parseDouble(dynamic value) {
      if (value == null) return 0.0;
      if (value is double) return value;
      if (value is int) return value.toDouble();
      if (value is String) return double.tryParse(value) ?? 0.0;
      return 0.0;
    }

    var data = controller.macrosModel?.data.calorie;
    var proteinP =
        parseDouble(data?.consumedProtein) / parseDouble(data?.proteinGoal);
    var carbP = parseDouble(data?.consumedCarb) / parseDouble(data?.carbGoal);
    var fatP = parseDouble(data?.consumedFat) / parseDouble(data?.fatGoal);
    return Stack(
      alignment: AlignmentGeometry.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.withOpacity(0.25)),
            borderRadius: BorderRadius.circular(Dimensions.radius * 0.9),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(Dimensions.radius * 0.9),
            child: SizedBox(
              height: 150.h,
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(math.pi),
                child: Image.asset(
                  Assets.dummy.ssss.path,
                  fit: BoxFit.cover,
                  width: double.maxFinite,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.defaultHorizontalSize * 0.5,
            vertical: Dimensions.verticalSize * 0.5,
          ),
          child: Row(
            crossAxisAlignment: crossCenter,
            mainAxisAlignment: mainSpaceBet,
            children: [
              const CalorieProgressWidget(totalCalories: 1000.0),
              // Space.width.v10,
              NutrientCard(
                path: Assets.icons.pro.path,
                title: 'Protein',
                value: '${data?.consumedProtein}/${data?.proteinGoal}G',
                percent: proteinP,
              ),
              NutrientCard(
                path: Assets.icons.carb.path,
                title: 'Carbs',
                value:
                    '${controller.macrosModel?.data.calorie.consumedCarb}/${controller.macrosModel?.data.calorie.carbGoal}G',
                percent: carbP,
              ),
              NutrientCard(
                path: Assets.icons.fat.path,
                title: 'Fat',
                value:
                    '${controller.macrosModel?.data.calorie.consumedFat}/${controller.macrosModel?.data.calorie.fatGoal}G',
                percent: fatP,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class NutrientCard extends GetView<HomeController> {
  final String path;
  final String title;
  final String value;
  final double percent;

  const NutrientCard({
    super.key,
    required this.path,
    required this.title,
    required this.value,
    required this.percent,
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
      controller.macrosModel?.data.calorie.calorieGoal,
    );
    double currentCal = parseDouble(
      controller.macrosModel?.data.calorie.consumedCalorie,
    );

    final progress = currentCal / totalCal;

    return Container(
      width: 85.w,
      height: 90.h,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withAlpha(852)),
        borderRadius: BorderRadius.circular(Dimensions.radius * 0.95),
        color: Colors.black,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Dimensions.radius * 0.95),
        child: Padding(
          padding: EdgeInsets.all(Dimensions.paddingSize * 0.4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 4.w),
                    padding: REdgeInsets.all(2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: CustomColors.grayShade,
                        width: 1,
                      ),
                    ),
                    child: Image.asset(path, height: 12.h),
                  ),
                  TextWidget(
                    title,
                    fontSize: Dimensions.titleSmall * 0.65,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              Space.height.v5,
              FittedBox(
                child: TextWidget(
                  value,
                  fontSize: Dimensions.titleSmall * 0.8,
                  fontWeight: FontWeight.bold,
                  maxLines: 1,
                ),
              ),
              Obx(
                () => Container(
                  margin: Dimensions.verticalSize.edgeTop * 0.5,
                  height: 6.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFF383838).withOpacity(0.8),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 65.w * percent,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF00BFFF), Color(0xFF1E90FF)],
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
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
