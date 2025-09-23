import 'package:tailored_eats/core/utils/basic_import.dart';

class ReusableImageProgress extends StatelessWidget {
  final String title;
  final List<String> items;
  final double? height; // Optional: allows custom height

  const ReusableImageProgress({
    super.key,
    required this.title,
    required this.items,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          title,
          fontSize: Dimensions.titleLarge * 0.8,
          fontWeight: FontWeight.bold,
          padding: EdgeInsets.symmetric(
            vertical: Dimensions.verticalSize * 0.8,
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: height ?? screenHeight * 0.25,
            minHeight: screenHeight * 0.10,
          ),
          child: SizedBox(
            height: height ?? screenHeight * 0.25,
            child: ListView.builder(
              itemCount: items.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              cacheExtent: 500,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: Dimensions.defaultHorizontalSize.edgeRight,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(Dimensions.radius),
                    child: CachedNetworkImage(
                      imageUrl: items[index],
                      fit: BoxFit.cover,
                      width: 175.w, // Use .w if screenutil is initialized
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
