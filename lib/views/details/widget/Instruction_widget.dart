part of '../screen/details_screen.dart';


class InstructionWidget extends GetView<DetailsController> {
  const InstructionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Obx(() {
      final meal = controller.mealDetails.value;

      if (meal == null || meal.instructions.isEmpty) {
        return SizedBox.shrink();
      }

      return Padding(
        padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
        child: Column(
          crossAxisAlignment: crossStart,
          children: [
            TextWidget(
              'Instructions',
              fontWeight: FontWeight.bold,
              padding: Dimensions.verticalSize.edgeVertical * 0.6,
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: screenHeight * 0.45,
                minHeight: screenHeight * 0.25,
              ),
              child: Container(
                padding: REdgeInsets.all(Dimensions.paddingSize * 0.8),
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(Dimensions.radius * 1.5),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: crossStart,
                    children: List.generate(
                      meal.instructions.length,
                          (index) => Column(
                        crossAxisAlignment: crossStart,
                        children: [
                          TextWidget(
                            'Step ${index + 1}',
                            fontWeight: FontWeight.bold,
                          ),
                          Space.height.v10,
                          TextWidget(
                            meal.instructions[index],
                            fontSize: Dimensions.titleSmall,
                            color: Colors.white70,
                          ),
                          if (index < meal.instructions.length - 1)
                            Space.height.v15,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}