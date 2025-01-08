import 'package:arb_tasks/core/utiles/size_config.dart';

import 'package:flutter/material.dart';

abstract class AppStyles {
  static TextStyle f14600(context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 14),
        fontWeight: FontWeight.w600,
        color: Colors.white);
  }

  static TextStyle f32600(context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 32),
        fontWeight: FontWeight.w600,
        color: Colors.white);
  }
   static TextStyle f12400(context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 12),
        fontWeight: FontWeight.w600,
        color: Colors.white);
  }

  static TextStyle f18600(context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 19),
        fontWeight: FontWeight.w600,
        color: Colors.white);
  }

  static TextStyle f16600(context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 16),
        fontWeight: FontWeight.w600,
        color: Colors.white);
  }
   static TextStyle f16700(context) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 16),
        fontWeight: FontWeight.w700,
        color: Colors.white);
  }
}

// sacleFactor
// responsive font size
// (min , max) fontsize
double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  double width = MediaQuery.sizeOf(context).width;
  if (width < SizeConfig.tablet) {
    return width / 550;
  } else if (width < SizeConfig.desktop) {
    return width / 1000;
  } else {
    return width / 1920;
  }
}
