part of 'home_screen.dart';

class HomeScreenMobile extends GetView<HomeController> {
  const HomeScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Dimensions.appBarHeight),
        child: HomeAppBarWidget(),
      ),
      body: SafeArea(
        child: ListView(
          physics: ClampingScrollPhysics(),
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          children: [
            TopTextHeaderWidget(),
            TextWidget(
              'Your Total Daily macros',
              fontWeight: FontWeight.bold,
              padding: Dimensions.heightSize.edgeBottom,
            ),
            const NutrientCardWidget(),
            Space.height.v10,
            TextWidget(
              'How consistent are you?',
              fontWeight: FontWeight.bold,
              padding: Dimensions.heightSize.edgeVertical,
            ),
            const CircularProgressWidget(percentage: 0.65),
            Space.height.v10,

            // Horizontal ListView
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.10,
              child: RepaintBoundary(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 10,
                  cacheExtent: 300,
                  addAutomaticKeepAlives: false,
                  addRepaintBoundaries: true,
                  itemBuilder: (context, index) => RepaintBoundary(
                    child: StudyProgressWidget(
                      percentage: 0.92,
                      date: '27 July',
                    ),
                  ),
                ),
              ),
            ),
            RepaintBoundary(child: const FriendsProgressWidget()),
            TextWidget(
              'Your Next Bite',
              fontWeight: FontWeight.bold,
              padding: Dimensions.heightSize.edgeVertical,
            ),
            RepaintBoundary(
              child: Obx(
                () => AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) =>
                      FadeTransition(opacity: animation, child: child),
                  child: FoodCardWidget(
                    key: ValueKey(controller.currentFood["title"]),
                    title: controller.currentFood["title"] ?? "",
                    description: controller.currentFood["description"] ?? "",
                    calories: controller.currentFood["calories"] ?? "",
                    time: controller.currentFood["time"] ?? "",
                    imageUrl: controller.currentFood["imageUrl"] ?? "",
                    isShuffle: true,
                    onShuffle: controller.shuffleList,
                    onTap: () {
                      Get.toNamed(Routes.detailsScreen);
                    },
                  ),
                ),
              ),
            ),
            TextWidget(
              "Don't Forget Your Daily Goal",
              fontWeight: FontWeight.bold,
              padding: Dimensions.heightSize.edgeVertical * 1.5,
            ),
            TaskListWidget(),
            // Space.height.v20,
            WeightWidget(
              homeController: controller,
              onSave: controller.saveWeight,
            ),
            Space.height.v30,
          ],
        ),
      ),
    );
  }
}
