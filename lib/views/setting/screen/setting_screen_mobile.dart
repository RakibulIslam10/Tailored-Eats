part of 'setting_screen.dart';

class SettingScreenMobile extends GetView<SettingController> {
  const SettingScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Settings"),
      body: SafeArea(
        child: ListView(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          children: [
            Space.height.v10,
            _buildMenuItem(
              icon: Icons.password,
              title: 'Change Password',
              onTap: () => Get.toNamed(Routes.changePasswordScreen),
            ),
            _buildMenuItem(
              icon: Icons.support_agent,
              title: 'Contact Support',
              onTap: () => Get.toNamed(Routes.supportScreen),
            ),
            _buildMenuItem(
              icon: Icons.report_gmailerrorred,
              title: 'Report Problem',
              onTap: () => Get.toNamed(Routes.reportScreen),
            ),
            _buildMenuItem(
              icon: Icons.question_mark_rounded,
              title: 'FAQ',
              onTap: () => Get.toNamed(Routes.faqScreen),
            ),
            _buildMenuItem(
              icon: Icons.privacy_tip_outlined,
              title: 'Privacy Policy',
              onTap: () => Get.toNamed(Routes.policyScreen),
            ),
            _buildMenuItem(
              icon: Icons.workspace_premium_outlined,
              title: 'Terms & Condition',
              onTap: () => Get.toNamed(Routes.termsScreen),
            ),
            _buildMenuItem(
              icon: Icons.manage_accounts_outlined,
              title: 'Delete Account',
              onTap: () {
                Get.dialog(
                  AlertDialog(
                    backgroundColor: CustomColors.blackColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        Dimensions.radius * 0.8,
                      ),
                    ),
                    title: TextWidget(
                      ' Delete Account',
                      fontSize: Dimensions.titleLarge,
                      fontWeight: FontWeight.w500,
                    ),
                    content: const TextWidget(
                      'Are you sure you want to Delete Your Account?',
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(
                              Dimensions.radius * 0.8,
                            ),
                          ),
                        ),
                        child: TextWidget('No', color: CustomColors.whiteColor),
                      ),

                      ElevatedButton(
                        onPressed: () {
                          AppStorage.clear();
                          controller.deleteAccountProcess();                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColors.whiteColor,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: CustomColors.rejected),
                            borderRadius: BorderRadiusGeometry.circular(
                              Dimensions.radius * 0.8,
                            ),
                          ),
                        ),
                        child: TextWidget('Yes', color: CustomColors.rejected),
                      ),
                    ],
                  ),
                  barrierDismissible: true,
                );
              },
            ),
          ],
        ),
      ),
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
        margin: Dimensions.heightSize.edgeBottom * 1.5,
        padding: EdgeInsets.all(Dimensions.paddingSize * 0.6),
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
