part of '../screen/profile_screen.dart';

class ProfileHeaderWidget extends GetView<ProfileController> {
  const ProfileHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(Dimensions.paddingSize * 0.5),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(Dimensions.radius),
      ),
      child: Row(
        children: [
          ProfileAvatarWidget(
            imageUrl: 'https://i.pravatar.cc/150?u=a042581f4e29026704d',
            size: 60,
            hasBorder: true,
          ),
          Space.width.v20,

          // Profile Info
          Expanded(
            child: Column(
              crossAxisAlignment: crossStart,
              children: [
                TextWidget(
                  'Md Tarek',
                  fontWeight: FontWeight.bold,
                  color: CustomColors.whiteColor,
                ),
                Space.height.v5,
                TextWidget(
                  'Lose weight',
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
  }
}
