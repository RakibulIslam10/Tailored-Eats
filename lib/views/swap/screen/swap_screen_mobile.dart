part of 'swap_screen.dart';

class SwapScreenMobile extends GetView<SwapController> {
  SwapScreenMobile({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CommonAppBar(
        title: controller.mealType,
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
              () {
            final meals = controller.filteredMealList;

            if (Get.find<NutritionController>().loadAllData.value) {
              return Center(
                child: CircularProgressIndicator(
                  color: CustomColors.primary,
                ),
              );
            }

            if (meals.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.restaurant_menu,
                      size: 80.h,
                      color: Colors.grey,
                    ),
                    Space.height.v20,
                    TextWidget(
                      'No meals found',
                      fontSize: Dimensions.titleMedium,
                      color: Colors.grey,
                    ),
                    Space.height.v10,
                    TextWidget(
                      'Try adjusting your filters',
                      fontSize: Dimensions.bodyMedium,
                      color: Colors.grey,
                    ),
                  ],
                ),
              );
            }

            return ListView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.defaultHorizontalSize,
              ),
              itemCount: meals.length,
              itemBuilder: (context, index) {
                final meal = meals[index];
                final nutritionController = Get.find<NutritionController>();

                return Padding(
                  padding: EdgeInsets.only(bottom: Dimensions.heightSize),
                  child: FoodCardWidget(
                    title: meal.mealName,
                    description: meal.description,
                    calories: "${meal.caloriesKcal} kcal",
                    time: "${meal.totalTimeMinutes} min",
                    imageUrl: nutritionController.getRandomImage(),
                    isShuffle: false,
                    meal: meal,
                    onTap: () {
                      Get.toNamed(Routes.detailsScreen, arguments: meal);
                    },
                  ),
                );
              },
            );          },
        ),
      ),
    );
  }

  Widget _buildFilterDrawer() {
    return Drawer(
      backgroundColor: CustomColors.blackColor, // ✅ White background recommended
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(Dimensions.paddingSize * 0.6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    'Filters',
                    fontSize: Dimensions.titleLarge,
                    fontWeight: FontWeight.bold,
                  ),
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(Icons.close),
                  ),
                ],
              ),
              Space.height.v20,
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SortByWidget(),
                      Space.height.v20,
                      PriceFilterWidget(),
                      Space.height.v20,

                      PrepTimeWidget(),
                      Space.height.v20,

                      MacrosSectionWidget(),
                    ],
                  ),
                ),
              ),
              ButtonSectionWidget(),
            ],
          ),
        ),
      ),
    );
  }
}