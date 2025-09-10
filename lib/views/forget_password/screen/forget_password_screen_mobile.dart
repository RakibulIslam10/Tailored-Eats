part of 'forget_password_screen.dart';

class ForgetPasswordScreenMobile extends GetView<ForgetPasswordController> {
  const ForgetPasswordScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ForgetPassword", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: ListView(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          children: const [
            // Add your widgets here
          ],
        ),
      ),
    );
  }
}
