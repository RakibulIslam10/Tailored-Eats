part of '../screen/home_screen.dart';

class NutrientCardWidget extends GetView<HomeController> {
  const NutrientCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsGeometry.symmetric(
        horizontal: Dimensions.defaultHorizontalSize * 0.5,
        vertical: Dimensions.verticalSize * 0.4,
      ),
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: CustomColors.grayShade),

        borderRadius: BorderRadiusGeometry.circular(Dimensions.radius * 0.8),
      ),

      child: Row(
        mainAxisAlignment: mainSpaceBet,
        children: [
          const CalorieProgressWidget(totalCalories: 3000.0),

          NutrientCard(
            icon: Icons.rice_bowl,
            title: 'Carbs',
            value: '250',
            unit: 'gm',
          ),
          NutrientCard(
            icon: Icons.rice_bowl,
            title: 'Carbs',
            value: '250',
            unit: 'gm',
          ),
          NutrientCard(
            icon: Icons.rice_bowl,
            title: 'Carbs',
            value: '250',
            unit: 'gm',
          ),
        ],
      ),
    );
  }
}

class NutrientCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final String unit;

  const NutrientCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.w,
      height: 80.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius * 0.95),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF5F0F40), // Darker shade of your pink #F826A4
            Color(0xFF1A4D62), // Darker shade of your blue #26C4F8
            Color(0xFF1A5A2B), // Darker shade of your green #26F865
          ],
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Dimensions.radius * 0.95),
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
              child: Container(
                color: Colors.white.withOpacity(0.08), // light frosted overlay
              ),
            ),

            /// actual content
            Padding(
              padding: EdgeInsets.all(Dimensions.paddingSize * 0.4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: REdgeInsets.all(1),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: CustomColors.grayShade,
                        width: 1,
                      ),
                    ),
                    child: Icon(
                      icon,
                      color: Colors.redAccent,
                      size: Dimensions.iconSizeDefault,
                    ),
                  ),
                  Space.height.v5,
                  TextWidget(
                    padding: EdgeInsetsGeometry.only(
                      bottom: Dimensions.heightSize * 0.2,
                    ),
                    title,
                    fontSize: Dimensions.titleSmall * 0.8,
                    fontWeight: FontWeight.w500,
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextWidget(
                        value,
                        fontSize: Dimensions.titleSmall * 1.0,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(width: 4),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 2.0),
                        child: TextWidget(
                          unit,
                          fontSize: Dimensions.titleSmall * 0.7,
                          fontWeight: FontWeight.w500,
                          color: CustomColors.grayShade,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
