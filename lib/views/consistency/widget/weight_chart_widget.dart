part of '../screen/consistency_screen.dart';

class WeightChartWidget extends GetView<ConsistencyController> {
  const WeightChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // Show loading state
      if (controller.isLoadingWeight.value) {
        return Container(
          height: 320.h,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: const Center(
            child: CircularProgressIndicator(color: CustomColors.progressColor),
          ),
        );
      }

      if (controller.weightList.isEmpty) {
        return const SizedBox.shrink();
      }

      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Weight Control",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Space.height.v15,
            SizedBox(
              height: 240.h,
              child: LineChart(
                LineChartData(
                  backgroundColor: Colors.transparent,
                  // gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, _) {
                          final index = value.toInt();
                          if (index >= 0 &&
                              index < controller.weightList.length) {
                            return Padding(
                              padding: EdgeInsets.only(top: 8.0.h),
                              child: Text(
                                controller.weightList[index].label,
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 11.sp,
                                ),
                              ),
                            );
                          }
                          return const Text('');
                        },
                        reservedSize: 25,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 20,
                        getTitlesWidget: (value, _) {
                          return Text(
                            '${value.toInt()}kg',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 11.sp,
                            ),
                          );
                        },
                        reservedSize: 40.w,
                      ),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: Colors.white24),
                  ),
                  minX: 0,
                  maxX: (controller.weightList.length - 1).toDouble(),
                  minY: controller.minWeight,
                  maxY: controller.maxWeight,
                  lineBarsData: [
                    LineChartBarData(
                      spots: controller.weightList
                          .map((e) => FlSpot(e.x, e.y))
                          .toList(),
                      isCurved: true,
                      barWidth: 3,
                      color: CustomColors.progressColor,
                      dotData: FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, barData, index) {
                          return FlDotCirclePainter(
                            radius: 6,
                            color: Colors.transparent,
                            strokeWidth: 2,
                            strokeColor: CustomColors.progressColor,
                          );
                        },
                      ),
                    ),
                  ],
                  extraLinesData: ExtraLinesData(horizontalLines: []),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Center(
              child: Wrap(
                spacing: 12.w,
                children: controller.weightList.map((e) {
                  return Text(
                    e.change,
                    style: TextStyle(
                      fontSize: Dimensions.titleSmall * 0.9,
                      color: e.change.startsWith('+')
                          ? Colors.greenAccent
                          : Colors.redAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      );
    });
  }
}
