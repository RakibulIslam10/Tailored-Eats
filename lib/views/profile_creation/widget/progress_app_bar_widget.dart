part of '../screen/profile_creation_screen.dart';

class ProgressAppBarWidget extends GetView<ProfileCreationController> {
  const ProgressAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.defaultHorizontalSize,
        ),
        child: Column(
          crossAxisAlignment: crossStart,
          children: [
            InkWell(
              onTap: () => controller.previousStep(),
              child: Icon(
                Icons.arrow_back_ios,
                color: CustomColors.whiteColor,
              ),
            ),
            Space.height.v20,
            Obx(() {
              return ProgressBar(
                currentStep: controller.currentStep.value,
                totalSteps: controller.totalSteps,
              );
            }),
          ],
        ),
      ),
    );
  }
}
