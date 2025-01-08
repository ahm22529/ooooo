import 'package:arb_tasks/core/components/custom_image_handelar.dart';
import 'package:arb_tasks/core/components/text_filed_compnent.dart';
import 'package:arb_tasks/core/utiles/app_colors.dart';
import 'package:arb_tasks/core/utiles/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../core/localization/app_strings.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

final List<Country> customCountries = [
  const Country(
    name: "Egypt",
    flag: "🇪🇬",
    code: "EG",
    dialCode: "20",
    nameTranslations: {
      "en": "Egypt",
      "ar": "مصر",
    },
    minLength: 10,
    maxLength: 11,
  ),
  const Country(
    name: "United Arab Emirates",
    flag: "🇦🇪",
    code: "AE",
    dialCode: "971",
    nameTranslations: {
      "en": "United Arab Emirates",
      "ar": "الإمارات العربية المتحدة",
    },
    minLength: 9,
    maxLength: 9,
  ),
];

class TextFieldBuilder extends StatelessWidget {
  final String title;
  final bool isPassword;

  final TextInputType keyboardType;
  final bool isPhone;
  final bool isDatePicker;
  final Function(String)? datePickerFunction;
  final TextEditingController? controller;
  final TextEditingController? countryController;
  final Color? bgColor;
  final Color? fillColor;
  final int? maxLines;
  final bool? readOnly;
  final bool? autoFocus;
  final String? Function(String?)? validator;
  final Function(String? value)? onSubmit;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? padding;
  final void Function(String?)? onPressed;
  final String? hintText;
  const TextFieldBuilder({
    super.key,
    required this.title,
    this.isPassword = false,
    this.countryController,
    this.onSubmit,
    this.autoFocus,
    this.keyboardType = TextInputType.text,
    this.isPhone = false,
    this.isDatePicker = false,
    this.maxLines = 1,
    this.controller,
    this.datePickerFunction,
    this.bgColor,
    this.readOnly,
    this.fillColor,
    this.validator,
    this.inputFormatters,
    this.padding,
    this.onPressed,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 8),
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: Get.textTheme.labelSmall!.copyWith(
                  color: AppColors.lightPrimaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                )),
            const SizedBox(height: 16),
            isPhone
                ? IntlPhoneField(
                    controller: controller,

                    validator: (p0) async {
                      if ((p0?.completeNumber ?? "").isEmpty ||
                          (controller?.text ?? '').isEmpty) {
                        return "يرجى ادخال رقم الهاتف";
                      }
                      return null;
                    },
                    invalidNumberMessage: 'رقم هاتف غير صالح',
                    disableLengthCheck: false,
                    onSubmitted: onSubmit,
                    autofocus: autoFocus ?? false,
                    decoration: InputDecoration(
                      fillColor: fillColor ?? Colors.white,
                      filled: true,
                      // labelText: ,
                      label: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.sw),
                        child: Text(
                          title,
                          style: Get.textTheme.labelSmall!.copyWith(
                              color: AppColors.lightGray,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(10),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.bgGray,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.bgGray,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                      hintText: hintText ?? '',
                      hintStyle: Get.textTheme.bodySmall,
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.bgGray,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                      disabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.bgGray,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                    ),
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.primaryColor.withOpacity(0.03),
                    ),
                    initialCountryCode: 'EG',
                    countries: customCountries,

                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    dropdownIconPosition: IconPosition.trailing,
                    style: Get.textTheme.bodyMedium,
                    pickerDialogStyle: PickerDialogStyle(
                      backgroundColor: AppColors.whiteColor,
                      countryNameStyle: Get.textTheme.labelSmall!,
                      countryCodeStyle: Get.textTheme.labelSmall!,
                    ),
                    // languageCode: Get.find<LanguageController>()
                    //     .currentLanguage
                    //     .value!
                    //     .languageCode,
                    onCountryChanged: (value) {
                      countryController?.text = value.code;
                    },
                    onChanged: (phone) {
                      controller?.text = phone.number;
                      countryController?.text =
                          phone.countryCode.isEmpty ? '20' : phone.countryCode;
                    },
                  )
                : TextFieldComponent(
                    hint: title,
                    isDatePicker: isDatePicker,
                    validator: validator ??
                        (value) {
                          if (value == null || value.isEmpty) {
                            return AppStrings.requiredField.tr;
                          }
                          return null;
                        },
                    inputFormatters: [
                      ...inputFormatters ?? [],
                    ],
                    fillColor: bgColor ?? Colors.white,
                    isReadOnly: readOnly ?? false,
                    keyboardType: keyboardType,
                    maxlines: maxLines,
                    hasShowPasswordIcon: isPassword,
                    controller: controller,
                    hintTextStyle: Get.textTheme.labelSmall!.copyWith(
                        color: AppColors.lightGray,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                    suffixIcon: isDatePicker
                        ? Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: CustomImageHandler(
                              isDatePicker ? AppImage.calender : AppImage.eyeo,
                            ),
                          )
                        : null,
                    onPress: !isDatePicker
                        ? null
                        : () {
                            showDatePicker(
                              context: context,
                              firstDate: DateTime(1900),
                              initialDate: DateTime.now(),
                              lastDate:
                                  DateTime.now().add(const Duration(days: 365)),
                            ).then(
                              (value) {
                                if (value != null) {
                                  // datePickerFunction!(value.toString());

                                  controller?.text = DateFormat('yyyy-MM-dd')
                                      .parse(value.toString())
                                      .toString()
                                      .split(' ')[0];
                                }
                              },
                            );
                          },
                  )
          ],
        ),
      ),
    );
  }
}
