import '../core/themes/token.dart';
import '../core/utils/basic_import.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key, this.padding = EdgeInsets.zero});

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Divider(
        color: CustomColors.disableColor.withOpacity(.4),
        thickness: 0.8,
      ),
    );
  }
}


class DividerWidgetTwo extends StatelessWidget {
  final double thickness;
  final Color color;

  const DividerWidgetTwo({
    super.key,
    this.thickness = 1,
    this.color = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: thickness,
        color: color.withOpacity(0.4),
      ),
    );
  }
}
