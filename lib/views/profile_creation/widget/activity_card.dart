import '../../../core/utils/basic_import.dart';

class ActivityCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String iconPath;

  const ActivityCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.paddingSize * 0.6),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(Dimensions.radius),
      ),
      child: Row(
        children: [
          Container(
            padding: REdgeInsets.all(Dimensions.paddingSize * 0.3),
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle
            ),
            child: Center(
              child: SvgPicture.asset(
                iconPath,
                width: 40.w,
                height: 40.h,
              ),
            ),
          ),
          SizedBox(width: Dimensions.defaultHorizontalSize),
          // Text content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(
                  title,
                  fontWeight: FontWeight.w600,
                  fontSize: Dimensions.titleMedium,
                  color: Colors.white,
                  maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                ),
                Space.height.v5,
                TextWidget(
                  subtitle,
                  fontSize: Dimensions.titleSmall,
                  color: CustomColors.grayShade,
                  fontWeight: FontWeight.w400,
                  maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
