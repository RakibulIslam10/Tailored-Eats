part of '../screen/home_screen.dart';

class TaskListWidget extends GetView<HomeController> {
  const TaskListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample task data
    final tasks = [
      {'icon': Assets.dummy.milkBottle},
      {'icon': Assets.dummy.workout9992306Traced},
      {'icon': Assets.dummy.walking},
      {'icon': Assets.dummy.meal},
    ];
    return SizedBox(
      height: controller.goalList.length <= 3 ? 120.h : 260.h,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1.6, // Adjusted for bigger cards
        ),
        itemCount: math.min(4, controller.goalList.length),
        itemBuilder: (context, index) => TaskItemWidget(
          icon: tasks[index]['icon'] as String,
          title: controller.goalList[index].title,
          goal: controller.goalList[index],
        ),
      ),
    );
  }
}

class TaskItemWidget extends GetView<HomeController> {
  final String icon;
  final String title;
  final DailyGoal goal; // pass the model directly

  const TaskItemWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.goal,
  });

  @override
  Widget build(BuildContext context) {
    final RxBool isChecked = goal.isCompleted.obs;

    return ClipPath(
      clipper: CustomShapeClipper(),
      child: Container(
        color: const Color(0xFF2C2C2C),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Icon with circular border
                Container(
                  width: 50.w,
                  height: 50.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF00BCD4),
                      width: 2.5,
                    ),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      icon,
                      width: 30.w,
                      height: 30.w,
                      color: const Color(0xFF00BCD4),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                // Title and subtitle
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget(
                        title,
                        fontWeight: FontWeight.w600,
                        fontSize: Dimensions.titleSmall,
                        color: Colors.white,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Bottom checkbox - Centered like the image
            Align(
              alignment: Alignment.center,
              child: Obx(
                () => GestureDetector(
                  onTap: () {
                    isChecked.value = !isChecked.value;
                    controller.goalMark(goal.id);
                  },
                  child: Container(
                    width: 28.w,
                    height: 28.w,
                    decoration: BoxDecoration(
                      color: isChecked.value
                          ? const Color(0xFF00BCD4)
                          : const Color(0xFF3B3B3B),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: isChecked.value
                            ? const Color(0xFF00BCD4)
                            : const Color(0xFF555555),
                        width: 2,
                      ),
                    ),
                    child: isChecked.value
                        ? Icon(Icons.check, color: Colors.white, size: 18.w)
                        : null,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Scale factors to convert from SVG coordinates (178x111) to actual size
    final scaleX = size.width / 178;
    final scaleY = size.height / 111;

    // Starting point
    path.moveTo(18.9365 * scaleX, 1.49042 * scaleY);

    // Line to
    path.lineTo(5.47118 * scaleX, 9.31908 * scaleY);

    // Curve (C command converted to cubic)
    path.cubicTo(
      2.08402 * scaleX,
      11.2884 * scaleY,
      0 * scaleX,
      14.9106 * scaleY,
      0 * scaleX,
      18.8287 * scaleY,
    );

    // Vertical line to
    path.lineTo(0 * scaleX, 58.909 * scaleY);

    // Curve
    path.cubicTo(
      0 * scaleX,
      62.9667 * scaleY,
      2.23383 * scaleX,
      66.6948 * scaleY,
      5.81182 * scaleX,
      68.6087 * scaleY,
    );

    // Line to
    path.lineTo(19.0689 * scaleX, 75.6996 * scaleY);

    // Curve
    path.cubicTo(
      20.6649 * scaleX,
      76.5533 * scaleY,
      22.447 * scaleX,
      77 * scaleY,
      24.257 * scaleX,
      77 * scaleY,
    );

    // Horizontal line
    path.lineTo(57 * scaleX, 77 * scaleY);

    // Curve
    path.cubicTo(
      63.0751 * scaleX,
      77 * scaleY,
      68 * scaleX,
      81.9249 * scaleY,
      68 * scaleX,
      88 * scaleY,
    );

    // Vertical line
    path.lineTo(68 * scaleX, 97.8409 * scaleY);

    // Curve
    path.cubicTo(
      68 * scaleX,
      100.521 * scaleY,
      68.9785 * scaleX,
      103.109 * scaleY,
      70.7518 * scaleX,
      105.119 * scaleY,
    );

    // Line to
    path.lineTo(72.2157 * scaleX, 106.778 * scaleY);

    // Curve
    path.cubicTo(
      74.3039 * scaleX,
      109.144 * scaleY,
      77.3079 * scaleX,
      110.5 * scaleY,
      80.464 * scaleX,
      110.5 * scaleY,
    );

    // Horizontal line
    path.lineTo(96.9566 * scaleX, 110.5 * scaleY);

    // Curve
    path.cubicTo(
      99.5668 * scaleX,
      110.5 * scaleY,
      102.092 * scaleX,
      109.572 * scaleY,
      104.081 * scaleX,
      107.881 * scaleY,
    );

    // Line to
    path.lineTo(107.124 * scaleX, 105.294 * scaleY);

    // Curve
    path.cubicTo(
      109.583 * scaleX,
      103.204 * scaleY,
      111 * scaleX,
      100.14 * scaleY,
      111 * scaleX,
      96.9132 * scaleY,
    );

    // Vertical line
    path.lineTo(111 * scaleX, 88 * scaleY);

    // Curve
    path.cubicTo(
      111 * scaleX,
      81.9249 * scaleY,
      115.925 * scaleX,
      77 * scaleY,
      122 * scaleX,
      77 * scaleY,
    );

    // Horizontal line
    path.lineTo(156.286 * scaleX, 77 * scaleY);

    // Curve
    path.cubicTo(
      158.385 * scaleX,
      77 * scaleY,
      160.44 * scaleX,
      76.3996 * scaleY,
      162.208 * scaleX,
      75.2697 * scaleY,
    );

    // Line to
    path.lineTo(172.422 * scaleX, 68.7441 * scaleY);

    // Curve
    path.cubicTo(
      175.586 * scaleX,
      66.723 * scaleY,
      177.5 * scaleX,
      63.2283 * scaleY,
      177.5 * scaleX,
      59.4744 * scaleY,
    );

    // Vertical line
    path.lineTo(177.5 * scaleX, 18.2534 * scaleY);

    // Curve
    path.cubicTo(
      177.5 * scaleX,
      14.6494 * scaleY,
      175.735 * scaleX,
      11.274 * scaleY,
      172.774 * scaleX,
      9.2183 * scaleY,
    );

    // Line to
    path.lineTo(162.329 * scaleX, 1.96493 * scaleY);

    // Curve
    path.cubicTo(
      160.487 * scaleX,
      0.685611 * scaleY,
      158.298 * scaleX,
      0 * scaleY,
      156.055 * scaleX,
      0 * scaleY,
    );

    // Horizontal line
    path.lineTo(24.4653 * scaleX, 0 * scaleY);

    // Final curve back to start
    path.cubicTo(
      22.5231 * scaleX,
      0 * scaleY,
      20.6155 * scaleX,
      0.514229 * scaleY,
      18.9365 * scaleX,
      1.49042 * scaleY,
    );

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// Custom Painter for curved shape (NOT USED NOW - Using ClipPath instead)
class TaskCardPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF2C2C2C)
      ..style = PaintingStyle.fill;

    final path = Path();

    // Start from top-left with larger curve
    path.moveTo(40, 0);

    // Top edge with larger curve
    path.lineTo(size.width - 40, 0);
    path.quadraticBezierTo(size.width - 10, 0, size.width, 30);

    // Right edge
    path.lineTo(size.width, size.height - 40);
    path.quadraticBezierTo(
      size.width,
      size.height - 10,
      size.width - 40,
      size.height,
    );

    // Bottom edge with larger curve going up (more prominent dip)
    path.lineTo(size.width * 0.6, size.height);
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height - 20, // Deeper dip
      size.width * 0.4,
      size.height,
    );
    path.lineTo(40, size.height);

    // Bottom-left corner with larger curve
    path.quadraticBezierTo(10, size.height, 0, size.height - 30);

    // Left edge
    path.lineTo(0, 40);
    path.quadraticBezierTo(0, 10, 30, 0);

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
