import 'package:tailored_eats/core/themes/token.dart';
import 'package:tailored_eats/core/utils/basic_import.dart';
import 'package:tailored_eats/core/utils/extensions.dart';
import 'package:tailored_eats/core/utils/space.dart';
import 'package:tailored_eats/widgets/text_widget.dart';
import 'package:intl/intl.dart';

class DatePickerWidget extends StatefulWidget {
  final String hint;
  final String? label;
  final DateTime? initialDate;
  final Function(DateTime) onDateSelected;

  const DatePickerWidget({
    super.key,
    this.hint = "Select Date",
    this.initialDate,
    required this.onDateSelected,
    this.label,
  });

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime? _selectedDate;
  final DateFormat _formatter = DateFormat("yyyy-MM-dd");

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
  }

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: CustomColors.primary,
              onPrimary: Colors.white,
              surface: CustomColors.whiteColor,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: CustomColors.primary, // Button text color
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
        _selectedDate = picked;
      });
      widget.onDateSelected(picked);
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
          widget.label ?? "Select Date",
          fontSize: Dimensions.titleSmall,
          fontWeight: FontWeight.w500,
          color: CustomColors.blackColor.withAlpha(888),
        ),
        InkWell(
          onTap: () => _pickDate(context),
          borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
          child: Container(
            padding: Dimensions.defaultHorizontalSize.edgeHorizontal * 0.5,
            height: Dimensions.inputBoxHeight * 0.7,
            decoration: BoxDecoration(
              border: Border.all(color: _selectedDate == null ?CustomColors.disableColor : CustomColors.primary, width: 1.4),
              borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextWidget(
                    _selectedDate == null
                        ? widget.hint
                        : _formatter.format(_selectedDate!),

                    fontSize: Dimensions.titleSmall,
                    color: _selectedDate == null
                        ? CustomColors.disableColor
                        : Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Icon(Icons.calendar_today, color:_selectedDate == null ?CustomColors.disableColor : CustomColors.primary),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
