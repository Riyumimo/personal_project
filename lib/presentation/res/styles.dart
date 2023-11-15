import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorName {
  static var grayC4 = const Color(0xffC4C4C4);
  static var black = const Color(0x00ff0000);
  static var white = const Color(0xffffffff);
}

class Dimension {
  static double defaultTextSize = 16.00;
  static double smallTextSize = 14.00;
  static double extraSmallTextSize = 12.00;
  static double largeTextSize = 18.00;
  static double extraLargeTextSize = 22.00;

  static const double defaultPaddingSize = 30.00;
  static const double marginSize = 20.00;
  static const double heightSize = 12.00;
  static const double widthSize = 10.00;
  static const double radius = 10.00;
  static const double buttonHeight = 45.00;
}

class AppStyles {
  static var focusedTransparentBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(Dimension.radius),
      borderSide: const BorderSide(color: Colors.transparent));
}

TextStyle errorTextStyle(context) => TextStyle(
    fontSize: 10.sp,
    color: Theme.of(context).colorScheme.error,
    fontWeight: FontWeight.w500,
    height: 1.4);
