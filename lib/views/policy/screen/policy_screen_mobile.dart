part of 'policy_screen.dart';

class PolicyScreenMobile extends GetView<PolicyController> {
  const PolicyScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Policy"),
      body: SafeArea(
        child: Obx(
          () => controller.isLoading.value
              ? LoadingWidget()
              : controller.privacyDescription.isEmpty
              ? EmptyDataWidget()
              : ListView(
                  padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
                  children: [
                    TextWidget(
                      controller.privacyDescription,
                      fontSize: Dimensions.titleSmall,
                      color: CustomColors.grayShade,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
