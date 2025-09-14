part of 'consistency_screen.dart';

class ConsistencyScreenMobile extends GetView<ConsistencyController> {
  const ConsistencyScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Consistency", isBack: false),
      body: SafeArea(
        child: ListView(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          children: [
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
            Space.height.v10,
            const WeightChartWidget(),
          ],
        ),
      ),
    );
  }
}
