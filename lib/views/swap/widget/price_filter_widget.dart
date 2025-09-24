part of '../screen/swap_screen.dart';

class PriceFilterWidget extends GetView<SwapController> {
  const PriceFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final filterController = Get.find<SwapController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          'Price filter',
          fontSize: Dimensions.titleMedium,
          fontWeight: FontWeight.w600,
          color: CustomColors.whiteColor,
        ),
        SizedBox(height: Dimensions.heightSize),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    'Min',
                    fontSize: Dimensions.bodySmall,
                    color: CustomColors.whiteColor.withOpacity(0.7),
                  ),
                  SizedBox(height: 4),
                  Obx(() => Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: CustomColors.whiteColor.withOpacity(0.3),
                      ),
                      borderRadius: BorderRadius.circular(Dimensions.radius / 2),
                    ),
                    child: TextWidget(
                      '\$${filterController.minPrice.value.toInt()}',
                      fontSize: Dimensions.bodyMedium,
                      color: CustomColors.whiteColor,
                    ),
                  )),
                ],
              ),
            ),
            SizedBox(width: 16),
            Container(
              width: 20,
              height: 1,
              color: CustomColors.whiteColor.withOpacity(0.3),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    'Max',
                    fontSize: Dimensions.bodySmall,
                    color: CustomColors.whiteColor.withOpacity(0.7),
                  ),
                  SizedBox(height: 4),
                  Obx(() => Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: CustomColors.whiteColor.withOpacity(0.3),
                      ),
                      borderRadius: BorderRadius.circular(Dimensions.radius / 2),
                    ),
                    child: TextWidget(
                      '\$${filterController.maxPrice.value.toInt()}',
                      fontSize: Dimensions.bodyMedium,
                      color: CustomColors.whiteColor,
                    ),
                  )),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: Dimensions.heightSize),
        Obx(() => RangeSlider(
          values: RangeValues(
              filterController.minPrice.value,
              filterController.maxPrice.value
          ),
          min: filterController.minPriceLimit,
          max: filterController.maxPriceLimit,
          activeColor: CustomColors.whiteColor,
          inactiveColor: CustomColors.whiteColor.withOpacity(0.3),
          onChanged: (RangeValues values) {
            filterController.updateMinPrice(values.start);
            filterController.updateMaxPrice(values.end);
          },
        )),
      ],
    );
  }
}
