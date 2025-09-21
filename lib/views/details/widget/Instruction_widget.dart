part of '../screen/details_screen.dart';

class InstructionWidget extends GetView<DetailsController> {
  const InstructionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          TextWidget(
            'Instruction',
            fontWeight: FontWeight.bold,
            padding: Dimensions.verticalSize.edgeVertical * 0.6,
          ),

          Container(
            height: 430.h,
            padding: REdgeInsets.all(Dimensions.paddingSize * 0.8),
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.circular(Dimensions.radius * 1.5),
            ),
            child: Column(
              children: List.generate(
                3,
                (index) => Column(
                  crossAxisAlignment: crossStart,
                  children: [
                    TextWidget(
                      'Step : 0${index + 1}',
                      fontWeight: FontWeight.bold,
                    ),
                    Space.height.v10,
                    TextWidget(
                      "Prep the lobster: Cut the cooked lobster in half lengthwise and remove the meat from the tail and claws. Chop the meat into bite-sized pieces and set aside the shells.",
                      fontSize: Dimensions.titleSmall,
                      color: Colors.white38,
                    ),

                    Space.height.v10,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
