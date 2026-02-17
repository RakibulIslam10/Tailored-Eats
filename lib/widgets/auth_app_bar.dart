import '../core/utils/basic_import.dart';
import '../routes/routes.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isBack;
  final bool fav;

  // Optional colors & styles
  final Color? backgroundColor;
  final Color? titleColor;
  final Color? iconColor;
  final bool isPrimary;

  // Existing skip flag
  final bool isSkip;

  // ✅ Optional custom actions
  final List<Widget>? actions;

  const CommonAppBar({
    super.key,
    required this.title,
    this.isBack = true,
    this.isPrimary = false,
    this.backgroundColor,
    this.titleColor,
    this.iconColor,
    this.isSkip = false,
    this.fav = false,
    this.actions,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.transparent,
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0,
      centerTitle: true,
      leading: isBack
          ? InkWell(
              borderRadius: BorderRadius.circular(Dimensions.radius), // radius
              onTap: () => Get.close(1),
              child: Icon(
                Icons.arrow_back_ios,
                color:
                    iconColor ??
                    (isPrimary
                        ? CustomColors.primary
                        : CustomColors.whiteColor),
              ),
            )
          : null,
      title: TextWidget(
        title,
        color:
            titleColor ??
            (isPrimary ? CustomColors.primary : CustomColors.whiteColor),
        fontSize: Dimensions.titleMedium * 1.2,
        fontWeight: FontWeight.w600,
      ),
      actions: [
        if (isSkip)
          InkWell(
            onTap: () {
              Get.offAllNamed(Routes.welcomeScreen);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.defaultHorizontalSize,
              ),
              child: TextWidget(
                'Skip',
                color: CustomColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        if (fav)
          InkWell(
            onTap: () {
              // // Handle favorite tap action
              // Get.snackbar('Favorite', 'Favorite tapped!');
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.defaultHorizontalSize,
              ),
              child: Icon(
               Icons.favorite, color: iconColor ?? Colors.red,
              ),
            ),
          ),
        if (actions != null) ...actions!,
      ],
    );
  }
}
