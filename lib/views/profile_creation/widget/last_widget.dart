part of '../screen/profile_creation_screen.dart';

class DailyCalorieIntake extends StatelessWidget {
  const DailyCalorieIntake({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Dimensions.defaultHorizontalSize.edgeHorizontal,
      child: Center(
        child: Center(
          child: Column(
            children: [
              Space.height.v10,
              TextWidget(
                'Your Daily Calorie Intake',
                fontSize: Dimensions.titleLarge,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
              ),
              Space.height.v10,
              TextWidget(
                'To achieve your goal, you should consume',
                fontSize: Dimensions.bodyMedium,
                color: Colors.white60,
                textAlign: TextAlign.center,
              ),
              TextWidget(
                '1500 calories everyday',
                fontSize: Dimensions.bodyMedium,
                color: Colors.white60,
                textAlign: TextAlign.center,
              ),
              Space.height.v100,
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 200.w,
                    height: 200.w,
                    child: CustomPaint(
                      painter: CircularProgressPainter(
                        progress: 1.0,
                        strokeWidth: 8,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextWidget(
                        '1500',
                        fontSize: 48.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      TextWidget(
                        'Calories',
                        fontSize: Dimensions.bodyMedium,
                        color: Colors.white60,
                      ),
                    ],
                  ),
                ],
              ),

              TextWidget("You are now ready to view your fully customised plan"),
              Space.height.v100,
            ],
          ),
        ),
      ),
    );
  }
}

class CircularProgressPainter extends CustomPainter {
  final double progress;
  final double strokeWidth;

  CircularProgressPainter({required this.progress, required this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    // Background circle (darker)
    final backgroundPaint = Paint()
      ..color = Colors.white.withOpacity(0.1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, backgroundPaint);

    // Progress circle (cyan/teal color)
    final progressPaint = Paint()
      ..shader = LinearGradient(
        colors: [Color(0xFF00D4FF), Color(0xFF00A8CC)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final sweepAngle = 2 * math.pi * progress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2, // Start from top
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
