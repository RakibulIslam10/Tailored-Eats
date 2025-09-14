part of '../screen/consistency_screen.dart';

class WeightChartWidget extends GetView<ConsistencyController> {
  const WeightChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Weight Control",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 250,
              child: LineChart(
                LineChartData(
                  backgroundColor: Colors.transparent,
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, _) {
                          final index = value.toInt();
                          if (index >= 0 &&
                              index < controller.weightList.length) {
                            return Text(
                              controller.weightList[index].label,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            );
                          }
                          return const Text('');
                        },
                        reservedSize: 30,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 5,
                        getTitlesWidget: (value, _) {
                          return Text(
                            '${value.toInt()}kg',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          );
                        },
                        reservedSize: 40,
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
                  maxX: controller.weightList.length - 1.toDouble(),
                  minY: 55,
                  maxY: 80,
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
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              children: controller.weightList.map((e) {
                return Text(
                  e.change,
                  style: TextStyle(
                    color: e.change.startsWith('+')
                        ? Colors.greenAccent
                        : Colors.redAccent,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      );
    });
  }
}
