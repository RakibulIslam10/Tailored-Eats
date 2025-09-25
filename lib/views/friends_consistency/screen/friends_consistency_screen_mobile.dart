part of 'friends_consistency_screen.dart';

class FriendsConsistencyScreenMobile extends GetView<FriendsConsistencyController> {
  const FriendsConsistencyScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Friends Consistency"),
      body: SafeArea(
        child: ListView(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          children: [
            AllFriendsWidget()
          
          ],
        ),
      ),
    );
  }
}
