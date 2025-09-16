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
          height: MediaQuery.of(context).size.height * 0.1,
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
        margin: Dimensions.widthSize.edgeRight * 0.75,
        padding: REdgeInsets.all(Dimensions.paddingSize * 0.15),
        decoration: BoxDecoration(
          border: Border.all(color: CustomColors.grayShade),
          borderRadius: BorderRadius.circular(Dimensions.radius * 0.85),
          color: Colors.black,
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
                    height: Dimensions.heightSize,
                  ),
                ),
                TextWidget(
                  padding: EdgeInsets.only(left: Dimensions.heightSize * 0.4),
                  title,
                  fontSize: Dimensions.titleSmall * 0.65,
                  fontWeight: FontWeight.w500,
                  color: CustomColors.grayShade,
                ),
              ],
            ),
            Space.height.v5,
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextWidget(
                  value,
                  fontSize: Dimensions.titleSmall * 0.85,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(width: 4),
                Padding(
                  padding: const EdgeInsets.only(left: 2.0),
                  child: TextWidget(
                    unit,
                    fontSize: Dimensions.titleSmall * 0.55,
                    fontWeight: FontWeight.w500,
                    color: CustomColors.grayShade,
                  ),
                ),
              ],
            ),
            Obx(
              () => Container(
                margin: Dimensions.verticalSize.edgeVertical * 0.25,
                width: 65.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: const Color(0xFF383838),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 65.w * progress.value,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFF00BFFF),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
