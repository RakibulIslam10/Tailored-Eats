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
        SvgPicture.asset(
          Assets.icons.notification,
          height: 20.h,
          width: 20.w,
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
                imageUrl: 'https://i.pravatar.cc/150?u=a042581f4e29026704d',
                fit: BoxFit.cover,
                height: 32.h,
                width: 32.w,
                placeholder: (context, url) =>
                    Container(color: Colors.grey.shade300),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
