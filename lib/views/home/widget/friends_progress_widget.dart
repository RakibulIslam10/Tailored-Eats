part of '../screen/home_screen.dart';

class FriendsProgressWidget extends GetView<HomeController> {
  const FriendsProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        TextWidget(
          'Don’t Forget Your Daily Goal',
          fontWeight: FontWeight.bold,
          padding: Dimensions.heightSize.edgeVertical,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.10,
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
                    crossAxisAlignment: crossStart,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget("50%", fontWeight: FontWeight.bold),
                      Space.height.v5,
                      Row(
                        children: [
                          SvgPicture.asset(Assets.icons.calories),
                          TextWidget(
                            padding: Dimensions.widthSize.edgeLeft,
                            'Arif Istiaque',
                            color: CustomColors.grayShade,
                            fontSize: Dimensions.titleSmall * 0.8,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
