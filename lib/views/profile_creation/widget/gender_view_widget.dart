part of '../screen/profile_creation_screen.dart';

class GenderViewWidget extends GetView<ProfileCreationController> {
  const GenderViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: mainSpaceBet,
        children: [
          Space.height.v10,
          TextWidget(
            'What’s your gender ?',
            textAlign: TextAlign.center,
            fontSize: Dimensions.titleLarge,
            fontWeight: FontWeight.bold,
          ),

          Space.height.v100,

          Column(
            children: [
              InkWell(
                onTap: () {
                  controller.setGender('Male');
                  if (controller.currentStep.value <
                      controller.totalSteps - 1) {
                    controller.currentStep.value++;
                  } else {
                    Get.toNamed(Routes.navigationScreen);
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: Dimensions.verticalSize.edgeVertical * 0.6,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadiusGeometry.circular(
                      Dimensions.radius * 0.85,
                    ),
                  ),

                  child: TextWidget("Male", fontWeight: FontWeight.w500),
                ),
              ),
              Space.height.v20,
              InkWell(
                onTap: () {
                  controller.setGender('Female');
                  if (controller.currentStep.value <
                      controller.totalSteps - 1) {
                    controller.currentStep.value++;
                  } else {
                    Get.toNamed(Routes.navigationScreen);
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: Dimensions.verticalSize.edgeVertical * 0.6,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadiusGeometry.circular(
                      Dimensions.radius * 0.85,
                    ),
                  ),

                  child: TextWidget("Female", fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          Space.height.v100,
          Space.height.v100,

          SizedBox(),
        ],
      ),
    );
  }
}
