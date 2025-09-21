part of '../screen/details_screen.dart';

class IngredientsWidget extends GetView<DetailsController> {
  const IngredientsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          TextWidget(
            'Ingredients',
            fontWeight: FontWeight.bold,
            padding: Dimensions.verticalSize.edgeVertical * 0.6,
          ),

          Column(
            children: List.generate(2, (rowIndex) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(5, (colIndex) {
                  final index = rowIndex * 5 + colIndex;
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: Dimensions.heightSize),
                      child: Column(
                        children: [
                          ProfileAvatarWidget(
                            imageUrl:
                            'https://cdn.britannica.com/36/123536-050-95CB0C6E/Variety-fruits-vegetables.jpg',
                          ),
                          TextWidget(
                            'Item $index',
                            fontSize: Dimensions.titleSmall * 0.9,
                            color: Colors.white38,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            textOverflow: TextOverflow.ellipsis,
                          ),
                          TextWidget(
                            '3/4 cup',
                            fontSize: Dimensions.titleSmall * 0.8,
                            color: CustomColors.grayShade,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              );
            }),
          )

        ],
      ),
    );
  }
}
