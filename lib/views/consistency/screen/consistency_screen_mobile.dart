part of 'consistency_screen.dart';

class ConsistencyScreenMobile extends GetView<ConsistencyController> {
  const ConsistencyScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Consistency"),
      body: SafeArea(
        child: ListView(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          children:  [


          ],
        ),
      ),
    );
  }
}
