part of '../screen/home_screen.dart';

class TaskListWidget extends StatelessWidget {
  const TaskListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2C),
        borderRadius: BorderRadius.circular(Dimensions.radius * 0.85),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TaskItem(label: 'Steps Target - 9000 Steps'),
          TaskItem(label: 'Drink 2L Water'),
          TaskItem(label: '20 Min exercise'),
        ],
      ),
    );
  }
}

class TaskItem extends StatelessWidget {
  final String label;
  final RxBool _isChecked = false.obs;

  TaskItem({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextWidget(label, fontSize: Dimensions.titleSmall),
        Obx(
          () => Checkbox(
            value: _isChecked.value,
            onChanged: (bool? newValue) {
              _isChecked.value = newValue ?? false;
            },
            activeColor: CustomColors.progressColor,
            checkColor: Colors.white,
            fillColor: MaterialStateProperty.resolveWith<Color>((
              Set<MaterialState> states,
            ) {
              if (states.contains(MaterialState.selected)) {
                return CustomColors.progressColor;
              }
              return const Color(0xFF3B3B3B);
            }),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            side: const BorderSide(color: Color(0xFF3B3B3B), width: 2),
          ),
        ),
      ],
    );
  }
}
