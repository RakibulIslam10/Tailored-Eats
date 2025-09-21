part of '../screen/profile_creation_screen.dart';

class HeightSelectorWidget extends GetView<ProfileCreationController> {
  const HeightSelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const double rulerHeight = 350;

    return Column(
      children: [
        TextWidget(
          'How Tall Are You ?',
          fontSize: Dimensions.titleLarge,
          fontWeight: FontWeight.bold,
        ),
        Space.height.v100,
        SizedBox(
          height: rulerHeight.h,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: SizedBox(
                  width: 40.h,
                  child: Obx(
                    () => CustomPaint(
                      painter: RulerPainter(
                        selectedHeight: controller.height.value,
                        minHeight: controller.minHeight,
                        maxHeight: controller.maxHeight,
                      ),
                    ),
                  ),
                ),
              ),

              Positioned(
                left: 50,
                top: 0,
                right: 16,
                bottom: 0,
                child: GestureDetector(
                  onPanUpdate: (details) {
                    double y = details.localPosition.dy.clamp(0, rulerHeight);
                    double percentage = 1 - (y / rulerHeight);
                    double newHeight =
                        controller.minHeight +
                        percentage *
                            (controller.maxHeight - controller.minHeight);
                    controller.setHeight(newHeight);
                  },
                  child: Stack(
                    children: [
                      Obx(() {
                        double pointerY = _getHeightPosition(
                          controller.height.value,
                          rulerHeight,
                        );

                        return Positioned(
                          left: 0,
                          top: pointerY,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomPaint(
                                size: const Size(12, 16),
                                painter: TrianglePointerPainter(),
                              ),
                              Space.width.v10,
                              TextWidget(
                                controller.height.value.toInt().toString(),
                                fontWeight: FontWeight.bold,
                                fontSize: Dimensions.displayLarge,
                                color: CustomColors.primary,
                              ),
                              Space.width.v10,
                              TextWidget(
                                'Height (Cm)',
                                fontWeight: FontWeight.bold,
                                color: CustomColors.grayShade,
                              ),
                            ],
                          ),
                        );
                      }),

                      // Transparent draggable overlay
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
        ),
      ],
    );
  }

  double _getHeightPosition(double height, double totalHeight) {
    double percentage =
        (height - controller.minHeight) /
        (controller.maxHeight - controller.minHeight);
    return totalHeight -
        (percentage * totalHeight) -
        50; // adjust pointer center
  }
}

class RulerPainter extends CustomPainter {
  final double selectedHeight;
  final double minHeight;
  final double maxHeight;

  RulerPainter({
    required this.selectedHeight,
    required this.minHeight,
    required this.maxHeight,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final majorPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2;
    final minorPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 1.5;
    final selectedPaint = Paint()
      ..color = CustomColors.primary
      ..strokeWidth = 3;

    int totalMarks = 40;

    for (int i = 0; i <= totalMarks; i++) {
      double y = (i / totalMarks) * size.height;

      // Calculate corresponding height for this mark
      double currentHeight =
          maxHeight - (i / totalMarks) * (maxHeight - minHeight);
      bool isSelected =
          (currentHeight - selectedHeight).abs() < 2; // Tolerance for selection

      double lineEndX;
      Paint currentPaint = isSelected
          ? selectedPaint
          : (i % 5 == 0 ? majorPaint : minorPaint);

      if (i % 10 == 0) {
        lineEndX = 30; // Major ticks are longer
        canvas.drawLine(
          Offset(size.width - lineEndX, y),
          Offset(size.width, y),
          currentPaint,
        );
      } else if (i % 5 == 0) {
        // Minor tick: medium length
        lineEndX = 20;
        canvas.drawLine(
          Offset(size.width - lineEndX, y),
          Offset(size.width, y),
          currentPaint,
        );
      } else {
        // Shortest tick
        lineEndX = 15;
        canvas.drawLine(
          Offset(size.width - lineEndX, y),
          Offset(size.width, y),
          currentPaint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

/// Blue triangle pointer
class TrianglePointerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = CustomColors.primary;
    final path = Path()
      ..moveTo(0, size.height / 2)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
