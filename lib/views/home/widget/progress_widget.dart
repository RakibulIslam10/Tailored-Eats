part of '../screen/home_screen.dart';

class CalorieProgressPainter extends CustomPainter {
  final double progress;
  final double strokeWidth;
  final Color backgroundColor;
  final Color progressColor;

  CalorieProgressPainter({
    required this.progress,
    this.strokeWidth = 7.0,
    this.backgroundColor = const Color(0xFF333333),
    this.progressColor = const Color(0xff4FBAF0),
  });

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPaint = Paint()
      ..strokeWidth = strokeWidth
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final progressPaint = Paint()
      ..strokeWidth = strokeWidth
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    canvas.drawCircle(center, radius, backgroundPaint);

    final rect = Rect.fromCircle(center: center, radius: radius);
    const startAngle = -3.14 / 2;
    final sweepAngle = 2 * 3.14 * progress;
    canvas.drawArc(rect, startAngle, sweepAngle, false, progressPaint);
  }

  @override
  bool shouldRepaint(covariant CalorieProgressPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

class CalorieProgressWidget extends GetView<HomeController> {
  final double totalCalories;
  final double size;

  const CalorieProgressWidget({
    super.key,
    required this.totalCalories,
    this.size = 90.0,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final progress = controller.currentCalories.value / totalCalories;
      final displayValue = controller.currentCalories.value.toInt();

      return SizedBox(
        width: size,
        height: size,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              size: Size(size, size),
              painter: CalorieProgressPainter(
                progress: progress,
                progressColor: Colors.blueAccent,
                backgroundColor: Colors.white12,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.local_fire_department,
                  color: Colors.deepOrange,
                  size: Dimensions.iconSizeLarge * 0.9,
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    TextWidget(
                      '$displayValue',
                      fontSize: Dimensions.titleSmall * 0.9,
                      fontWeight: FontWeight.bold,
                    ),
                    TextWidget(
                      ' kcal',
                      color: CustomColors.grayShade,
                      fontSize: Dimensions.titleSmall * 0.6,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
