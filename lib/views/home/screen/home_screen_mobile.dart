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
          behavior: _CustomScrollBehavior(), // 👈 Facebook/LinkedIn style
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
              const StudyProgressWidget(),
              const FriendsProgressWidget(),
              TextWidget(
                'Your Next Bite',
                fontWeight: FontWeight.bold,
                padding: Dimensions.heightSize.edgeVertical,
              ),
              const FoodCardWidget(),
              TextWidget(
                'Don’t Forget Your Daily Goal',
                fontWeight: FontWeight.bold,
                padding: Dimensions.heightSize.edgeVertical,
              ),              const TaskListWidget(),
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
      BuildContext context, Widget child, ScrollableDetails details) {
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
