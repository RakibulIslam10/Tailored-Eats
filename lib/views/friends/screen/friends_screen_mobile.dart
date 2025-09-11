part of 'friends_screen.dart';

class FriendsScreenMobile extends GetView<FriendsController> {
  const FriendsScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Friends"),
      body: SafeArea(
        child: ListView(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          children: const [

          
          ],
        ),
      ),
    );
  }
}
