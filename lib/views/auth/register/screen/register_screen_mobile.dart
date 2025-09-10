part of 'register_screen.dart';

class RegisterScreenMobile extends GetView<RegisterController> {
  const RegisterScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: ''),
      body: SafeArea(
        child: ListView(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          children: [
            TextWidget(
              textAlign: TextAlign.center,
              'Create Your Profile',
              fontWeight: FontWeight.bold,
              fontSize: Dimensions.titleLarge,
            ),
            TextWidget(
              textAlign: TextAlign.center,
              'Sign up to save your progress and access your plan anywhere',
              color: CustomColors.grayShade,
              padding: EdgeInsets.only(top: Dimensions.heightSize * 0.2),
              fontSize: Dimensions.titleSmall,
            ),
            RegisterFields()


          ],
        ),
      ),
    );
  }
}
