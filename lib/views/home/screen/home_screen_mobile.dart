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

            Container(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: Dimensions.defaultHorizontalSize * 0.8,
                vertical: Dimensions.verticalSize * 0.8,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: CustomColors.grayShade),

                borderRadius: BorderRadiusGeometry.circular(
                  Dimensions.radius * 0.8,
                ),
              ),

              child: Row(
                children: [
                  const CalorieProgressWidget(totalCalories: 3000.0),

                  NutrientCard(
                    icon: Icons.rice_bowl,
                    title: 'Carbs',
                    value: '250',
                    unit: 'gm',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NutrientCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final String unit;

  const NutrientCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    const double cardSize = 110;
    return Container(

      width: cardSize,
      height: cardSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius * 0.95),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.deepPurple, Colors.green],
        ),
      ),
      child: Padding(
        padding:  EdgeInsets.all(Dimensions.paddingSize * 0.4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: REdgeInsets.all(1),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: CustomColors.grayShade, width: 1),
              ),
              child: Icon(
                icon,
                color: Colors.redAccent,
                size: Dimensions.iconSizeDefault, // bigger, visually balanced
              ),
            ),
            Space.height.v5,
            TextWidget(
              title,
              fontSize: Dimensions.titleSmall * 0.9,
              fontWeight: FontWeight.bold,
            ),
            const Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextWidget(
                  value,
                  fontSize: Dimensions.titleSmall * 1.0,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(width: 4),
                Padding(
                  padding: const EdgeInsets.only(bottom: 2.0),
                  child: TextWidget(
                    unit,
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
    );
  }
}
