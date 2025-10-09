part of '../screen/profile_creation_screen.dart';

class WeightPicker extends StatefulWidget {
  const WeightPicker({super.key});

  @override
  _WeightPickerState createState() => _WeightPickerState();
}

class _WeightPickerState extends State<WeightPicker> {
  final ProfileCreationController controller = Get.find<ProfileCreationController>();

  PageController _pageController = PageController(
    initialPage: 50,
    viewportFraction: 0.05,
  );
  final TextEditingController _weightController = TextEditingController(text: '50');
  final FocusNode _focusNode = FocusNode();
  int _currentValue = 50;
  bool _isManualInput = false;
  bool _isKg = true;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_onScroll);
    _focusNode.addListener(() {
      setState(() {
        _isManualInput = _focusNode.hasFocus;
        // Controller theke directly access korte parben
        print(controller.weightInKg.value);  // KG value
        print(controller.weightInLbs.value); // LBS value
        print(controller.weightUnit.value);  // Selected unit (KG/LBS)
      });
    });
    _updateControllerValues();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _weightController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _updateControllerValues() {
    // Store both KG and LBS values in controller
    if (_isKg) {
      controller.weightInKg.value = _currentValue.toDouble();
      controller.weightInLbs.value = (_currentValue * 2.205);
    } else {
      controller.weightInLbs.value = _currentValue.toDouble();
      controller.weightInKg.value = (_currentValue / 2.205);
    }
    controller.weightUnit.value = _isKg ? 'KG' : 'LBS';
  }

  void _onScroll() {
    final page = _pageController.page ?? 0;
    setState(() {
      _currentValue = page.round();
      _weightController.text = _currentValue.toString();
    });
    _updateControllerValues();
  }

  void _onManualInput(String value) {
    if (value.isNotEmpty) {
      int? weight = int.tryParse(value);
      int maxValue = _isKg ? 200 : 440; // 200kg or 440lbs
      if (weight != null && weight >= 0 && weight <= maxValue) {
        setState(() {
          _currentValue = weight;
        });
        _pageController.jumpToPage(weight);
        _updateControllerValues();
      }
    }
  }

  void _toggleUnit() {
    setState(() {
      _isKg = !_isKg;

      // Convert current value
      if (_isKg) {
        // LBS to KG
        _currentValue = (_currentValue / 2.205).round();
      } else {
        // KG to LBS
        _currentValue = (_currentValue * 2.205).round();
      }

      _weightController.text = _currentValue.toString();

      // Recreate PageController with new range
      _pageController.dispose();
      _pageController = PageController(
        initialPage: _currentValue,
        viewportFraction: 0.05,
      );
      _pageController.addListener(_onScroll);

      _updateControllerValues();
    });
  }

  @override
  Widget build(BuildContext context) {
    print(controller.weightInKg.value);
    print(controller.weightInLbs.value);
    return Container(
      margin: Dimensions.defaultHorizontalSize.edgeHorizontal,
      child: Column(
        children: [
          TextWidget(
            'What is your current weight?',
            fontSize: Dimensions.titleLarge,
            fontWeight: FontWeight.bold,
          ),
          Space.height.v40,

          // Unit Toggle
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.white.withOpacity(0.1),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildUnitButton('KG', _isKg),
                _buildUnitButton('LBS', !_isKg),
              ],
            ),
          ),

          Space.height.v40,
          TextWidget(
            'Weight (${_isKg ? 'Kg' : 'Lbs'})',
            color: Colors.white38,
            fontWeight: FontWeight.bold,
          ),
          Space.height.v10,

          // Manual Input Field
          GestureDetector(
            onTap: () {
              _focusNode.requestFocus();
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: _isManualInput
                      ? CustomColors.primary
                      : Colors.white.withOpacity(0.1),
                  width: 2,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100.w,
                    child: TextField(
                      controller: _weightController,
                      focusNode: _focusNode,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: Dimensions.displayLarge,
                        fontWeight: FontWeight.bold,
                        color: CustomColors.primary,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                        isDense: true,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(3),
                      ],
                      onChanged: _onManualInput,
                    ),
                  ),
                  Space.width.v10,
                  TextWidget(
                    _isKg ? 'kg' : 'lbs',
                    fontSize: Dimensions.titleMedium,
                    color: Colors.white54,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
          ),

          Space.height.v40,
          _buildRuler(),
          Space.height.v20,

          TextWidget(
            'Scroll or type to adjust',
            color: Colors.white38,
            fontSize: Dimensions.bodySmall,
          ),

          Space.height.v100,
        ],
      ),
    );
  }

  Widget _buildUnitButton(String unit, bool isSelected) {
    return GestureDetector(
      onTap: isSelected ? null : _toggleUnit,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected ? CustomColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextWidget(
          unit,
          fontSize: Dimensions.titleSmall,
          fontWeight: FontWeight.bold,
          color: isSelected ? Colors.white : Colors.white54,
        ),
      ),
    );
  }

  Widget _buildRuler() {
    int maxValue = _isKg ? 201 : 441; // 0-200kg or 0-440lbs

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 50.h,
          child: PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            itemCount: maxValue,
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