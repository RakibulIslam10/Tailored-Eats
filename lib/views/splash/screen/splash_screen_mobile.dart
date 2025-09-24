part of 'splash_screen.dart';

class SplashScreenMobile extends GetView<SplashController> {
  const SplashScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(Dimensions.paddingSize * 5),
          child: Image.asset(Assets.dummy.logo.path, fit: BoxFit.contain),
        ),
      ),
    );
  }
}
