import 'package:tailored_eats/widgets/text_widget.dart';

import '../core/themes/token.dart';
import '../core/utils/basic_import.dart';
import 'loading_widget.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color? borderColor;
  final double borderWidth;
  final double? height;
  final Color? buttonColor;
  final Color? buttonTextColor;
  final OutlinedBorder? shape;
  final Widget? icon;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool isLoading;
  final bool primary;
  final bool disable;
  final bool outlineButton; // new flag for outline button
  final EdgeInsets? padding;

  PrimaryButtonWidget({
    super.key,
    required this.title,
    required this.onPressed,
    this.borderColor,
    this.borderWidth = 0,
    this.height,
    this.buttonColor,
    this.buttonTextColor,
    this.shape,
    this.icon,
    this.fontSize,
    this.fontWeight,
    this.isLoading = false,
    this.primary = false,
    this.disable = false,
    this.outlineButton = false, // default false
    this.padding,
  });

  final ValueNotifier<bool> isPadding = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    if (isLoading) return const LoadingWidget();

    return ValueListenableBuilder<bool>(
      valueListenable: isPadding,
      builder: (context, isPadded, _) {
        return Padding(
          padding: padding ?? EdgeInsets.zero,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: EdgeInsets.symmetric(horizontal: isPadded ? 5 : 0),
            height: height ?? Dimensions.buttonHeight * 0.75,
            width: double.infinity,
            child: outlineButton
                ? OutlinedButton(
              onPressed: disable ? null : () {
                isPadding.value = true;
                Future.delayed(const Duration(milliseconds: 220), () {
                  isPadding.value = false;
                });
                onPressed();
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  width: borderWidth,
                  color: disable
                      ? CustomColors.disableColor
                      : borderColor ?? CustomColors.primary,
                ),
                shape: shape ??
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        Dimensions.radius * 0.8,
                      ),
                    ),
                backgroundColor: Colors.transparent,
              ),
              child: TextWidget(
                title,
                fontSize: isPadded
                    ? (fontSize ?? Dimensions.titleMedium)
                    : fontSize ?? Dimensions.titleMedium * 1.1,
                fontWeight: fontWeight ?? FontWeight.w900,
                color: primary
                    ? CustomColors.primary
                    : buttonTextColor ?? CustomColors.primary,
                maxLines: 1,
                textOverflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            )
                : ElevatedButton(
              onPressed: disable ? null : () {
                isPadding.value = true;
                Future.delayed(const Duration(milliseconds: 220), () {
                  isPadding.value = false;
                });
                onPressed();
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor:
                (disable ? CustomColors.disableColor : buttonColor) ??
                    CustomColors.primary,
                shape: shape ??
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        Dimensions.radius * 0.8,
                      ),
                    ),
                side: BorderSide(
                  width: borderWidth,
                  color: disable
                      ? CustomColors.disableColor
                      : borderColor ?? CustomColors.primary,
                ),
              ),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 350),
                child: TextWidget(
                  title,
                  fontSize: isPadded
                      ? (fontSize ?? Dimensions.titleMedium)
                      : fontSize ?? Dimensions.titleMedium * 1.1,
                  fontWeight: fontWeight ?? FontWeight.w900,
                  color: primary
                      ? CustomColors.primary
                      : buttonTextColor ?? Colors.white,
                  maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
