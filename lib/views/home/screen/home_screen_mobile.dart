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
          physics: BouncingScrollPhysics(),
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
            Space.height.v30,
          ],
        ),
      ),
    );
  }
}
