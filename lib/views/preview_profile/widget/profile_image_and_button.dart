import 'package:tailored_eats/core/utils/basic_import.dart';

import '../../../widgets/profile_avater_widget.dart';

class ProfileImageAndButton extends StatelessWidget {
  const ProfileImageAndButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: ProfileAvatarWidget(
            size: 100.r,
            imageUrl: 'https://i.pravatar.cc/150',
          ),
        ),
        Space.height.v20,
        TextWidget('Tarek', fontWeight: FontWeight.bold),
        TextWidget('Loose weight', color: CustomColors.grayShade),
        Space.height.v20,
        Row(
          mainAxisAlignment: mainSpaceBet,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Container(
                margin: Dimensions.heightSize.edgeTop * 0.5,
                padding: EdgeInsetsGeometry.symmetric(
                  vertical: Dimensions.verticalSize * 0.25,
                ),

                decoration: BoxDecoration(
                  borderRadius: BorderRadiusGeometry.circular(
                    Dimensions.radius * 0.8,
                  ),
                  border: Border.all(color: CustomColors.primary),
                ),

                child: Center(
                  child: TextWidget(
                    'Reject',
                    fontWeight: FontWeight.bold,

                    color: CustomColors.primary,
                  ),
                ),
              ),
            ),
            Space.width.v10,
            Expanded(
              child: Container(
                margin: Dimensions.heightSize.edgeTop * 0.5,
                padding: EdgeInsetsGeometry.symmetric(
                  vertical: Dimensions.verticalSize * 0.25,
                ),

                decoration: BoxDecoration(
                  borderRadius: BorderRadiusGeometry.circular(
                    Dimensions.radius * 0.8,
                  ),
                  color: CustomColors.primary,
                  border: Border.all(color: CustomColors.primary),
                ),

                child: Center(
                  child: TextWidget(
                    'Accept',
                    fontWeight: FontWeight.bold,
                    color: CustomColors.blackColor,
                  ),
                ),
              ),
            ),
          ],
        ),
        Space.height.v20,
      ],
    );
  }
}
