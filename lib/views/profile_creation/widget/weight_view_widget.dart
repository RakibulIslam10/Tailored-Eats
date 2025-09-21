part of '../screen/profile_creation_screen.dart';

class WeightPicker extends StatefulWidget {
  const WeightPicker({super.key});

  @override
  _WeightPickerState createState() => _WeightPickerState();
}

class _WeightPickerState extends State<WeightPicker> {
  final PageController _pageController = PageController(
    initialPage: 50,
    viewportFraction: 0.05,
  );
  int _currentValue = 50;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final page = _pageController.page ?? 0;
    setState(() {
      _currentValue = page.round();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Dimensions.defaultHorizontalSize.edgeHorizontal,
      child: Column(
        children: [
          TextWidget(
            'What is your current weight?',
            fontSize: Dimensions.titleLarge,
            fontWeight: FontWeight.bold,
          ),

          Space.height.v100,
          const TextWidget(
            'Weight (Kg)',
            color: Colors.white38,
            fontWeight: FontWeight.bold,
          ),
          Space.height.v10,
          TextWidget(
            _currentValue.toString(),
            fontWeight: FontWeight.bold,
            color: CustomColors.primary,
            fontSize: Dimensions.displayLarge,
          ),
          Space.height.v20,
          _buildRuler(),
          Space.height.v100,

        ],
      ),
    );
  }

  Widget _buildRuler() {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 50.h,
          child: PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            itemCount: 201, // 0–200 kg
            itemBuilder: (context, index) {
              bool isMajor = index % 10 == 0;
              bool isMinor = index % 5 == 0 && !isMajor;

              return Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 2.w,
                  height: isMajor ? 40.h : (isMinor ? 30.h : 20.h),
                  decoration: BoxDecoration(
                    color: isMajor ? Colors.white : Colors.white54,
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),
              );
            },
          ),
        ),

        Positioned(
          child: Container(
            width: 4.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: CustomColors.primary,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
      ],
    );
  }
}
