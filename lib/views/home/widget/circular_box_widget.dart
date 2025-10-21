part of '../screen/home_screen.dart';

class CircularProgressWidget extends StatelessWidget {
  final double percentage;

  const CircularProgressWidget({super.key, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.defaultHorizontalSize,
        vertical: Dimensions.verticalSize,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [const Color(0xFF26C4F8), Colors.black],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.white.withOpacity(0.16)),
        backgroundBlendMode: BlendMode.overlay,
      ),

      child: Row(
        mainAxisAlignment: mainSpaceBet,
        mainAxisSize: MainAxisSize.min,
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
                color: CustomColors.grayShade,
                fontSize: Dimensions.titleSmall * 0.95,
              ),
            ],
          ),
          const SizedBox(width: 32),
          SizedBox(
            width: 80,
            height: 80,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  painter: _CircularPainter(percentage: percentage),
                  child: Container(),
                ),
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
    );
  }
}

class _CircularPainter extends CustomPainter {
  final double percentage;

  _CircularPainter({required this.percentage});

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPaint = Paint()
      ..color = CustomColors.progressColor.withOpacity(0.1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6.0;

    final progressPaint = Paint()
      ..color = const Color(0xff7AD3FF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6.0
      ..strokeCap = StrokeCap.round;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    const startAngle = -3.14 / 2;

    canvas.drawCircle(center, radius, backgroundPaint);

    final sweepAngle = 2 * 3.14 * percentage;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
