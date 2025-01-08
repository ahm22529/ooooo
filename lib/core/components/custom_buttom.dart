import 'package:arb_tasks/core/components/custom_image_handelar.dart';
import 'package:arb_tasks/core/utiles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? color;
  final Color? bordereColor;
  final double? fontSize;
  final double? height;
  final double? width;
  final bool isDisabled;
  final String? icon;

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.borderRadius = 15,
    this.backgroundColor = AppColors.lightPrimaryColor,
    this.color = AppColors.whiteColor,
    this.bordereColor = AppColors.primaryColor,
    this.fontSize = 20,
    this.height,
    this.width,
    this.isDisabled = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDisabled ? null : onTap,
      child: Container(
        height: height ?? 61,
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          // color: backgroundColor!,
          color: isDisabled ? AppColors.bgGray : backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius!),
          border: Border.all(
            color: isDisabled ? AppColors.bgGray : bordereColor!,
          ),
        ),
        child: Center(
          child: FittedBox(
            child: icon != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        text,
                        style: Get.textTheme.headlineMedium!.copyWith(
                            color: color!,
                            fontSize: fontSize!,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(width: 8),
                      CustomImageHandler(
                        icon,
                        width: 24,
                      ),
                    ],
                  )
                : Text(
                    text,
                    style: Get.textTheme.headlineMedium!.copyWith(
                        color: color!,
                        fontSize: fontSize!,
                        fontWeight: FontWeight.w600),
                  ),
          ),
        ),
      ),
    );
  }
}
