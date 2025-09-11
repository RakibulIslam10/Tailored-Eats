import 'package:tailored_eats/views/consistency/screen/consistency_screen.dart';
import 'package:tailored_eats/views/friends/screen/friends_screen.dart';
import 'package:tailored_eats/views/goal/screen/goal_screen.dart';
import 'package:tailored_eats/views/home/screen/home_screen.dart';
import 'package:tailored_eats/views/nutrition/screen/nutrition_screen.dart';
import 'package:tailored_eats/views/profile/screen/profile_screen.dart';

import '../../../core/utils/basic_import.dart';

class NavigationController extends GetxController {
  RxInt selectedIndex = 0.obs;

  List<Widget> bodyPages = [
    HomeScreen(),
    NutritionScreen(),
    GoalScreen(),
    ConsistencyScreen(),
    FriendsScreen(),
  ];

  void changePage(int index) {
    selectedIndex.value = index;
  }

  void goToHome() {
    changePage(0);
  }

  void goToProfile() {
    changePage(3);
  }
}
