part of 'home_screen.dart';

class HomeScreenMobile extends GetView<HomeController> {
  const HomeScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.blackColor,
        leading: Image.asset(Assets.dummy.logo.path, height: 10.h, width: 10.w),
        actions: [
          SvgPicture.asset(
            Assets.icons.notification,
            height: 20.h,
            width: 20.w,
          ),
          Container(
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
        ],
      ),

      body: SafeArea(
        child: ListView(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          children: [
            TextWidget(
              padding: EdgeInsetsGeometry.only(
                top: Dimensions.verticalSize,
                bottom: Dimensions.heightSize * 0.25,
              ),
              'Hey Rakib, ready to crush today?',
              fontWeight: FontWeight.bold,
              fontSize: Dimensions.titleLarge * 0.8,
            ),
            TextWidget(
              'Hey Rakib, ready to crush today?',
              fontSize: Dimensions.titleSmall * 0.96,
              color: CustomColors.grayShade,
            ),
            Space.height.v20,
            TextWidget(
              'NutrientCardWidget',
              fontWeight: FontWeight.bold,
              padding: Dimensions.heightSize.edgeBottom,
            ),
            NutrientCardWidget(),
            TextWidget(
              'Calories Remaining For Today',
              fontWeight: FontWeight.bold,
              padding: Dimensions.verticalSize.edgeVertical * 0.6,
            ),
           Container(
             width: 90.w,
             height: 80.h,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(Dimensions.radius * 0.95),
               gradient: const LinearGradient(
                 begin: Alignment.topLeft,
                 end: Alignment.bottomRight,
                 colors: [
                   Color(0xFF5F0F40), // Darker shade of your pink #F826A4
                   Color(0xFF1A4D62), // Darker shade of your blue #26C4F8
                   Color(0xFF1A5A2B), // Darker shade of your green #26F865
                 ],
               ),
               boxShadow: [
                 BoxShadow(
                   color: Colors.black.withOpacity(0.25), // shadow color
                   offset: const Offset(4, 6), // shadow position (x,y)
                   blurRadius: 12, // how soft the shadow
                   spreadRadius: 2, // shadow thickness
                 ),
               ],
             ),
             child: ClipRRect(
               borderRadius: BorderRadius.circular(Dimensions.radius * 0.95),
               child: Stack(
                 children: [
                   /// blur layer
                   BackdropFilter(
                     filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                     child: Container(
                       color: Colors.white.withOpacity(
                         0.08,
                       ), // light frosted overlay
                     ),
                   ),

                   /// actual content
                   Padding(
                     padding: EdgeInsets.all(Dimensions.paddingSize * 0.4),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Container(
                           padding: REdgeInsets.all(1),
                           decoration: BoxDecoration(
                             shape: BoxShape.circle,
                             border: Border.all(
                               color: CustomColors.grayShade,
                               width: 1,
                             ),
                           ),
                           child: Icon(
                             Icons.add_circle,
                             color: Colors.redAccent,
                             size: Dimensions.iconSizeDefault,
                           ),
                         ),
                         Space.height.v5,
                         TextWidget(
                           padding: EdgeInsetsGeometry.only(
                             bottom: Dimensions.heightSize * 0.2,
                           ),
                           'title',
                           fontSize: Dimensions.titleSmall * 0.8,
                           fontWeight: FontWeight.w500,
                         ),

                         Row(
                           crossAxisAlignment: CrossAxisAlignment.end,
                           children: [
                             TextWidget(
                               'value',
                               fontSize: Dimensions.titleSmall * 1.0,
                               fontWeight: FontWeight.bold,
                             ),
                             const SizedBox(width: 4),
                             Padding(
                               padding: const EdgeInsets.only(bottom: 2.0),
                               child: TextWidget(
                                 'unit',
                                 fontSize: Dimensions.titleSmall * 0.7,
                                 fontWeight: FontWeight.w500,
                                 color: CustomColors.grayShade,
                               ),
                             ),
                           ],
                         ),
                       ],
                     ),
                   ),
                 ],
               ),
             ),
           )
          ],
        ),
      ),
    );
  }
}
