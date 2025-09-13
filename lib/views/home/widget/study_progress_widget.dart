part of '../screen/home_screen.dart';

class StudyProgressWidget extends GetView<HomeController> {
  const StudyProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.12,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        cacheExtent: 500,
        itemBuilder: (context, index) {
          return RepaintBoundary(
            child: Container(
              margin: EdgeInsetsGeometry.only(right: Dimensions.widthSize),
              padding: EdgeInsets.symmetric(
                vertical: Dimensions.verticalSize * 0.4,
                horizontal: Dimensions.defaultHorizontalSize,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF2C2C2C),
                borderRadius: BorderRadius.circular(Dimensions.radius * 0.85),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 45.w,
                    height: 40.h,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 45.w,
                          height: 40.h,
                          child: CircularProgressIndicator(
                            value: 0.92,
                            backgroundColor: const Color(0xFF3B3B3B),
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Color(0xFF00BFFF),
                            ),
                            strokeWidth: 4,
                          ),
                        ),
                        TextWidget(
                          '${(0.92 * 100).toInt()}%',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                  TextWidget(
                    padding: Dimensions.heightSize.edgeTop * 0.6,

                    '27 july',
                    color: CustomColors.grayShade,
                    fontSize: 10.sp,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
