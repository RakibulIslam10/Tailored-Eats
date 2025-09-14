part of '../screen/goal_screen.dart';

class TopProgressWidget extends StatelessWidget {
  final double value;
  final double minHeight;

  const TopProgressWidget({
    super.key,
    required this.value,
    this.minHeight = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              height: minHeight,
              decoration: BoxDecoration(color: Colors.grey[850]),
            ),

            LayoutBuilder(
              builder: (context, constraints) {
                final width = constraints.maxWidth * value.clamp(0.0, 1.0);
                return Container(
                  width: width < minHeight ? minHeight : width,
                  // ensures radius doesn't break
                  height: minHeight,
                  decoration: BoxDecoration(color: CustomColors.progressColor),
                );
              },
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildMarker(value >= 0.25),
                _buildMarker(value >= 0.50),
                _buildMarker(value >= 0.75),
                _buildMarker(value >= 1.0),
              ],
            ),
          ],
        ),

        SizedBox(height: 6.h),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTextLabel("25%", value >= 0.25),
            _buildTextLabel("50%", value >= 0.50),
            _buildTextLabel("75%", value >= 0.75),
            _buildTextLabel("100%", value >= 1.0),
          ],
        ),
      ],
    );
  }

  _buildMarker(bool isActive) {
    return Container(
      width: 16.w,
      height: 16.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: CustomColors.progressColor, width: 1.5),
      ),
      child: Center(
        child: Container(
          width: 10.w,
          height: 10.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: CustomColors.progressColor,
          ),
        ),
      ),
    );
  }

  Widget _buildTextLabel(String text, bool isActive) {
    return TextWidget(
      text,
      fontSize: Dimensions.titleSmall * 0.9,
      fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
      color: isActive ? CustomColors.progressColor : Colors.grey.shade500,
    );
  }
}
