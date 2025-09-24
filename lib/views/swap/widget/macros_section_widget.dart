part of '../screen/swap_screen.dart';

class MacrosSectionWidget extends GetView<SwapController> {
  const MacrosSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final filterController = Get.find<SwapController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          'Sort By Macros',
          fontSize: Dimensions.titleMedium,
          fontWeight: FontWeight.w600,
          color: CustomColors.whiteColor,
        ),
        SizedBox(height: Dimensions.heightSize),
        Obx(
          () => Column(
            children: filterController.macroOptions.map((macro) {
              final isSelected = filterController.isMacroSelected(macro);
              return Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: GestureDetector(
                  onTap: () => filterController.toggleMacro(macro),
                  child: Row(
                    children: [
                      Container(
                        width: 20.w,
                        height: 20.h,
                        margin: EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? CustomColors.whiteColor
                              : Colors.transparent,
                          border: Border.all(
                            color: CustomColors.whiteColor.withOpacity(0.5),
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: isSelected
                            ? Icon(
                                Icons.check,
                                color: CustomColors.blackColor,
                                size: 16,
                              )
                            : null,
                      ),
                      TextWidget(
                        macro,
                        fontSize: Dimensions.bodyMedium,
                        color: isSelected
                            ? CustomColors.whiteColor
                            : CustomColors.whiteColor.withOpacity(0.7),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
