part of '../screen/profile_creation_screen.dart';

class HeightSelectorWidget extends GetView<ProfileCreationController> {
  const HeightSelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 400,
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          // Left side ruler marks
          Positioned(
            left: 16,
            top: 0,
            bottom: 0,
            child: Container(
              width: 60,
              child: CustomPaint(painter: RulerPainter()),
            ),
          ),

          // Main height display
          Positioned(
            left: 90,
            top: 0,
            right: 16,
            bottom: 0,
            child: GestureDetector(
              onPanUpdate: (details) {
                // Calculate height based on vertical drag
                double percentage = 1 - (details.localPosition.dy / 400);
                double newHeight =
                    controller.minHeight +
                    (percentage *
                        (controller.maxHeight - controller.minHeight));
                controller.setHeight(newHeight);
              },
              child: Stack(
                children: [
                  // Height value display
                  Obx(
                    () => Positioned(
                      left: 0,
                      top: _getHeightPosition(controller.height.value) - 20,
                      child: Row(
                        children: [
                          // Blue triangle pointer
                          Container(
                            width: 0,
                            height: 0,
                            decoration: const BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  width: 8,
                                  color: Colors.transparent,
                                ),
                                bottom: BorderSide(
                                  width: 8,
                                  color: Colors.transparent,
                                ),
                                right: BorderSide(
                                  width: 12,
                                  color: Color(0xFF00BCD4),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          // Height text
                          Text(
                            controller.height.value.toInt().toString(),
                            style: const TextStyle(
                              color: Color(0xFF00BCD4),
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          // "Height (Cm)" text
                          const Text(
                            'Height (Cm)',
                            style: TextStyle(
                              color: Color(0xFF9E9E9E),
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Invisible draggable area
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.transparent,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  double _getHeightPosition(double height) {
    double percentage =
        (height - controller.minHeight) /
        (controller.maxHeight - controller.minHeight);
    return 400 - (percentage * 400) - 40;
  }
}

class RulerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 1.8  ;

    final shortLinePaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 1;

    for (int i = 0; i <= 40; i++) {
      double y = (i / 40) * size.height;
      double lineWidth;
      Paint currentPaint;

      if (i % 10 == 0) {
        lineWidth = 25;
        currentPaint = paint;
      } else if (i % 5 == 0) {
        lineWidth = 20;
        currentPaint = paint;
      } else {
        lineWidth = 15;
        currentPaint = shortLinePaint;
      }

      canvas.drawLine(
        Offset(size.width - lineWidth, y),
        Offset(size.width, y),
        currentPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
