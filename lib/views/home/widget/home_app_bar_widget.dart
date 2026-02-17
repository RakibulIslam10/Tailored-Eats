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
        Obx(() {
          final image = controller.macrosModel.value?.data.image;
          final validImage = image != null && image.isNotEmpty;

          return InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () => Get.toNamed(Routes.profileScreen),
            child: Container(
              margin: Dimensions.defaultHorizontalSize.edgeHorizontal,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: CustomColors.primary, width: 2),
              ),
              child: ClipOval(
                child: validImage
                    ? CachedNetworkImage(
                  imageUrl: '${ApiEndPoints.mainDomain}/$image',
                  fit: BoxFit.cover,
                  height: 32.h,
                  width: 32.w,
                  errorWidget: (_, __, ___) => Icon(Icons.person, size: 28.sp),
                  placeholder: (_, __) => Icon(Icons.person, size: 28.sp),
                )
                    : Icon(Icons.person, size: 28.sp),
              ),
            ),
          );
        }),
      ],
    );
  }
}