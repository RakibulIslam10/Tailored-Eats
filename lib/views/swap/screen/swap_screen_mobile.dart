part of 'swap_screen.dart';

class SwapScreenMobile extends GetView<SwapController> {
  SwapScreenMobile({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CommonAppBar(
        title: "Swap Your Meal",
        actions: [
          InkWell(
            onTap: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
            child: Padding(
              padding: Dimensions.defaultHorizontalSize.edgeRight,
              child: Icon(
                Icons.short_text_outlined,
                color: CustomColors.whiteColor,
              ),
            ),
          ),
        ],
      ),
      endDrawer: _buildFilterDrawer(),
      body: SafeArea(
        child: Obx(
          () => ListView.builder(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.defaultHorizontalSize,
            ),
            itemCount: controller.foods.length,
            itemBuilder: (context, index) {
              final food = controller.foods[index];
              return Padding(
                padding: EdgeInsets.only(bottom: Dimensions.heightSize),
                child: FoodCardWidget(
                  title: food["title"]!,
                  description: food["description"]!,
                  calories: food["calories"]!,
                  time: food["time"]!,
                  imageUrl: food["imageUrl"]!,
                  isShuffle: false,
                  onTap: () {
                    Get.toNamed(Routes.detailsScreen);
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  _buildFilterDrawer() {
    return Drawer(
      backgroundColor: CustomColors.blackColor,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(Dimensions.paddingSize * 0.6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SortByWidget(),
              SizedBox(height: Dimensions.heightSize * 2),

              PriceFilterWidget(),
              SizedBox(height: Dimensions.heightSize * 2),

              PrepTimeWidget(),
              SizedBox(height: Dimensions.heightSize * 2),

              MacrosSectionWidget(),
              ButtonSectionWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
