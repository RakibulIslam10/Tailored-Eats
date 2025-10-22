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
              // Progress Circle with new gradient design
              SizedBox(
                width: 85.w,
                height: 85.w,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // New gradient circular progress
                    CustomPaint(
                      size: Size(85.w, 85.w),
                      painter: CircularProgressClipper(
                        progress: percentage,
                        strokeWidth: 8,
                      ),
                    ),
                    // Center image
                    Image.asset(Assets.dummy.cc.path, height: 56.h),
                    // Text overlay
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
  final double progress; // 0.0 to 1.0
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

    // Total arc is 270 degrees (3/4 of circle), gap is 90 degrees at bottom
    final totalArcAngle = math.pi * 1.5; // 270 degrees

    // Background circle with opacity 0.1 (shows remaining progress)
    final backgroundPaint = Paint()
      ..color = Color(0xFF7AD3FF).withOpacity(0.15)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // Start from bottom-left, draw 270 degrees leaving gap at bottom center
    final bgStartAngle = math.pi * 0.75; // Start from bottom-left (135 degrees)

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      bgStartAngle,
      totalArcAngle,
      false,
      backgroundPaint,
    );

    // Create gradient for progress (cyan to blue)
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

    // Draw progress arc - rotates from start position based on percentage
    // Progress fills the 270-degree arc (0% to 100% fills the available arc)
    final progressStartAngle = math.pi * 0.75; // Start from bottom-left
    final progressSweepAngle = totalArcAngle * progress; // Progress amount

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
