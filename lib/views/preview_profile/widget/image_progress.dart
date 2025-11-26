import 'package:tailored_eats/core/api/end_point/api_end_points.dart';
import 'package:tailored_eats/core/utils/basic_import.dart';
import 'package:tailored_eats/routes/routes.dart';
import '../../consistency/model/user_progress_image_model.dart';

class ReusableImageProgress extends StatelessWidget {
  final String title;
  final List<DatumData> items;
  final double? height;

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
        Row(
          mainAxisAlignment: mainSpaceBet,
          children: [
            TextWidget(
              title,
              fontSize: Dimensions.titleLarge * 0.8,
              fontWeight: FontWeight.bold,
              padding: EdgeInsets.symmetric(
                vertical: Dimensions.verticalSize * 0.8,
              ),
            ),

            TextWidget(
              'View All ',
              color: CustomColors.primary,
              onTap: () => Get.toNamed(Routes.pictureProgressScreen),
            ),
          ],
        ),
        if (items.isNotEmpty)
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
                        imageUrl:
                            '${ApiEndPoints.mainDomain}/${items[index].url}',
                        fit: BoxFit.cover,
                        width: 175.w,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

        if (items.isEmpty)
          Container(
            height: screenHeight * 0.20,
            width: 100.w,

            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(Dimensions.radius),
            ),
            child: Icon(
              Icons.add,
              fontWeight: FontWeight.bold,
              size: Dimensions.iconSizeLarge,
              color: CustomColors.whiteColor,
            ),
          ),
      ],
    );
  }
}
