part of '../screen/home_screen.dart';

class TopTextHeaderWidget extends GetView<HomeController> {
  const TopTextHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        TextWidget(
          padding: EdgeInsetsGeometry.only(
            top: Dimensions.verticalSize * 0.8,
            bottom: Dimensions.heightSize * 0.25,
          ),
          'Hey ${controller.macrosModel.value?.data.name}, ready to crush today?',
          fontWeight: FontWeight.bold,
          fontSize: Dimensions.titleLarge * 0.8,
        ),
        TextWidget(
          'Your Goal: ${controller.macrosModel.value?.data.goal}',
          fontSize: Dimensions.titleSmall * 0.96,
          color: CustomColors.grayShade,
        ),
        Space.height.v20,
      ],
    );
  }
}
