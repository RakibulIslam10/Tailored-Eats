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
          child: ListView(
            physics: const _SmoothScrollPhysics(),
            padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
            children: [
              const TopTextHeaderWidget(),
              TextWidget(
                'Your Total Daily macros',
                fontWeight: FontWeight.bold,
                padding: Dimensions.heightSize.edgeBottom,
              ),
              const NutrientCardWidget(),
              const CaloriesRemainingWidget(),
              Space.height.v20,
              const CircularProgressWidget(percentage: 0.65),
              TextWidget(
                'How Steady Have You Been?',
                fontWeight: FontWeight.bold,
                padding: Dimensions.heightSize.edgeVertical,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.12,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  children: List.generate(
                    10,
                    (index) =>
                        StudyProgressWidget(percentage: 0.92, date: '27 July'),
                  ),
                ),
              ),

              const FriendsProgressWidget(),
              TextWidget(
                'Your Next Bite',
                fontWeight: FontWeight.bold,
                padding: Dimensions.heightSize.edgeVertical,
              ),
              Obx(
                () => AnimatedSwitcher(
                  duration: const Duration(milliseconds: 400),
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

              TextWidget(
                'Don’t Forget Your Daily Goal',
                fontWeight: FontWeight.bold,
                padding: Dimensions.heightSize.edgeVertical,
              ),
              const TaskListWidget(),
              Space.height.v30,
            ],
          ),
        ),
      ),
    );
  }
}

/// 👇 custom behavior (no glow, smoother scroll feel)
class _CustomScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child; // overscroll glow remove (like FB/LinkedIn)
  }
}

/// 👇 custom physics for smoother inertia scroll
class _SmoothScrollPhysics extends ClampingScrollPhysics {
  const _SmoothScrollPhysics({super.parent});

  @override
  _SmoothScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return _SmoothScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  double get minFlingVelocity => 50.0; // smoother fling start
  @override
  double get maxFlingVelocity => 8000.0; // natural fast scroll
  @override
  double get dragStartDistanceMotionThreshold => 3.5; // softer drag
}
