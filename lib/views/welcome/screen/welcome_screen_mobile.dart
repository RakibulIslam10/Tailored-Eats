part of 'welcome_screen.dart';

class WelcomeScreenMobile extends GetView<WelcomeController> {
  const WelcomeScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: CustomColors.blackColor),
      body: SafeArea(
        child: ListView(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
          children: [
            TextWidget(
              padding: Dimensions.heightSize.edgeBottom * 0.8,
              'Let’s get to know you',
              fontSize: Dimensions.titleLarge,
              fontWeight: FontWeight.bold,
            ),
            TextWidget(
              'A few quick questions to personalize your experience',
              fontSize: Dimensions.titleSmall,
              color: CustomColors.grayShade,
            ),

            Space.height.v30,
            SvgPicture.asset(Assets.dummy.welcom),

            PrimaryButtonWidget(
              padding: Dimensions.verticalSize.edgeVertical * 2.5,
              title: 'Continue',
              onPressed: () => Get.toNamed(Routes.loginScreen),
            ),

            // const Expanded(
            //   child: AgeSelectionScreen(),
            // ),
          ],
        ),
      ),
    );
  }
}

// class AgeSelectionScreen extends GetView<WelcomeController> {
//   const AgeSelectionScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // Top progress bar.
//         LinearProgressIndicator(
//           value: 0.5,
//           backgroundColor: Colors.white.withOpacity(0.2),
//           valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF2E9AFE)),
//         ),
//         const SizedBox(height: 40),
//         // The main content area.
//         Expanded(
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // The main question title.
//                 Text(
//                   'How Old Are You?',
//                   style: Theme.of(context).textTheme.headlineMedium!.copyWith(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(height: 50),
//                 // Use a ListWheelScrollView for scrollable selection
//                 SizedBox(
//                   height: 300, // Constrained height for the wheel
//                   child: Obx(() {
//                     return ListWheelScrollView(
//                       itemExtent: 80.0,
//                       onSelectedItemChanged: (index) {
//                         // Update the selected age based on the scroll position.
//                         controller.selectAge(11 + index);
//                       },
//                       children: List.generate(5, (index) {
//                         final age = 11 + index;
//                         final isSelected = age == controller.selectedAge.value;
//                         return Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 10.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               AnimatedDefaultTextStyle(
//                                 duration: const Duration(milliseconds: 200),
//                                 style: TextStyle(
//                                   color: isSelected ? Colors.white : Colors.white54,
//                                   fontSize: isSelected ? 48 : 24,
//                                   fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//                                 ),
//                                 child: Text('$age'),
//                               ),
//                               const SizedBox(width: 10),
//                               AnimatedDefaultTextStyle(
//                                 duration: const Duration(milliseconds: 200),
//                                 style: TextStyle(
//                                   color: isSelected ? Colors.white : Colors.white54,
//                                   fontSize: isSelected ? 24 : 18,
//                                 ),
//                                 child: const Text('Years old'),
//                               ),
//                             ],
//                           ),
//                         );
//                       }),
//                     );
//                   }),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
