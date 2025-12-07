part of 'support_screen.dart';

class SupportScreenMobile extends GetView<SupportController> {
  const SupportScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Support"),
      body: SafeArea(
        child: ListView(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          children: [
            Space.height.betweenInputBox,

            PrimaryInputFieldWidget(
              controller: controller.subjectController,
              hintText: 'Title',
            ),

            Space.height.betweenInputBox,
            PrimaryInputFieldWidget(
              controller: controller.bodyController,
              hintText: "description",
              maxLines: 5,
            ),
            Space.height.betweenInputBox,
            Space.height.betweenInputBox,
            Obx(
              () => PrimaryButtonWidget(
                isLoading: controller.isLoading.value,
                title: "Submit",
                onPressed: () => controller.sendSupport,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
