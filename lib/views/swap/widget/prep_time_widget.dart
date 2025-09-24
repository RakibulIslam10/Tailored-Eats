part of '../screen/swap_screen.dart';

class PrepTimeWidget extends GetView<SwapController> {
  const PrepTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final filterController = Get.find<SwapController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          'Sort By Prep Time',
          fontSize: Dimensions.titleMedium,
          fontWeight: FontWeight.w600,
          color: CustomColors.whiteColor,
        ),
        SizedBox(height: Dimensions.heightSize),
        Obx(() => Wrap(
          runSpacing: 8,
          spacing: 8,
          children: filterController.prepTimeOptions.map((prepTime) {
            final isSelected = filterController.isPrepTimeSelected(prepTime);
            return GestureDetector(
              onTap: () => filterController.togglePrepTime(prepTime),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected
                      ? CustomColors.whiteColor.withOpacity(0.1)
                      : Colors.transparent,
                  border: Border.all(
                    color: isSelected
                        ? CustomColors.whiteColor
                        : CustomColors.whiteColor.withOpacity(0.3),
                  ),
                  borderRadius: BorderRadius.circular(Dimensions.radius / 2),
                ),
                child: TextWidget(
                  prepTime,
                  fontSize: Dimensions.bodyMedium,
                  color: isSelected
                      ? CustomColors.whiteColor
                      : CustomColors.whiteColor.withOpacity(0.7),
                ),
              ),
            );
          }).toList(),
        )),
      ],
    );
  }
}
