part of 'consistency_screen.dart';

class ConsistencyScreenMobile extends GetView<ConsistencyController> {
  const ConsistencyScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Progression", isBack: false),
      body: SafeArea(
        child: ListView(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          children: [
            TextWidget(
              'Consistency',
              fontWeight: FontWeight.bold,
              padding: Dimensions.heightSize.edgeVertical,
            ),
            const CircularProgressWidget(percentage: 0.65),
            Space.height.v10,

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.10,
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
            Space.height.v10,
            TextWidget(
              'Monitor your weight',
              fontWeight: FontWeight.bold,
              padding: Dimensions.heightSize.edgeVertical,
            ),
            const WeightChartWidget(),
            ReusableImageProgress(
              title: 'Progress in Pictures',
              items: controller.items,
            ),
            Space.height.v30,
          ],
        ),
      ),
    );
  }
}
