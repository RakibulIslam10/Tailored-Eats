import 'package:tailored_eats/widgets/text_widget.dart';
import '../core/languages/strings.dart';
import '../core/themes/token.dart';
import '../core/utils/basic_import.dart';
import '../core/utils/space.dart';
import '../gen/assets.gen.dart';

class EmptyDataWidget extends StatelessWidget {
  final String? massage;

  const EmptyDataWidget({super.key, this.massage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.defaultHorizontalSize * 4,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.icons.empty),
            Space.height.v5,
            TextWidget(
              maxLines: 2,
              textOverflow: TextOverflow.ellipsis,
              massage ?? Strings.noDataFound,
              color: Colors.grey,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
