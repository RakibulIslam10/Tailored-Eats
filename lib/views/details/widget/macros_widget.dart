part of '../screen/details_screen.dart';

class MacrosWidget extends GetView<DetailsController> {
  const MacrosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: Padding(
        padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
        child: Row(
          crossAxisAlignment: crossCenter,
          mainAxisAlignment: mainSpaceBet,
          children: [
            CalorieTrackerWidget(
              path: Assets.icons.agun.path,
              title: 'Fat',
              value: controller.mealDetails.value?.fatG.toString() ?? '0',
            ),
            CalorieTrackerWidget(
              path: Assets.icons.pro.path,
              title: 'Protein',
              value: controller.mealDetails.value?.proteinG.toString() ?? '0',
            ),
            CalorieTrackerWidget(
              path: Assets.icons.carb.path,
              title: 'Carbs',
              value: controller.mealDetails.value?.carbsG.toString() ?? '0',
            ),
      SizedBox()
          ],
        ),
      ),
    );
  }
}

class CalorieTrackerWidget extends GetView<DetailsController> {
  final String path;
  final String title;
  final String value;

  const CalorieTrackerWidget({
    super.key,
    required this.path,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Dimensions.radius * 0.95),
        child: Container(
          width: 88.w,
          decoration: BoxDecoration(
            // gradient: LinearGradient(
            //   colors: [
            //     Color(0xFFF826A4).withOpacity(0.2),
            //     Color(0xFF26C4F8).withOpacity(0.2),
            //     Color(0xFF26F865).withOpacity(0.2),
            //   ],
            //   begin: Alignment.topLeft,
            //   end: Alignment.bottomRight,
            // ),
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(Dimensions.radius * 0.95),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(Dimensions.radius * 0.95),
            ),
            child: Padding(
              padding: EdgeInsets.all(Dimensions.paddingSize * 0.4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 4, bottom: 6),
                        padding: REdgeInsets.all(2.5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
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
                  Row(
                    children: [
                      TextWidget(
                        value,
                        fontSize: Dimensions.titleSmall * 0.9,
                        fontWeight: FontWeight.bold,
                      ),
                      Space.width.v5,
                      TextWidget(
                        padding: Dimensions.heightSize.edgeTop * 0.5,
                        'gm',
                        fontSize: Dimensions.titleSmall * 0.8,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
