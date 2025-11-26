part of 'report_screen.dart';

class ReportScreenMobile extends GetView<ReportController> {
  const ReportScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Report"),
      body: SafeArea(
        child: ListView(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          children: [
            Space.height.betweenInputBox,
            CustomDropDownWidget(
              hint: 'Problem Type',
              items: controller.problemList,
              onChanged: (value) {
                controller.selectedIssue.value = value;
              },
            ),

            Space.height.betweenInputBox,
            PrimaryInputFieldWidget(
              controller: TextEditingController(),
              hintText: "description",
              maxLines: 5,
            ),
            Space.height.betweenInputBox,
            Space.height.betweenInputBox,
            PrimaryButtonWidget(title: "Send Report", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
