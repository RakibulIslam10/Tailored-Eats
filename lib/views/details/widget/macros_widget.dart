part of '../screen/details_screen.dart';

class MacrosWidget extends GetView<DetailsController> {
  const MacrosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

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
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: screenHeight * 0.12,
              minHeight: screenHeight * 0.10,
            ),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CalorieTrackerWidget(calorieValue: '2500', unit: 'Kcal'),
                SizedBox(width: 12.w),
                CalorieTrackerWidget(calorieValue: '45', unit: 'Kcal'),
                SizedBox(width: 12.w),
                CalorieTrackerWidget(calorieValue: '30', unit: 'Kcal'),
                SizedBox(width: 12.w),
                CalorieTrackerWidget(calorieValue: '15', unit: 'Kcal'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CalorieTrackerWidget extends StatelessWidget {
  final String calorieValue;
  final String unit;

  const CalorieTrackerWidget({
    super.key,
    this.calorieValue = '2500',
    this.unit = 'Kcal',
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final cardHeight = screenHeight * 0.11;
    final cardWidth = cardHeight * 0.85;

    return ClipRRect(
      borderRadius: BorderRadius.circular(cardHeight * 0.084),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
        child: Container(
          width: cardWidth,
          height: cardHeight,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFFF826A4).withOpacity(0.4),
                const Color(0xFF848484).withOpacity(0.2),
                const Color(0xFF26F865).withOpacity(0.1),
              ],
            ),
            borderRadius: BorderRadius.circular(cardHeight * 0.084),
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
              width: 1.5,
            ),
            // Glass shine effect
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(-5, -5),
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(5, 5),
              ),
            ],
          ),
          child: Stack(
            children: [
              // Glass reflection effect
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: cardHeight * 0.5,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white.withOpacity(0.15),
                        Colors.white.withOpacity(0.0),
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(cardHeight * 0.084),
                      topRight: Radius.circular(cardHeight * 0.084),
                    ),
                  ),
                ),
              ),
              // Content
              Padding(
                padding: EdgeInsets.all(cardHeight * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(Dimensions.paddingSize * 0.1),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withOpacity(0.4),
                          width: 2,
                        ),
                        // Subtle glow for icon
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.3),
                            blurRadius: 8,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.fire_extinguisher_sharp,
                        color: Colors.white,
                        size: Dimensions.iconSizeDefault,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Space.height.v5,
                        TextWidget(
                          'Calories',
                          fontSize: Dimensions.titleSmall,
                          fontWeight: FontWeight.w400,
                          color: Colors.white.withOpacity(0.95),
                        ),
                        Space.height.v5,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Flexible(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                alignment: Alignment.centerLeft,
                                child: TextWidget(
                                  calorieValue,
                                  fontSize: Dimensions.titleMedium * 1.2,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Space.width.v5,
                            TextWidget(
                              unit,
                              fontSize: Dimensions.titleSmall * 0.8,
                              fontWeight: FontWeight.w400,
                              color: Colors.white.withOpacity(0.6),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
