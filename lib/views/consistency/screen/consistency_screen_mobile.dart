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
            CircularProgressWidget(
              percentage:
                  double.tryParse(
                    "${Get.find<HomeController>().consistencyModel?.data.todayCompleted.percentage}",
                  ) ??
                  0.0,
            ),
            Space.height.v10,

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.10,
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                children: List.generate(
                  math.min(
                    6,
                    Get.find<HomeController>().friendsProgressList.length,
                  ),
                  (index) => StudyProgress(
                    percentage: Helpers.parseDouble(
                      Get.find<HomeController>()
                          .friendsProgressList[index]
                          .completed,
                    ),
                    date: Helpers.formatDate(
                      Get.find<HomeController>()
                          .friendsProgressList[index]
                          .createdAt
                          .toString(),
                    ),
                  ),
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
