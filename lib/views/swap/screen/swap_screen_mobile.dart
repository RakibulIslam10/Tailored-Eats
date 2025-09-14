part of 'swap_screen.dart';

class SwapScreenMobile extends GetView<SwapController> {
  const SwapScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Swap"),
      body: SafeArea(
        child: Obx(
              () => ListView.builder(
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.defaultHorizontalSize,
            ),
            itemCount: controller.foods.length,
            itemBuilder: (context, index) {
              final food = controller.foods[index];
              return Padding(
                padding: EdgeInsets.only(bottom: Dimensions.heightSize),
                child: FoodCardWidget(
                  title: food["title"]!,
                  description: food["description"]!,
                  calories: food["calories"]!,
                  time: food["time"]!,
                  imageUrl: food["imageUrl"]!,
                  isShuffle: false,
                  onTap: () {
                    Get.toNamed(Routes.detailsScreen);
                  },
                  // onShuffle: controller.shuffleList,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
