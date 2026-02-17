part of '../screen/profile_screen.dart';

class InfoCardWidget extends GetView<ProfileController> {
  const InfoCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Get.find<HomeController>().macrosModel.value?.data;
    return Row(
      children: [
        _buildStatCard('${data?.height} cm', 'Height'),
        Space.width.v10,
        _buildStatCard('${data?.weight.first.weightKg} kg', 'Weight'),
        Space.width.v10,
        _buildStatCard('${data?.gender}', 'Sex'),
        Space.width.v10,
        _buildStatCard('${data?.calorie.calorieGoal} cal', 'Calorie Intake'),
      ],
    );
  }
  Widget _buildStatCard(String value, String label) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(Dimensions.paddingSize * 0.6),
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(Dimensions.radius),
        ),
        child: Column(
          crossAxisAlignment: crossStart,
          children: [
            TextWidget(
              value,
              maxLines: 1,
              fontSize: Dimensions.titleSmall,
              fontWeight: FontWeight.bold,
              color: CustomColors.whiteColor,
            ),
            Space.height.v5,
            TextWidget(
              label,
              maxLines: 1,
              fontSize: Dimensions.titleSmall * 0.8,
              color: CustomColors.secondaryDarkText,
            ),
          ],
        ),
      ),
    );
  }
}
