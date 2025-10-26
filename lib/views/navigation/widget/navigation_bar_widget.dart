import 'dart:ui';
import '../../../../core/utils/basic_import.dart';
import 'bottom_widget.dart';

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        // topLeft: Radius.circular(25),
        // topRight: Radius.circular(25),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 40.0, sigmaY: 40.0),
        child: Container(
          height: Dimensions.heightSize * 6.5,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.03),
            border: Border(
              top: BorderSide(
                color: Colors.white.withOpacity(0.15),
                width: 1.0,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 40,
                spreadRadius: 0,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: BottomBarWidget(
                  path: Assets.icons.home2,
                  svgSize: Dimensions.iconSizeDefault * 1.1,
                  label: 'Home',
                  index: 0,
                ),
              ),
              Expanded(
                child: BottomBarWidget(
                  path: Assets.icons.component85,
                  label: 'Nutrition',
                  index: 1,
                ),
              ),
              Expanded(
                child: BottomBarWidget(
                  path: Assets.icons.frame,
                  label: 'Goal',
                  index: 2,
                ),
              ),
              Expanded(
                child: BottomBarWidget(
                  path: Assets.icons.component86,
                  label: 'Progression',
                  index: 3,
                ),
              ),
              Expanded(
                child: BottomBarWidget(
                  path: Assets.icons.profileAdd,
                  label: "Friends",
                  index: 4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
