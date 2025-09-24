part of '../screen/profile_creation_screen.dart';

class SelectableListWidget extends GetView<ProfileCreationController> {
  final String title;
  final List<Map<String, String>> items;

  const SelectableListWidget({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextWidget(
          title,
          fontSize: Dimensions.titleLarge,
          fontWeight: FontWeight.bold,
        ),
        Space.height.v100,
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Obx(() {
                final isSelected =
                    controller.selectedLevel.value == item["title"];
                return InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    controller.selectedLevel.value = item["title"]!;
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
                      title: item["title"]!,
                      subtitle: item["subtitle"]!,
                      iconPath: item["iconPath"]!,
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
