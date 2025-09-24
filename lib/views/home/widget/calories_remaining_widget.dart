part of '../screen/home_screen.dart';

class CaloriesRemainingWidget extends GetView<HomeController> {
  const CaloriesRemainingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          'Calories Remaining For Today',
          fontWeight: FontWeight.bold,
          padding: Dimensions.verticalSize.edgeVertical * 0.6,
        ),
        SizedBox(
          height: 100.h,
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            cacheExtent: 500,
            itemBuilder: (context, index) {
              // final calorieItem = controller.caloriesList[index];
              return CaloriesCard(
                iconPath: Assets.icons.calories,
                title: 'Calories',
                value: '150',
                unit: 'gm',
                progress: controller.progress,
              );
            },
          ),
        ),
      ],
    );
  }
}

// Reusable Card Widget
class CaloriesCard extends StatelessWidget {
  final String iconPath;
  final String title;
  final String value;
  final String unit;
  final RxDouble progress;

  const CaloriesCard({
    super.key,
    required this.iconPath,
    required this.title,
    required this.value,
    required this.unit,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Container(
        margin: Dimensions.widthSize.edgeRight * 0.8,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Dimensions.radius * 0.85),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // blur effect
            child: Container(
              padding: REdgeInsets.all(Dimensions.paddingSize * 0.15),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF6A1B9A), // purple-ish
                    Color(0xFF283593)
                  ],
                ),

                border: Border.all(color: CustomColors.grayShade.withOpacity(0.5)),
                borderRadius: BorderRadius.circular(Dimensions.radius * 0.85),
                color: Colors.black.withOpacity(0.2), // fallback base color
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Space.height.v5,
                  Row(
                    children: [
                      Container(
                        padding: REdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: CustomColors.grayShade, width: 1),
                        ),
                        child: SvgPicture.asset(
                          iconPath,
                          height: Dimensions.iconSizeDefault,
                        ),
                      ),
                      TextWidget(
                        padding: EdgeInsets.only(left: Dimensions.heightSize * 0.4),
                        title,
                        fontSize: Dimensions.titleSmall * 0.9,
                        fontWeight: FontWeight.w500,
                        color: CustomColors.grayShade,
                      ),
                    ],
                  ),
                  Space.height.v10,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextWidget(
                        value,
                        fontSize: Dimensions.titleSmall * 0.9,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(width: 4),
                      Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: TextWidget(
                          unit,
                          fontSize: Dimensions.titleSmall * 0.8,
                          fontWeight: FontWeight.w500,
                          color: CustomColors.grayShade,
                        ),
                      ),
                    ],
                  ),
                  Obx(
                        () => Container(
                      margin: Dimensions.verticalSize.edgeTop * 0.5,
                      width: 80.w,
                      height: 5.h,
                      decoration: BoxDecoration(
                        color: const Color(0xFF383838).withOpacity(0.3),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: 65.w * progress.value,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF00BFFF),
                                Color(0xFF1E90FF),
                              ],
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
        ),
      ),
    );
  }
}
