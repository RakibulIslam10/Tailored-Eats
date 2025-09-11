part of 'profile_screen.dart';

class ProfileScreenMobile extends GetView<ProfileController> {
  const ProfileScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Profile"),
      body: SafeArea(
        child: ListView(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          children: const [],
        ),
      ),
    );
  }
}
