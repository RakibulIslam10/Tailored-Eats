part of '../screen/home_screen.dart';

class CircularProgressWidget extends StatelessWidget {
  final double percentage;

  const CircularProgressWidget({super.key, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          Assets.dummy.ssss.path,
          fit: BoxFit.cover,
          width: double.maxFinite,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.defaultHorizontalSize,
          ),
          child: Row(
            mainAxisAlignment: mainSpaceBet,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextWidget(
                    padding: Dimensions.heightSize.edgeBottom * 0.25,
                    'Almost there',
                    fontSize: Dimensions.titleMedium * 1.25,
                    fontWeight: FontWeight.bold,
                  ),
                  TextWidget(
                    'Just a little more to go ',
                    color: CustomColors.grayShade.withAlpha(893),
                    fontSize: Dimensions.titleSmall * 0.95,
                  ),
                ],
              ),
              SizedBox(
                width: 85.w,
                height: 85.w,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomPaint(
                      size: Size(85.w, 85.w),
                      painter: CircularProgressClipper(
                        progress: percentage,
                        strokeWidth: 8,
                      ),
                    ),
                    Image.asset(Assets.dummy.cc.path, height: 56.h),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget('Today', fontSize: 10.sp),
                        TextWidget(
                          '${(percentage * 100).toInt()}%',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CircularProgressClipper extends CustomPainter {
  final double progress;
  final Color startColor;
  final Color endColor;
  final double strokeWidth;

  CircularProgressClipper({
    required this.progress,
    this.startColor = const Color(0xFF7AD3FF),
    this.endColor = const Color(0xFF26C4F8),
    this.strokeWidth = 10.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2 - strokeWidth / 2;

    final totalArcAngle = math.pi * 1.5;

    final backgroundPaint = Paint()
      ..color = Color(0xFF7AD3FF).withOpacity(0.15)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final bgStartAngle = math.pi * 0.75;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      bgStartAngle,
      totalArcAngle,
      false,
      backgroundPaint,
    );

    final rect = Rect.fromCircle(center: center, radius: radius);
    final gradient = LinearGradient(
      colors: [startColor, endColor],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    final progressPaint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final progressStartAngle = math.pi * 0.75;
    final progressSweepAngle = totalArcAngle * progress;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      progressStartAngle,
      progressSweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CircularProgressClipper oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
