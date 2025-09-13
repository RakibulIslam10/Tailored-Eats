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

            Container(
              color: Colors.cyan,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(
                      Dimensions.radius * 0.8,
                    ),
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpK1noS9RwpA351YDfG9dRCvSON-j5nZHU0A&s',
                      width: 100.w,
                      height: 80.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Space.height.v30,
          ],
        ),
      ),
    );
  }
}
