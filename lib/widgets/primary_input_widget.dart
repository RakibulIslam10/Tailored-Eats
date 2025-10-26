import '../core/languages/strings.dart';
import '../core/themes/token.dart';
import '../core/utils/basic_import.dart';
import '../widgets/text_widget.dart';

class PrimaryInputFieldWidget extends StatefulWidget {
  final String hintText;
  final String? label;
  final bool isPassword;
  final bool isEmail;
  final String? optionalText;
  final TextInputType? keyBoardType;
  final String? Function(String?)? validatorLogic;
  final bool readOnly;
  final Color? fillColor;

  final TextEditingController controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final int maxLines;
  final TextEditingController? confirmWith;
  final bool requiredField;
  final bool showBorder;

  const PrimaryInputFieldWidget({
    super.key,
    this.label,
    this.isPassword = false,
    this.isEmail = false,
    required this.controller,
    this.focusNode,
    this.nextFocusNode,
    this.maxLines = 1,
    this.keyBoardType,
    this.validatorLogic,
    this.readOnly = false,
    this.optionalText,
    this.fillColor,
    required this.hintText,
    this.confirmWith,
    this.requiredField = true,
    this.showBorder = false,
  });

  @override
  State<PrimaryInputFieldWidget> createState() =>
      _PrimaryInputFieldWidgetState();
}

class _PrimaryInputFieldWidgetState extends State<PrimaryInputFieldWidget> {
  bool _obscureText = true;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();

    _focusNode.addListener(() {
      setState(() {});
    });

    // Live confirm password check
    widget.confirmWith?.addListener(() {
      if (widget.controller.text.isNotEmpty) setState(() {});
    });
  }

  @override
  void dispose() {
    if (widget.focusNode == null) _focusNode.dispose();
    super.dispose();
  }

  String? _validate(String? value) {
    // ✅ Skip validation if requiredField is false
    if (!widget.requiredField) return null;

    if (value == null || value.trim().isEmpty) {
      return Strings.pleaseFillOutTheField;
    }
    if (widget.isEmail) {
      final emailRegex = RegExp(r'^[\w\-\.]+@([\w\-]+\.)+[\w\-]{2,4}$');
      if (!emailRegex.hasMatch(value.trim())) return "Enter a valid email";
    }

    // Only enforce min length on password field, not confirm
    if (widget.isPassword && widget.confirmWith == null) {
      if (value.length < 6) return "Password must be at least 6 characters";
    }

    // ✅ Live confirm password validation
    if (widget.confirmWith != null && value != widget.confirmWith!.text) {
      return "Passwords do not match";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.label != null)
          Padding(
            padding: EdgeInsets.only(
              bottom: Dimensions.spaceBetweenInputTitleAndBox * 0.6,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextWidget(
                    widget.label!,
                    maxLines: 2,
                    textOverflow: TextOverflow.ellipsis,
                    fontSize: Dimensions.titleMedium * 0.9,
                    fontWeight: FontWeight.w500,
                    color: CustomColors.whiteColor,
                  ),
                ),
                if (widget.optionalText?.isNotEmpty ?? false)
                  Padding(
                    padding: EdgeInsets.only(left: Dimensions.widthSize * 0.5),
                    child: TextWidget(
                      widget.optionalText!,
                      fontSize: Dimensions.titleMedium * 0.9,
                      style: CustomStyle.labelSmall.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                      color: CustomColors.primary,
                    ),
                  ),
              ],
            ),
          ),
        TextFormField(
          style: const TextStyle(color: Colors.white),
          controller: widget.controller,
          focusNode: widget.focusNode,
          obscureText: widget.isPassword ? _obscureText : false,
          maxLines: widget.maxLines,
          cursorColor: CustomColors.primary,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: widget.validatorLogic ?? _validate,
          textInputAction: widget.nextFocusNode != null
              ? TextInputAction.next
              : TextInputAction.done,
          onFieldSubmitted: (_) {
            if (widget.nextFocusNode != null) {
              FocusScope.of(context).requestFocus(widget.nextFocusNode);
            } else {
              FocusScope.of(context).unfocus();
            }
          },
          readOnly: widget.readOnly,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: CustomStyle.bodyMedium.copyWith(
              color: Colors.grey.shade400,
              fontWeight: FontWeight.w400,
              fontSize: Dimensions.titleMedium * 0.95,
            ),
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: _focusNode.hasFocus
                          ? CustomColors.primary
                          : CustomColors.disableColor,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : null,
            filled: widget.fillColor != null,
            fillColor:
                widget.fillColor ??
                // Theme.of(context).colorScheme.surface,
                CustomColors.whiteColor.withAlpha(45),

            border: widget.showBorder
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      Dimensions.radius * 0.8,
                    ),
                  )
                : InputBorder.none,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: CustomColors.primary, width: 1.4),
              borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: CustomColors.whiteColor.withAlpha(45),
                width: 1.4,
              ),
              borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: CustomColors.rejected, width: 1.4),
              borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: CustomColors.rejected, width: 1.4),
              borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
            ),
          ),
        ),
      ],
    );
  }
}
