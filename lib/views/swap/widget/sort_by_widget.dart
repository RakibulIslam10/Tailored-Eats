part of '../screen/swap_screen.dart';

class SortByWidget extends GetView<SwapController> {
  const SortByWidget({super.key});

  @override
  Widget build(BuildContext context) {

    final filterController = Get.find<SwapController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          'Sort By',
          fontSize: Dimensions.titleMedium,
          fontWeight: FontWeight.w600,
          color: CustomColors.whiteColor,
        ),
        SizedBox(height: Dimensions.heightSize),
        Obx(() => Row(
          children: filterController.sortByOptions.map((option) {
            final isSelected = filterController.selectedSortBy.value == option;
            return Expanded(
              child: GestureDetector(
                onTap: () => filterController.selectSortBy(option),
                child: Container(
                  margin: EdgeInsets.only(
                    right: option == filterController.sortByOptions.first ? 8 : 0,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.horizontalSize / 2,
                    vertical: Dimensions.heightSize * 0.6,
                  ),
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
                    option,
                    textAlign: TextAlign.center,
                    fontSize: Dimensions.bodyMedium,
                    color: isSelected
                        ? CustomColors.whiteColor
                        : CustomColors.whiteColor.withOpacity(0.7),
                  ),
                ),
              ),
            );
          }).toList(),
        )),
      ],
    );
  }
}
