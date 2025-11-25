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
          child: Row(
            crossAxisAlignment: crossCenter,
            mainAxisAlignment: mainSpaceBet,
            children: [
              CaloriesCard(
                path: Assets.icons.agun.path,
                title: 'Fat',
                value: '150',
              ),
              CaloriesCard(
                path: Assets.icons.pro.path,
                title: 'Protein',
                value: '150',
              ),
              CaloriesCard(
                path: Assets.icons.carb.path,
                title: 'Carbs',
                value: '150',
              ),
              CaloriesCard(
                path: Assets.icons.fat.path,
                title: 'Fat',
                value: '150',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Reusable Card Widget
class CaloriesCard extends GetView<HomeController> {
  final String path;
  final String title;
  final String value;

  const CaloriesCard({
    super.key,
    required this.path,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Container(
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
                        width: 65.w * 0.46,
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
      ),
    );
  }
}
