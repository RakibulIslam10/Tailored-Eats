part of 'find_frined_screen.dart';

class FindFrinedScreenMobile extends GetView<FindFrinedController> {
  const FindFrinedScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "Find Frined"),
      body: SafeArea(
        child: ListView(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          children: [
            Container(
              height: Dimensions.inputBoxHeight * 0.7,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(Dimensions.radius),
              ),
              child: TextFormField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: const Icon(
                    CupertinoIcons.search,
                    color: Colors.white,
                  ),
                  hintText: 'Search...',
                  hintStyle: TextStyle(
                    fontSize: Dimensions.titleSmall * 1.1,
                    color: Colors.white.withOpacity(0.6),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: Dimensions.heightSize * 0.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
