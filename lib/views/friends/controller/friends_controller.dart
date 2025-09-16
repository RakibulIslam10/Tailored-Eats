import '../../../core/utils/basic_import.dart';

class FriendsController extends GetxController {
  final selectedIndex = 0.obs;

  void changeTab(int index) {
    selectedIndex.value = index;
  }
}
