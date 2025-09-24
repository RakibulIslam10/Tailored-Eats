part of '../screen/swap_screen.dart';

class ButtonSectionWidget extends GetView<SwapController> {
  const ButtonSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final filterController = Get.find<SwapController>();

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: () => filterController.clearAllFilters(),
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius),
                side: BorderSide(
                  color: CustomColors.whiteColor.withOpacity(0.3),
                ),
              ),
            ),
            child: TextWidget(
              'Clear All Filters',
              fontSize: Dimensions.titleMedium,
              fontWeight: FontWeight.w500,
              color: CustomColors.whiteColor.withOpacity(0.8),
            ),
          ),
        ),

        SizedBox(height: Dimensions.heightSize),

        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              filterController.applyFilters();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: CustomColors.whiteColor,
              foregroundColor: CustomColors.blackColor,
              padding: EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius),
              ),
            ),
            child: TextWidget(
              'Apply Filters',
              fontSize: Dimensions.titleMedium,
              fontWeight: FontWeight.w600,
              color: CustomColors.blackColor,
            ),
          ),
        ),
      ],
    );
  }
}
