import '../core/themes/token.dart';
import '../core/utils/basic_import.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
    this.text, {
    super.key,
    this.textAlign,
    this.textOverflow,
    this.padding = EdgeInsets.zero,
    this.opacity = 1.0,
    this.maxLines,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.style,
    this.onTap,
  });

  final String text;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final EdgeInsetsGeometry padding;
  final double opacity;
  final int? maxLines;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextStyle? style;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Opacity(
        opacity: opacity,
        child: Padding(
          padding: padding,
          child: Text(
            text,
            textAlign: textAlign,
            overflow: textOverflow,
            maxLines: maxLines,
            textScaler: TextScaler.linear(ScreenUtil().textScaleFactor),
            style: TextStyle(
              color: color ?? CustomColors.whiteColor,
              fontSize: fontSize ?? Dimensions.titleMedium,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ),
    );
  }
}
