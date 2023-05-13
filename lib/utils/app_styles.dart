import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

SizedBox smallerSizedBox = SizedBox(height: 1.h);
SizedBox smallSizedBox = SizedBox(height: 2.h);
SizedBox mediumSizedBox = SizedBox(height: 4.h);
SizedBox largeSizedBox = SizedBox(height: 6.h);
SizedBox extraLargeSizedBox = SizedBox(height: 8.h);

EdgeInsets paddingAll({required double padding}) => EdgeInsets.all(padding);

EdgeInsets paddingSymmetric({double horizontal = 0.0, double vertical = 0.0}) =>
    EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);

class AppStyles {
  static TextStyle extrasmallerTextStyleGrey = TextStyle(
      fontSize: 8.sp,
      color: Colors.grey.shade500,
      fontFamily: 'Raleway',
      fontWeight: FontWeight.w600);

  static TextStyle smallerTextStyleGrey = TextStyle(
      fontSize: 11.sp,
      color: Colors.grey.shade500,
      fontFamily: 'Raleway',
      fontWeight: FontWeight.w600);

  static TextStyle smallerTextStyleWhite = TextStyle(
      fontSize: 12.sp,
      color: Colors.white,
      fontFamily: 'Raleway',
      fontWeight: FontWeight.w600);

  static TextStyle smallerTextStyleBlack = TextStyle(
      fontSize: 11.sp,
      color: Colors.black,
      fontFamily: 'Raleway',
      fontWeight: FontWeight.w600);

  static TextStyle mediumTextStyleBlack = TextStyle(
      fontSize: 20.sp,
      color: Colors.black,
      fontFamily: 'Raleway',
      fontWeight: FontWeight.w600);

  static TextStyle smallTextStyleBlack = TextStyle(
      fontSize: 16.sp,
      color: Colors.black,
      fontFamily: 'Raleway',
      fontWeight: FontWeight.w600);

  static TextStyle largeTextStyle = TextStyle(
      fontSize: 26.sp,
      color: Colors.black,
      fontWeight: FontWeight.w700,
      fontFamily: 'Raleway');
}
