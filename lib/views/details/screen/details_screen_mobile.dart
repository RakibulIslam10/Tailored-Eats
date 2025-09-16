part of 'details_screen.dart';

class DetailsScreenMobile extends GetView<DetailsController> {
  const DetailsScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: PrimaryButtonWidget(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.defaultHorizontalSize,
          vertical: Dimensions.verticalSize,
        ),
        title: 'I Ate this',
        onPressed: () {},
      ),
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: CommonAppBar(title: "Details"),
      body: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(Dimensions.radius),
                child: CachedNetworkImage(
                  imageUrl:
                      'https://www.allrecipes.com/thmb/SoBuPU73KcbYHl3Kp3j8Xx4A3fc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/8805-CrispyFriedChicken-mfs-3x2-072-d55b8406d4ae45709fcdeb58a04143c2.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
                  placeholder: (context, url) =>
                      Container(color: Colors.grey.shade100),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey.shade100,
                    child: Icon(
                      Icons.image_not_supported,
                      size: Dimensions.iconSizeLarge * 1.2,
                    ),
                  ),
                ),
              ),

              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.5), // subtle black
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ],
          ),
          TextWidget(
            padding: Dimensions.heightSize.edgeTop,
            'Delicious lobster gourmet ',
            fontWeight: FontWeight.bold,
            fontSize: Dimensions.titleLarge * 0.9,
          ),

          Container(
            margin: EdgeInsetsGeometry.symmetric(
              vertical: Dimensions.verticalSize * 0.5,
            ),
            padding: REdgeInsets.symmetric(
              horizontal: Dimensions.paddingSize * 0.4,

              vertical: Dimensions.verticalSize * 0.15,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadiusGeometry.circular(Dimensions.radius),

              color: Colors.white12,
            ),
            child: TextWidget('Breakfast'),
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.defaultHorizontalSize * 2,
            ),
            child: Row(
              mainAxisAlignment: mainSpaceBet,
              crossAxisAlignment: crossCenter,
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,

                  children: [
                    SvgPicture.asset(
                      Assets.icons.calories,
                      color: CustomColors.grayShade,
                      height: 18.h,
                    ),
                    TextWidget(
                      '271 Kcal',
                      fontSize: Dimensions.titleSmall * 0.9,
                      color: CustomColors.grayShade,
                      padding: Dimensions.widthSize.edgeLeft * 0.5,
                    ),
                  ],
                ),
                Container(
                  height: 18.h,
                  color: CustomColors.grayShade,
                  width: 1,
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,

                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      size: Dimensions.iconSizeLarge * 0.8,
                      color: CustomColors.grayShade,
                    ),
                    TextWidget(
                      '15 min',
                      fontSize: Dimensions.titleSmall * 0.9,
                      color: CustomColors.grayShade,
                      padding: Dimensions.widthSize.edgeLeft * 0.5,
                    ),
                  ],
                ),
                Container(
                  height: 18.h,
                  color: CustomColors.grayShade,
                  width: 1,
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Icon(
                      Icons.wallet,
                      size: Dimensions.iconSizeLarge * 0.8,
                      color: CustomColors.grayShade,
                    ),
                    TextWidget(
                      '\$125',
                      fontSize: Dimensions.titleSmall * 0.9,
                      color: CustomColors.grayShade,
                      padding: Dimensions.widthSize.edgeLeft * 0.5,
                    ),
                  ],
                ),
              ],
            ),
          ),

          TextWidget(
            padding: EdgeInsetsGeometry.symmetric(
              vertical: Dimensions.verticalSize * 0.5,
              horizontal: Dimensions.defaultHorizontalSize,
            ),
            'This classic French dish features lobster meat cooked in a creamy, wine-based sauce and returned to its shell to be broiled with a cheesy topping.',
            color: CustomColors.grayShade,
            textAlign: TextAlign.center,
            fontSize: Dimensions.titleSmall * 0.9,
            maxLines: 3,
          ),
          Column(
            crossAxisAlignment: crossStart,
            children: [
              TextWidget(
                'Macros per serving',
                fontWeight: FontWeight.bold,
                padding: Dimensions.verticalSize.edgeVertical * 0.6,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  cacheExtent: 500,
                  itemBuilder: (context, index) {
                    // final calorieItem = controller.caloriesList[index];
                    return CaloriesCard(
                      iconPath: Assets.icons.calories,
                      title: 'Calories',
                      value: '150',
                      unit: 'gm',
                      progress: controller.progress,
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
