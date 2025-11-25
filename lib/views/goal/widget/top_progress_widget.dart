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
            // Background bar
            Container(
              height: minHeight,
              decoration: BoxDecoration(
                color: Colors.grey[850],
                borderRadius: BorderRadius.circular(minHeight / 2),
              ),
            ),

            // Progress bar
            LayoutBuilder(
              builder: (context, constraints) {
                final width = constraints.maxWidth * value.clamp(0.0, 1.0);
                return Container(
                  width: width < minHeight ? minHeight : width,
                  height: minHeight,
                  decoration: BoxDecoration(
                    color: CustomColors.progressColor,
                    borderRadius: BorderRadius.circular(minHeight / 2),
                  ),
                );
              },
            ),

            // Milestone markers
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

        // Percentage labels
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

  Widget _buildMarker(bool isActive) {
    return Container(
      width: 16.w,
      height: 16.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive
            ? CustomColors.progressColor
            : Colors.grey[850],
        border: Border.all(
          color: CustomColors.progressColor,
          width: 2,
        ),
      ),
      child: isActive
          ? Center(
        child: Container(
          width: 8.w,
          height: 8.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: CustomColors.blackColor,
          ),
        ),
      )
          : null,
    );
  }

  Widget _buildTextLabel(String text, bool isActive) {
    return TextWidget(
      text,
      fontSize: 11.sp,
      fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
      color: isActive ? CustomColors.progressColor : Colors.grey.shade500,
    );
  }
}