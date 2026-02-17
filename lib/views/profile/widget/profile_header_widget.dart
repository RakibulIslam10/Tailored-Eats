part of '../screen/profile_screen.dart';

class ProfileHeaderWidget extends GetView<ProfileController> {
  const ProfileHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final homeController = Get.find<HomeController>();
      final image = homeController.macrosModel.value?.data.image;
      final validImage = image != null && image.isNotEmpty;

      return Container(
        padding: REdgeInsets.all(Dimensions.paddingSize * 0.5),
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(Dimensions.radius),
        ),
        child: Row(
          children: [
            ProfileAvatarWidget(
              imageUrl: validImage ? '${ApiEndPoints.mainDomain}/$image' : '',
              size: 60,
              hasBorder: true,
            ),
            Space.width.v20,
            Expanded(
              child: Column(
                crossAxisAlignment: crossStart,
                children: [
                  TextWidget(
                    homeController.macrosModel.value?.data.name ?? '',
                    fontWeight: FontWeight.bold,
                    color: CustomColors.whiteColor,
                  ),
                  Space.height.v5,
                  TextWidget(
                    homeController.macrosModel.value?.data.goal ?? '',
                    fontSize: Dimensions.titleSmall,
                    color: CustomColors.secondaryDarkText,
                  ),
                ],
              ),
            ),

            // Edit Button
            InkWell(
              onTap: () => Get.toNamed(Routes.updateProfileScreen),
              child: Container(
                padding: EdgeInsets.all(Dimensions.paddingSize * 0.25),
                decoration: BoxDecoration(
                  color: CustomColors.blackColor,
                  borderRadius: BorderRadius.circular(Dimensions.radius),
                ),
                child: Icon(
                  Icons.edit_outlined,
                  color: CustomColors.whiteColor,
                  size: Dimensions.iconSizeLarge,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}