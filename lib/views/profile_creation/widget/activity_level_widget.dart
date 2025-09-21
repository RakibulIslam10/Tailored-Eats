part of '../screen/profile_creation_screen.dart';

class ActivityLevelWidget extends GetView<ProfileCreationController> {
  const ActivityLevelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> activityList = [
      {
        "title": "Sedentary",
        "subtitle": "Less than 3000 steps daily",
        "iconPath": "assets/icons/Group 1000004246.svg",
      },
      {
        "title": "Lightly Active",
        "subtitle": "3000-6000 steps daily",
        "iconPath": "assets/icons/Group 1000004247.svg",
      },
      {
        "title": "Active",
        "subtitle": "More than 10000 steps daily",
        "iconPath": "assets/icons/Group 1000004254.svg",
      },
      {
        "title": "Very Active",
        "subtitle": "More than 10000 steps daily",
        "iconPath": "assets/icons/Group 1000004254.svg",
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextWidget(
          'What’s Your Activity Level?',
          fontSize: Dimensions.titleLarge,
          fontWeight: FontWeight.bold,
        ),
        Space.height.v100,
        Expanded(
          child: ListView.builder(
            itemCount: activityList.length,
            itemBuilder: (context, index) {
              final activity = activityList[index];
              return Obx(() {
                final isSelected =
                    controller.selectedLevel.value == activity["title"];
                return InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    controller.selectedLevel.value = activity["title"]!;
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: Dimensions.defaultHorizontalSize,
                      vertical: Dimensions.verticalSize * 0.3,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? CustomColors.primary.withOpacity(0.2)
                          : Colors.transparent,
                      border: isSelected
                          ? Border.all(color: CustomColors.primary, width: 1.5)
                          : null,
                      borderRadius: BorderRadius.circular(Dimensions.radius),
                    ),
                    child: ActivityCard(
                      title: activity["title"]!,
                      subtitle: activity["subtitle"]!,
                      iconPath: activity["iconPath"]!,
                    ),
                  ),
                );
              });
            },
          ),
        ),
      ],
    );
  }
}
