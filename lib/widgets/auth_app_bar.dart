import '../core/utils/basic_import.dart';
import '../routes/routes.dart';


class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isBack;

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
        onTap: () => Get.back(),
        child: Icon(
          Icons.arrow_back_ios,
          color: iconColor ??
              (isPrimary ? CustomColors.primary : CustomColors.whiteColor),
        ),
      )
          : null,
      title: TextWidget(
        title,
        color: titleColor ??
            (isPrimary ? CustomColors.primary : CustomColors.whiteColor),
        fontSize: Dimensions.titleMedium * 1.2,
        fontWeight: FontWeight.w600,
      ),
      actions: [
        // ✅ Show Skip if isSkip is true
        if (isSkip)
          InkWell(
            onTap: () {
              // default skip action
              Get.offAllNamed(Routes.welcomeScreen);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.defaultHorizontalSize),
              child: TextWidget(
                'Skip',
                color: CustomColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

        if (actions != null) ...actions!,
      ],
    );
  }
}
