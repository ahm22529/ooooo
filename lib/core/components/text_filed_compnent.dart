import 'package:arb_tasks/core/components/custom_image_handelar.dart';
import 'package:arb_tasks/core/utiles/app_colors.dart';
import 'package:arb_tasks/core/utiles/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class TextFieldComponent extends StatefulWidget {
  TextFieldComponent({
    super.key,
    this.controller,
    this.validator,
    this.borderColor,
    this.onChange,
    this.onSubmit,
    this.onPress,
    this.inputFormatters = const [],
    this.suffixIcon,
    this.keyboardType,
    this.textStyle,
    this.focusNode,
    this.onTapWhileTextFieldIsEnabled,
    this.hintTextStyle,
    this.prefixIcon,
    this.isDatePicker,
    this.fillColor,
    this.maxlines,
    this.maxLength,
    this.isReadOnly = false,
    this.hasShowPasswordIcon = false,
    this.textAlign = TextAlign.start,
    this.label = "",
    required this.hint,
  }) {
    fillColor ?? const Color(0xffF8F8F8);
    textStyle ?? const TextStyle(color: AppColors.blackColor);
    hintTextStyle ?? const TextStyle(color: AppColors.bgGray);
  }
  late String? label;
  late TextEditingController? controller;
  late String? Function(String? value)? validator;
  late Function(String? value)? onSubmit;
  late Function(String? value)? onChange;
  late Function? onTapWhileTextFieldIsEnabled;
  late Function? onPress;
  late Widget? suffixIcon, prefixIcon;
  late FocusNode? focusNode;
  late TextStyle? textStyle, hintTextStyle;
  late TextInputType? keyboardType;
  late Color? fillColor;
  final bool hasShowPasswordIcon;
  final bool isReadOnly;
  final bool? isDatePicker;
  final String hint;
  final int? maxlines, maxLength;
  final TextAlign textAlign;
  Color? borderColor;
  final List<TextInputFormatter> inputFormatters;
  @override
  State<TextFieldComponent> createState() => _TextFieldComponentState();
}

class _TextFieldComponentState extends State<TextFieldComponent> {
  late bool changeObsecureStatus;

  @override
  void initState() {
    super.initState();
    if (widget.isReadOnly) {
      widget.fillColor = const Color(0xffF4F4F4);
      widget.borderColor = const Color(0xffF4F4F4);
    }
    changeObsecureStatus = widget.hasShowPasswordIcon;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (widget.onPress != null) {
            widget.onPress!();
          }
        },
        child: SizedBox(
            child: TextFormField(
          readOnly: widget.isReadOnly, // Control read-only behavior
          inputFormatters:
              widget.inputFormatters, // Apply input formatters if provided
          focusNode: widget.focusNode, // Optional focus node
          textAlign: widget.textAlign, // Default text alignment
          keyboardType:
              widget.keyboardType ?? TextInputType.text, // Default input type
          maxLines: widget.maxlines ?? 1, // Default to single-line input
          maxLength: widget.maxLength, // Optional max length
          controller: widget.controller, // Input controller
          validator: widget.validator, // Validation logic
          buildCounter: (widget.maxLength == null)
              ? null
              : (context, {currentLength = 1, maxLength, isFocused = false}) {
                  return Text(
                    '$currentLength/$maxLength',
                    style: const TextStyle(color: AppColors.primaryColor),
                  );
                },
          autovalidateMode: widget.isDatePicker ?? false
              ? AutovalidateMode.disabled
              : AutovalidateMode.onUserInteraction,
          onTap: () {
            // Trigger custom onTap behavior if defined
            if (widget.onTapWhileTextFieldIsEnabled != null) {
              widget.onTapWhileTextFieldIsEnabled!();
            }
          },
          onFieldSubmitted: (value) {
            // Trigger custom onSubmit behavior if defined
            if (widget.onSubmit != null) {
              widget.onSubmit!(value);
            }
          },
          onChanged: (value) {
            // Trigger custom onChange behavior if defined
            if (widget.onChange != null) {
              widget.onChange!(value);
            }
          },
          obscureText:
              changeObsecureStatus, // Toggle secure input for passwords
          obscuringCharacter: '*', // Customize obscuring character
          style: widget.isReadOnly
              ? Get.textTheme.labelSmall!
                  .copyWith(fontSize: 14, fontWeight: FontWeight.w500)
              : widget.textStyle, // Define text style
          decoration: InputDecoration(
            labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
            label: widget.label != null && widget.label!.isNotEmpty
                ? Text(widget.label!)
                : null, // Show label if available
            enabled:
                widget.onPress == null, // Enable/disable based on custom logic
            suffixIcon: widget.suffixIcon ??
                (widget.hasShowPasswordIcon
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            changeObsecureStatus = !changeObsecureStatus;
                          });
                        },
                        icon: CustomImageHandler(
                          changeObsecureStatus
                              ? AppImage.eyeo
                              : AppImage.eyeoff,
                          color: const Color.fromARGB(255, 135, 136, 137),
                        ),
                      )
                    : null), // Handle secure text toggle
            contentPadding: const EdgeInsets.symmetric(
                horizontal: 16, vertical: 16), // Padding
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: widget.borderColor ?? AppColors.bgGray,
                )),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: widget.borderColor ?? AppColors.bgGray,
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: widget.borderColor ?? AppColors.bgGrey,
                )),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: widget.borderColor ?? AppColors.bgGray,
                )),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.red.shade700)),
            prefixIcon: widget.prefixIcon, // Custom prefix icon
            filled: true, // Always fill background
            fillColor:
                widget.fillColor ?? AppColors.whiteColor, // Background color
            hintText: widget.hint, // Placeholder text
            hintStyle: widget.hintTextStyle ??
                const TextStyle(
                    fontWeight: FontWeight.w300, fontSize: 15), // Hint style
          ),
        )));
  }
}
