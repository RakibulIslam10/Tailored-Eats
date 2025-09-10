import 'package:tailored_eats/core/themes/token.dart';
import 'package:tailored_eats/core/utils/basic_import.dart';
import 'package:tailored_eats/core/utils/extensions.dart';
import 'package:tailored_eats/core/utils/space.dart';
import 'package:tailored_eats/widgets/text_widget.dart';

class CustomDropDownWidget extends StatefulWidget {
  final String hint;
  final String? label;
  final List<String> items;
  final String? initialValue;
  final Function(String) onChanged;

  const CustomDropDownWidget({
    super.key,
    this.hint = "Select Option",
    required this.items,
    this.initialValue,
    required this.onChanged,
    this.label,
  });

  @override
  State<CustomDropDownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<CustomDropDownWidget> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: crossStart,
      children: [
        TextWidget(
          padding: EdgeInsetsGeometry.only(
            bottom: Dimensions.spaceBetweenInputTitleAndBox * 0.6,
          ),
          widget.label ?? "Select option",
          fontSize: Dimensions.titleSmall,
          fontWeight: FontWeight.w500,
          color: CustomColors.blackColor.withAlpha(888),
        ),
        Container(
          padding: Dimensions.defaultHorizontalSize.edgeHorizontal * 0.5,
          height: Dimensions.inputBoxHeight * 0.7,
          decoration: BoxDecoration(
            border: Border.all(
              color: _selectedValue == null
                  ? CustomColors.disableColor
                  : CustomColors.primary,
              width: 1.4,
            ),
            borderRadius: BorderRadius.circular(Dimensions.radius),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              dropdownColor: CustomColors.whiteColor,
              iconEnabledColor: _selectedValue == null
                  ? CustomColors.disableColor
                  : CustomColors.primary,
              value: _selectedValue,
              isExpanded: true,
              hint: TextWidget(
                widget.hint,
                color: Colors.grey,
                fontSize: width * 0.04,
              ),
              items: widget.items
                  .map(
                    (item) => DropdownMenuItem(
                      value: item,
                      child: TextWidget(item, fontSize: Dimensions.titleSmall),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() => _selectedValue = value);
                widget.onChanged(value!);
              },
            ),
          ),
        ),
      ],
    );
  }
}
