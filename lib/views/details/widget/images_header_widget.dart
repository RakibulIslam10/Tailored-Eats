part of '../screen/details_screen.dart';

class ImagesHeaderWidget extends GetView<DetailsController> {
  const ImagesHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossCenter,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(Dimensions.radius),
              child: CachedNetworkImage(
                imageUrl:
                'https://www.allrecipes.com/thmb/SoBuPU73KcbYHl3Kp3j8Xx4A3fc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/8805-CrispyFriedChicken-mfs-3x2-072-d55b8406d4ae45709fcdeb58a04143c2.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                placeholder: (context, url) =>
                    Container(color: Colors.grey.shade100),
                errorWidget: (context, url, error) => Container(
                  color: Colors.grey.shade100,
                  child: Icon(
                    Icons.image_not_supported,
                    size: Dimensions.iconSizeLarge * 1.2,
                  ),
                ),
              ),
            ),

            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.5), // subtle black
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ],
        ),
        TextWidget(
          padding: Dimensions.heightSize.edgeTop,
          'Delicious lobster gourmet ',
          fontWeight: FontWeight.bold,
          fontSize: Dimensions.titleLarge * 0.9,
        ),

      ],
    );
  }
}
