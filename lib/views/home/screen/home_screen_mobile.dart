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
        child: ScrollConfiguration(
          behavior: _CustomScrollBehavior(),
          child: CustomScrollView(
            physics: const _OptimizedScrollPhysics(),
            cacheExtent: 500,
            slivers: [
              SliverPadding(
                padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    RepaintBoundary(child: const TopTextHeaderWidget()),
                    TextWidget(
                      'Your Total Daily macros',
                      fontWeight: FontWeight.bold,
                      padding: Dimensions.heightSize.edgeBottom,
                    ),
                    RepaintBoundary(child: const NutrientCardWidget()),
                    RepaintBoundary(child: const CaloriesRemainingWidget()),
                    Space.height.v20,
                    RepaintBoundary(
                      child: const CircularProgressWidget(percentage: 0.65),
                    ),
                    TextWidget(
                      'How Steady Have You Been?',
                      fontWeight: FontWeight.bold,
                      padding: Dimensions.heightSize.edgeVertical,
                    ),
                    // Horizontal ListView
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.12,
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
                            description:
                                controller.currentFood["description"] ?? "",
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
                      padding: Dimensions.heightSize.edgeVertical,
                    ),
                    RepaintBoundary(child: const TaskListWidget()),
                    WeightWidget(
                      homeController: controller,
                      onSave: controller.saveWeight,
                    ),
                    Space.height.v30,
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// ✅ Enhanced scroll behavior with better performance
class _CustomScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child;
  }

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const _OptimizedScrollPhysics();
  }
}

/// ✅ Optimized scroll physics for smoother performance
class _OptimizedScrollPhysics extends ClampingScrollPhysics {
  const _OptimizedScrollPhysics({super.parent});

  @override
  _OptimizedScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return _OptimizedScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  double get minFlingVelocity => 100.0; // Slightly higher for smoother start
  @override
  double get maxFlingVelocity => 5000.0; // Reduced for better control
  @override
  double get dragStartDistanceMotionThreshold => 2.0; // More responsive

  // ✅ Better friction for smoother deceleration
  @override
  double get frictionFactor => 0.015; // Default is 0.015, can adjust
}
