part of '../screen/home_screen.dart';

class StudyProgressWidget extends StatelessWidget {
  final double percentage; // 0.0 - 1.0
  final String date;
  final Color progressColor;
  final Color backgroundColor;

  const StudyProgressWidget({
    super.key,
    required this.percentage,
    required this.date,
    this.progressColor = const Color(0xFF00BFFF),
    this.backgroundColor = const Color(0xFF3B3B3B),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: Dimensions.widthSize),
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.verticalSize * 0.4,
        horizontal: Dimensions.defaultHorizontalSize,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2C),
        borderRadius: BorderRadius.circular(Dimensions.radius * 0.85),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,

        mainAxisAlignment: mainCenter,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              CircularProgressIndicator(
                value: percentage.clamp(0.0, 1.0),
                backgroundColor: backgroundColor,
                valueColor: AlwaysStoppedAnimation<Color>(progressColor),
                strokeWidth: 2,
              ),
              TextWidget('${(percentage * 100).toInt()}%', fontSize: 12.sp),
            ],
          ),
          TextWidget(
            padding: Dimensions.heightSize.edgeTop * 0.8,
            date,
            color: CustomColors.grayShade,
            fontSize: Dimensions.titleSmall,
          ),
        ],
      ),
    );
  }
}
