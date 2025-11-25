part of 'terms_screen.dart';

class TermsScreenMobile extends GetView<TermsController> {
  const TermsScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Terms"),
      body: SafeArea(
        child: Obx(
          () => controller.isLoading.value
              ? LoadingWidget()
              : controller.termsDescription.isEmpty
              ? EmptyDataWidget()
              : ListView(
                  padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
                  children: [
                    TextWidget(
                      controller.termsDescription,
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
