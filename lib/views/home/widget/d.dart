
// ✅ 1. Optimize Blur Effects (Expensive!)
import 'dart:math' as math;
import 'dart:ui';

import '../../../core/utils/basic_import.dart';

class OptimizedBlurWidget extends StatelessWidget {
  final Widget child;
  final double sigma;

  const OptimizedBlurWidget({
    super.key,
    required this.child,
    this.sigma = 5.0,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: ClipRRect(
        child: BackdropFilter(
          // ✅ Lower sigma for better performance
          filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
          child: child,
        ),
      ),
    );
  }
}

// ✅ 2. Optimize Gradients
class OptimizedGradientContainer extends StatelessWidget {
  final Widget? child;
  final List<Color> colors;
  final double height;
  final double width;

  const OptimizedGradientContainer({
    super.key,
    this.child,
    required this.colors,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            // ✅ Use fewer color stops for better performance
            stops: colors.length == 2 ? [0.0, 1.0] : null,
          ),
        ),
        child: child,
      ),
    );
  }
}

// ✅ 3. Optimize CircularProgressWidget
class OptimizedCircularProgressWidget extends StatefulWidget {
  final double percentage;

  const OptimizedCircularProgressWidget({
    super.key,
    required this.percentage,
  });

  @override
  State<OptimizedCircularProgressWidget> createState() => _OptimizedCircularProgressWidgetState();
}

class _OptimizedCircularProgressWidgetState extends State<OptimizedCircularProgressWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _animation = Tween<double>(begin: 0, end: widget.percentage).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return CustomPaint(
            size: const Size(200, 200),
            painter: _CircularProgressPainter(_animation.value),
          );
        },
      ),
    );
  }
}

class _CircularProgressPainter extends CustomPainter {
  final double percentage;

  _CircularProgressPainter(this.percentage);

  @override
  void paint(Canvas canvas, Size size) {
    // ✅ Use efficient painting techniques
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 10;

    // Background circle
    final backgroundPaint = Paint()
      ..color = Colors.grey.shade300
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, radius, backgroundPaint);

    // Progress arc
    final progressPaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final sweepAngle = 2 * math.pi * percentage;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(_CircularProgressPainter oldDelegate) {
    return oldDelegate.percentage != percentage;
  }
}


class OptimizedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;

  const OptimizedNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: fit,
        // ✅ Performance optimizations
        memCacheWidth: width?.toInt(),
        memCacheHeight: height?.toInt(),
        maxWidthDiskCache: (width ?? 200).toInt(),
        maxHeightDiskCache: (height ?? 200).toInt(),
        placeholder: (context, url) => Container(
          width: width,
          height: height,
          color: Colors.grey.shade200,
          child: const Center(child: CircularProgressIndicator()),
        ),
        errorWidget: (context, url, error) => Container(
          width: width,
          height: height,
          color: Colors.grey.shade300,
          child: const Icon(Icons.error),
        ),
      ),
    );
  }
}


