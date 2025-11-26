import '../core/utils/basic_import.dart';

class BottomSheetDialogWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final String? buttonTex;
  final String? firstButtonTex;
  final String? hintText;
  final Color? buttonColor;
  final RxBool isLoading;
  final void Function() action;
  final bool? isInputField;
  final TextEditingController? inputController;

  const BottomSheetDialogWidget({
    super.key,
    required this.title,
    required this.subTitle,
    this.buttonTex,
    this.hintText,
    this.firstButtonTex,
    required this.isLoading,
    this.buttonColor,
    required this.action,
    this.isInputField = false,
    this.inputController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(Dimensions.radius * 1.5),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.horizontalSize,
        vertical: Dimensions.verticalSize * 0.5,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: Dimensions.widthSize * 4.2,
              height: Dimensions.heightSize * 0.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius),
                color: Colors.black,
              ),
            ),
          ),
          Space.height.v20,
          TextWidget(
            title,
            fontWeight: FontWeight.bold,
            fontSize: Dimensions.titleMedium * 1.1,
            padding: EdgeInsets.only(bottom: Dimensions.verticalSize * 0.15),
          ),
          TextWidget(subTitle, fontSize: Dimensions.titleSmall),
          Space.height.betweenInputBox,
          if (isInputField == true) ...[
            PrimaryInputFieldWidget(
              controller: inputController ?? TextEditingController(),
              hintText: hintText ??  'Enter Account Password',
            ),
            Space.height.betweenInputBox,
          ],
          if (isInputField == false) ...[
            PrimaryButtonWidget(
              title: firstButtonTex ?? 'Cancel',
              onPressed: () {
                Get.close(1);
              },
              buttonColor: Colors.grey.withOpacity(0.3),
              borderColor: Colors.white,
              buttonTextColor: Colors.black,
            ),
          ],
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: Dimensions.verticalSize * 0.6,
            ),
            child: Obx(
              () => PrimaryButtonWidget(
                isLoading: isLoading.value,
                title: buttonTex ?? 'Yes',
                onPressed: action,
                buttonColor: buttonColor ?? Colors.red,
                borderColor: buttonColor ?? Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
