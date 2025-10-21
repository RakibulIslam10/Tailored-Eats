part of '../screen/home_screen.dart';

class TaskListWidget extends StatelessWidget {
  const TaskListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final RxBool isChecked = false.obs;

    return SizedBox(
      height: 230.h,
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1.8,
        ),
        itemCount: 4,
        itemBuilder: (context, index) => Container(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          decoration: BoxDecoration(
            color: const Color(0xFF2C2C2C),
            borderRadius: BorderRadius.circular(Dimensions.radius * 0.85),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.icons.watter, width: 30.w, height: 30.w),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(
                    child: TextWidget(
                      "Drinking water",
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.titleSmall,
                      maxLines: 2,
                    ),
                  ),
                  Row(
                    children: [
                      TextWidget(
                        "2L",
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: Dimensions.titleSmall,
                      ),
                      Obx(
                        () => Checkbox(
                          value: isChecked.value,
                          onChanged: (bool? newValue) {
                            isChecked.value = newValue ?? false;
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
                          side: const BorderSide(
                            color: Color(0xFF3B3B3B),
                            width: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
