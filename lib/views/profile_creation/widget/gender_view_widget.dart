part of '../screen/profile_creation_screen.dart';

class GenderViewWidget extends GetView<ProfileCreationController> {
  const GenderViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextWidget(
            'How Do You Identify Yourself ?',
            fontSize: Dimensions.titleLarge,
            fontWeight: FontWeight.bold,
          ),

          Space.height.v100,

          InkWell(
            onTap: () {
              controller.setGender('Male');
              controller.nextStep();
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
              controller.nextStep();
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
    );
  }
}
