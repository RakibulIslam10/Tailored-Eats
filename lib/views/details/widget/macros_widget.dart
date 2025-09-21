part of '../screen/details_screen.dart';

class MacrosWidget extends GetView<DetailsController> {
  const MacrosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          TextWidget(
            'Macros per serving',
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
      ),
    );
  }
}
