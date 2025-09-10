import 'package:tailored_eats/core/utils/basic_import.dart';
import 'package:tailored_eats/core/utils/extensions.dart';
import 'package:tailored_eats/core/utils/space.dart';
import 'package:tailored_eats/widgets/text_widget.dart';
import 'package:intl/intl.dart';

import '../core/themes/token.dart';

class TimePickerWidget extends StatefulWidget {
  final String hint;
  final String? label;
  final TimeOfDay? initialTime;
  final Function(String) onTimeSelected; // String (HH:mm)

  const TimePickerWidget({
    super.key,
    this.hint = "Select Time",
    this.initialTime,
    required this.onTimeSelected,
    this.label,
  });

  @override
  State<TimePickerWidget> createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  TimeOfDay? _selectedTime;

  @override
  void initState() {
    super.initState();
    _selectedTime = widget.initialTime;
  }

  Future<void> _pickTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),

      // initialEntryMode: TimePickerEntryMode.input, // <-- ছোট ডিজাইন
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: CustomColors.primary,
              // ঘণ্টা/মিনিট সিলেক্ট করলে হাইলাইট রঙ
              onPrimary: Colors.white,
              surface: CustomColors.whiteColor,
            ),
            timePickerTheme: TimePickerThemeData(
              dayPeriodColor: CustomColors.primary, // AM/PM background
              dayPeriodTextColor: MaterialStateColor.resolveWith((states) {
                if (states.contains(MaterialState.selected)) {
                  return Colors.white;
                }
                return CustomColors.primary; // আনসিলেক্টেড
              }),
              dayPeriodShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: CustomColors.primary),
              ),
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: CustomColors.primary,
              ),
            ),
            dialogTheme: DialogThemeData(
              backgroundColor: CustomColors.whiteColor,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _selectedTime = picked;
      });

      // Convert to string HH:mm
      final now = DateTime.now();
      final dt = DateTime(
        now.year,
        now.month,
        now.day,
        picked.hour,
        picked.minute,
      );
      final formatted = DateFormat('HH:mm').format(dt);

      widget.onTimeSelected(formatted);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        TextWidget(
          padding: EdgeInsetsGeometry.only(
            bottom: Dimensions.spaceBetweenInputTitleAndBox * 0.6,
          ),
          widget.label ?? "Select Time",
          fontSize: Dimensions.titleSmall,
          fontWeight: FontWeight.w500,
          color: CustomColors.blackColor.withAlpha(888),
        ),
        InkWell(
          onTap: () => _pickTime(context),
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: Dimensions.defaultHorizontalSize.edgeHorizontal * 0.5,
            height: Dimensions.inputBoxHeight * 0.7,
            decoration: BoxDecoration(
              border: Border.all(color: _selectedTime == null ?CustomColors.disableColor : CustomColors.primary, width: 1.4),
              borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  _selectedTime == null
                      ? widget.hint
                      : _selectedTime!.format(context), // local formatted

                  fontSize: Dimensions.titleSmall,
                  color: _selectedTime == null
                      ? CustomColors.disableColor
                      : Colors.black,
                ),
                Icon(Icons.access_time, color: _selectedTime == null ?CustomColors.disableColor : CustomColors.primary),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
