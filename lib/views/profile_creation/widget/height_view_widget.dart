part of '../screen/profile_creation_screen.dart';

class HeightSelectorWidget extends GetView<ProfileCreationController> {
  const HeightSelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double rulerHeight = 400.h;

    return Column(
      children: [
        TextWidget(
          'How Tall Are You?',
          fontSize: Dimensions.titleLarge,
          fontWeight: FontWeight.bold,
        ),
        Space.height.v40,

        Obx(
              () => Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.white.withOpacity(0.1),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildUnitButton('CM', controller.isHeightInCm.value),
                _buildUnitButton('FT', !controller.isHeightInCm.value),
              ],
            ),
          ),
        ),

        Space.height.v40,

        SizedBox(
          height: rulerHeight,
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
                        selectedHeight: controller.heightInCm.value,
                        minHeight: controller.minHeight,
                        maxHeight: controller.maxHeight,
                        isInCm: controller.isHeightInCm.value,
                      ),
                    ),
                  ),
                ),
              ),

              // Draggable Area
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
                    clipBehavior: Clip.none,
                    children: [
                      Obx(() {
                        double pointerY = _getHeightPosition(
                          controller.heightInCm.value,
                          rulerHeight,
                        );

                        // Clamp pointer position to keep text visible
                        double clampedY = pointerY.clamp(0.0, rulerHeight - 60);

                        return Positioned(
                          left: 0,
                          top: clampedY,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomPaint(
                                size: const Size(12, 16),
                                painter: TrianglePointerPainter(),
                              ),
                              Space.width.v10,
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment:
                                CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  if (controller.isHeightInCm.value) ...[
                                    TextWidget(
                                      controller.heightInCm.value
                                          .toInt()
                                          .toString(),
                                      fontWeight: FontWeight.bold,
                                      fontSize: Dimensions.displayMedium,
                                      color: CustomColors.primary,
                                    ),
                                    Space.width.v5,
                                    TextWidget(
                                      'cm',
                                      fontWeight: FontWeight.w600,
                                      fontSize: Dimensions.titleSmall,
                                      color: Colors.white70,
                                    ),
                                  ] else ...[
                                    TextWidget(
                                      '${controller.heightInFeet.value}\'',
                                      fontWeight: FontWeight.bold,
                                      fontSize: Dimensions.displayMedium,
                                      color: CustomColors.primary,
                                    ),
                                    Space.width.v5,
                                    TextWidget(
                                      '${controller.heightInInches.value}"',
                                      fontWeight: FontWeight.bold,
                                      fontSize: Dimensions.displayMedium,
                                      color: CustomColors.primary,
                                    ),
                                  ],
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Space.height.v20,
        TextWidget(
          'Drag to adjust your height',
          color: Colors.white38,
          fontSize: Dimensions.bodySmall,
        ),
      ],
    );
  }

  Widget _buildUnitButton(String unit, bool isSelected) {
    return GestureDetector(
      onTap: isSelected ? null : () => controller.toggleHeightUnit(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected ? CustomColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextWidget(
          unit,
          fontSize: Dimensions.titleSmall,
          fontWeight: FontWeight.bold,
          color: isSelected ? Colors.white : Colors.white54,
        ),
      ),
    );
  }

  double _getHeightPosition(double height, double totalHeight) {
    double percentage =
        (height - controller.minHeight) /
            (controller.maxHeight - controller.minHeight);
    return totalHeight - (percentage * totalHeight) - 25;
  }
}

class RulerPainter extends CustomPainter {
  final double selectedHeight;
  final double minHeight;
  final double maxHeight;
  final bool isInCm;

  RulerPainter({
    required this.selectedHeight,
    required this.minHeight,
    required this.maxHeight,
    required this.isInCm,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final majorPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2;
    final minorPaint = Paint()
      ..color = Colors.white54
      ..strokeWidth = 1.5;
    final selectedPaint = Paint()
      ..color = CustomColors.primary
      ..strokeWidth = 3;

    int totalMarks = 40;

    for (int i = 0; i <= totalMarks; i++) {
      double y = (i / totalMarks) * size.height;

      double currentHeight =
          maxHeight - (i / totalMarks) * (maxHeight - minHeight);
      bool isSelected = (currentHeight - selectedHeight).abs() < 2;

      double lineEndX;
      Paint currentPaint = isSelected
          ? selectedPaint
          : (i % 5 == 0 ? majorPaint : minorPaint);

      if (i % 10 == 0) {
        lineEndX = 30;
        canvas.drawLine(
          Offset(size.width - lineEndX, y),
          Offset(size.width, y),
          currentPaint,
        );
      } else if (i % 5 == 0) {
        lineEndX = 20;
        canvas.drawLine(
          Offset(size.width - lineEndX, y),
          Offset(size.width, y),
          currentPaint,
        );
      } else {
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