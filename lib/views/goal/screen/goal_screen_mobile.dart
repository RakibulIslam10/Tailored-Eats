part of 'goal_screen.dart';

class GoalScreenMobile extends GetView<GoalController> {
  const GoalScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Goal"),
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
