// Controller
import 'dart:math' as math;

import '../../../core/utils/basic_import.dart';
import '../controller/home_controller.dart';

class NutritionWidget extends GetView<HomeController> {
  const NutritionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF0a0a0a),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Row(
            children: [
              // Main Calories Circle
              Obx(
                () => _CircularProgressWidget(
                  current: controller.calories.value,
                  max: controller.maxCalories.value,
                  size: 120,
                  strokeWidth: 10,
                  color1: const Color(0xFFff6b35),
                  color2: const Color(0xFFff8c42),
                  showFlame: true,
                  showWater: true,
                ),
              ),
              const SizedBox(width: 20),
              // Macro Cards Column
              Expanded(
                child: Column(
                  children: [
                    Obx(
                      () => _MacroCard(
                        iconColor: const Color(0xFFff6b6b),
                        label: 'Protein',
                        current: controller.protein.value,
                        max: controller.maxProtein.value,
                        progressColor: const Color(0xFFff6b6b),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Obx(
                      () => _MacroCard(
                        iconColor: const Color(0xFF4ecdc4),
                        label: 'Carbs',
                        current: controller.carbs.value,
                        max: controller.maxCarbs.value,
                        progressColor: const Color(0xFF4ecdc4),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Obx(
                      () => _MacroCard(
                        iconColor: const Color(0xFFffd93d),
                        label: 'Fat',
                        current: controller.fat.value,
                        max: controller.maxFat.value,
                        progressColor: const Color(0xFFffd93d),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Circular Progress Widget (Private)
class _CircularProgressWidget extends StatelessWidget {
  final int current;
  final int max;
  final double size;
  final double strokeWidth;
  final Color color1;
  final Color color2;
  final bool showFlame;
  final bool showWater;

  const _CircularProgressWidget({
    required this.current,
    required this.max,
    required this.size,
    required this.strokeWidth,
    required this.color1,
    required this.color2,
    this.showFlame = false,
    this.showWater = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(size, size),
            painter: _CircularProgressPainter(
              percentage: (current / max).clamp(0.0, 1.0),
              strokeWidth: strokeWidth,
              color1: color1,
              color2: color2,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (showFlame)
                Icon(Icons.local_fire_department, color: color1, size: 24),
              if (showWater) Icon(Icons.water_drop, color: color2, size: 20),
              if (showFlame || showWater) const SizedBox(height: 2),
              Text(
                '$current',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                '$current/$max',
                style: const TextStyle(color: Colors.grey, fontSize: 10),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Custom Painter for Circular Progress (Private)
class _CircularProgressPainter extends CustomPainter {
  final double percentage;
  final double strokeWidth;
  final Color color1;
  final Color color2;

  _CircularProgressPainter({
    required this.percentage,
    required this.strokeWidth,
    required this.color1,
    required this.color2,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    // Background circle
    final bgPaint = Paint()
      ..color = const Color(0xFF2a2a2a)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, bgPaint);

    // Progress circle with gradient
    final rect = Rect.fromCircle(center: center, radius: radius);
    final gradient = SweepGradient(
      colors: [color1, color2, color1],
      startAngle: 0,
      endAngle: math.pi * 2,
    );

    final progressPaint = Paint()
      ..shader = gradient.createShader(rect)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      rect,
      -math.pi / 2,
      2 * math.pi * percentage,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

// Macro Card Widget (Private)
class _MacroCard extends StatelessWidget {
  final Color iconColor;
  final String label;
  final int current;
  final int max;
  final Color progressColor;

  const _MacroCard({
    required this.iconColor,
    required this.label,
    required this.current,
    required this.max,
    required this.progressColor,
  });

  @override
  Widget build(BuildContext context) {
    final percentage = (current / max).clamp(0.0, 1.0);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1a1a1a),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(color: iconColor, shape: BoxShape.circle),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(color: Colors.grey, fontSize: 11),
                ),
                const SizedBox(height: 4),
                Text(
                  '$current/${max}G',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: LinearProgressIndicator(
                    value: percentage,
                    backgroundColor: const Color(0xFF2a2a2a),
                    valueColor: AlwaysStoppedAnimation<Color>(progressColor),
                    minHeight: 4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
