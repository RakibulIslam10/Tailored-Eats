part of '../screen/home_screen.dart';

class NutrientCardWidget extends GetView<HomeController> {
  const NutrientCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
            horizontal: Dimensions.defaultHorizontalSize * 0.6,
            vertical: Dimensions.verticalSize * 0.5,
          ),
          child: Row(
            crossAxisAlignment: crossStart,
            mainAxisAlignment: mainSpaceBet,
            children: [
              const CalorieProgressWidget(totalCalories: 1000.0),
              NutrientCard(
                path: Assets.icons.pro.path,
                title: 'Protein',
                value: '20/100G',
              ),
              NutrientCard(
                path: Assets.icons.carb.path,
                title: 'Carbs',
                value: '20/100G',
              ),
              NutrientCard(
                path: Assets.icons.fat.path,
                title: 'Fat',
                value: '20/100G',
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

  const NutrientCard({
    super.key,
    required this.path,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 88.w,
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
                    margin: EdgeInsets.only(right: 4),
                    padding: REdgeInsets.all(2.5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: CustomColors.grayShade,
                        width: 1,
                      ),
                    ),
                    child: Image.asset(path),
                  ),
                  TextWidget(
                    title,
                    fontSize: Dimensions.titleSmall * 0.8,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              Space.height.v5,
              FittedBox(
                child: TextWidget(
                  value,
                  fontSize: Dimensions.titleSmall * 0.9,
                  fontWeight: FontWeight.bold,
                  maxLines: 1,
                ),
              ),
              Obx(
                () => Container(
                  margin: Dimensions.verticalSize.edgeTop * 0.5,
                  width: 80.w,
                  height: 6.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFF383838).withOpacity(0.8),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 65.w * controller.progress.value,
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
