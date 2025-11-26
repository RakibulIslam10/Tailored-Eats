part of '../screen/home_screen.dart';

class HomeAppBarWidget extends GetView<HomeController> {
  const HomeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: CustomColors.blackColor,
      leading: Image.asset(Assets.dummy.logo.path, height: 10.h, width: 10.w),
      actions: [
        InkWell(
          borderRadius: BorderRadius.circular(Dimensions.radius * 0.2),
          onTap: () => Get.toNamed(Routes.notificationScreen),
          child: SvgPicture.asset(
            Assets.icons.notification,
            height: 22.h,
            width: 22.w,
          ),
        ),
        InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () => Get.toNamed(Routes.profileScreen),
          child: Container(
            margin: Dimensions.defaultHorizontalSize.edgeHorizontal,
            // padding: EdgeInsets.all(Dimensions.paddingSize * 0.1),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: CustomColors.primary, width: 2),
            ),
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl:
                    "https://www.cornwallbusinessawards.co.uk/wp-content/uploads/2017/11/dummy450x450.jpg",
                fit: BoxFit.cover,
                height: 32.h,
                width: 32.w,
                errorWidget: (context, url, error) =>
                    Container(color: Colors.grey.shade400),
                placeholder: (context, url) => Container(
                  color: Colors.grey.shade300,
                  child: Icon(Icons.error, color: Colors.red),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
