import 'package:pin_code_fields/pin_code_fields.dart';
import '../core/themes/token.dart';
import '../core/utils/basic_import.dart';

class OtpInputField extends StatelessWidget {
  const OtpInputField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      length: 6,
      obscureText: true,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        selectedFillColor: CustomColors.secondary,
        inactiveFillColor: CustomColors.background,
        inactiveColor: CustomColors.secondary,
        selectedColor: CustomColors.primary,
        activeColor: CustomColors.primary,
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
        fieldHeight: 40.h,
        fieldWidth: 40.w,
        activeFillColor: CustomColors.secondary,
      ),
      animationDuration: Duration(milliseconds: 300),
      enableActiveFill: true,
      controller: controller,
      onCompleted: (v) {
        print("Completed");
      },

      beforeTextPaste: (text) {
        print("Allowing to paste $text");
        return true;
      },
      appContext: context,
    );
  }
}
