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
        child: RefreshIndicator(
          backgroundColor: Colors.black,
          color: CustomColors.primary,

          onRefresh: () async {
            controller.loadInitialData();
          },
          child: Obx(
            () => controller.isLoading.value
                ? LoadingWidget()
                : ListView(
                    padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
                    children: [
                      TopTextHeaderWidget(),
                      TextWidget(
                        'Your Total Daily macros',
                        fontWeight: FontWeight.bold,
                        padding: Dimensions.heightSize.edgeBottom,
                      ),
                      NutrientCardWidget(),
                      TextWidget(
                        'How consistent are you?',
                        fontWeight: FontWeight.bold,
                        padding: Dimensions.heightSize.edgeVertical,
                      ),
                      CircularProgressWidget(
                        percentage:
                            double.tryParse(
                              "${controller.consistencyModel?.data.todayCompleted.percentage}",
                            ) ??
                            0.0,
                      ),
                      Space.height.v15,

                      if (controller.friendsProgressList.isNotEmpty)
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.10,
                          child: RepaintBoundary(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemCount: math.min(
                                6,
                                controller.friendsProgressList.length,
                              ),
                              cacheExtent: 300,
                              addAutomaticKeepAlives: false,
                              addRepaintBoundaries: true,
                              itemBuilder: (context, index) => RepaintBoundary(
                                child: StudyProgress(
                                  percentage: Helpers.parseDouble(
                                    controller
                                        .friendsProgressList[index]
                                        .completed,
                                  ),
                                  date: Helpers.formatDate(
                                    controller
                                        .friendsProgressList[index]
                                        .createdAt
                                        .toString(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (controller.friendsDoingPercentList.isNotEmpty)
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
                                FadeTransition(
                                  opacity: animation,
                                  child: child,
                                ),
                            child: FoodCardWidget(
                              key: ValueKey(controller.currentFood["title"]),
                              title: controller.currentFood["title"] ?? "",
                              description:
                                  controller.currentFood["description"] ?? "",
                              calories:
                                  controller.currentFood["calories"] ?? "",
                              time: controller.currentFood["time"] ?? "",
                              imageUrl:
                                  controller.currentFood["imageUrl"] ?? "",
                              isShuffle: true,
                              onShuffle: controller.shuffleList,
                              onTap: () {
                                Get.toNamed(Routes.detailsScreen);
                              },
                            ),
                          ),
                        ),
                      ),
                      if (controller.goalList.isNotEmpty) ...[
                        TextWidget(
                          "Don't Forget Your Daily Goal",
                          fontWeight: FontWeight.bold,
                          padding: Dimensions.heightSize.edgeVertical * 1.5,
                        ),
                        TaskListWidget(),
                      ],
                      Space.height.v20,
                      WeightWidget(
                        homeController: controller,
                        onSave: () => controller.saveWeight(),
                      ),
                      Space.height.v30,
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
