part of '../screen/profile_creation_screen.dart';

class AgeViewWidget extends GetView<ProfileCreationController> {
  const AgeViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          TextWidget(
            'How Do You Identify Yourself ?',
            fontSize: Dimensions.titleLarge,
            fontWeight: FontWeight.bold,
          ),
          Space.height.v10,
          SizedBox(
            height: 300.h,
            child: CupertinoPicker(
              looping: false,
              itemExtent: 50,
              magnification: 0.9,
              squeeze: 1.2,
              useMagnifier: true,
              scrollController: FixedExtentScrollController(
                initialItem: controller.selectedAge.value - 11,
              ),
              selectionOverlay: Container(),
              onSelectedItemChanged: (index) {
                controller.setAge(11 + index);
              },
              children: List.generate(100, (index) {
                final age = 11 + index;
                return Obx(() {
                  final isSelected = controller.selectedAge.value == age;
                  return Center(
                    child: TextWidget(
                      '$age Years old',
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.white54,
                        fontSize: isSelected
                            ? Dimensions.displaySmall * 1.2
                            : Dimensions.displaySmall * 0.8,
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  );
                });
              }),
            ),
          ),
        ],
      ),
    );
  }
}
