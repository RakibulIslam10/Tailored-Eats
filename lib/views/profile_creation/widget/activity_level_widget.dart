part of '../screen/profile_creation_screen.dart';

class ActivityLevelWidget extends StatelessWidget {
  const ActivityLevelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        TextWidget(
          'How Do You Identify Yourself ?',
          fontSize: Dimensions.titleLarge,
          fontWeight: FontWeight.bold,
        ),

        Space.height.v100,
        ActivityCard(
          title: 'Sedentary',
          subtitle: 'Less than 3000 steps daily',
          iconPath: 'assets/icons/Group 1000004246.svg',
          onTap: () {},
        ),

        ActivityCard(
          title: 'Lightly Active',
          subtitle: '3000-6000 steps daily',
          iconPath: 'assets/icons/Group 1000004247.svg',
          onTap: () {
            print('Lightly Active selected');
          },
        ),

        ActivityCard(
          title: 'Very Active',
          subtitle: 'More than 10000 steps daily',
          iconPath: 'assets/icons/Group 1000004254.svg',
          onTap: () {
            print('Very Active selected');
          },
        ),
        ActivityCard(
          title: 'Very Active',
          subtitle: 'More than 10000 steps daily',
          iconPath: 'assets/icons/Group 1000004254.svg',
          onTap: () {
            print('Very Active selected');
          },
        ),
      ],
    );
  }
}
