part of '../screen/profile_screen.dart';

class MenuItemsCardWidget extends GetView<ProfileController> {
  const MenuItemsCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildMenuItem(
          icon: Icons.credit_card_outlined,
          title: 'Subscription',
          onTap: () {
            // Handle subscription tap
          },
        ),
        Space.height.v20,
        _buildMenuItem(
          icon: Icons.restaurant_outlined,
          title: 'Nutrition & Goals',
          onTap: () {
            // Handle nutrition tap
          },
        ),
        Space.height.v20,
        _buildMenuItem(
          icon: Icons.settings_outlined,
          title: 'Settings',
          onTap: () => Get.toNamed(Routes.settingScreen),
        ),
        Space.height.v100,
        Space.height.v100,
        Space.height.v100,
        _buildMenuItem(
          icon: Icons.logout,
          title: 'Log Out',
          onTap: () {
            // Handle settings tap
          },
        ),
      ],
    );
  }

  _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(Dimensions.paddingSize * 0.5),
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(Dimensions.radius),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: CustomColors.whiteColor,
              size: Dimensions.iconSizeLarge,
            ),
            Space.width.v20,
            Expanded(
              child: TextWidget(
                title,
                fontSize: Dimensions.titleMedium,
                fontWeight: FontWeight.w500,
                color: CustomColors.whiteColor,
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: CustomColors.secondaryDarkText,
              size: Dimensions.iconSizeLarge,
            ),
          ],
        ),
      ),
    );
  }
}
