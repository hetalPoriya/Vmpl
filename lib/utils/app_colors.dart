import 'package:flutter/material.dart';

class AppColors {
  static Color splashImageBackColor = Color(0xffFCFCFC);
  static Color logInBackColor = Color(0xffFEFEFE);
  static Color lightGreen = Color(0xff53B175);
  static Color lightGrey = Color(0xffE2E2E2);

  static Color greyBorder = Color(0xffECECEC);

  static Color red = Color(0xffFE0000);
  static Color lightGreenColor = Color(0xffEDFCF7);

  //box color
  static Color lightGreenBox = Color(0xffEEF7F1);
  static Color darkGreenLine = Color(0xff9DD2B0);
  static Color lightSkinBox = Color(0xffFEF6ED);
  static Color darkSkinLine = Color(0xffFBC48A);
  static Color lightPinkBox = Color(0xffFDE8E4);
  static Color darkPinkLine = Color(0xffF9BCAE);
  static Color lightPurpleBox = Color(0xffF4EBF7);
  static Color darkPurpleLine = Color(0xffD7B7E3);
  static Color lightYellowBox = Color(0xffFFF8E5);
  static Color darkYellowLine = Color(0xffFDEBB2);
  static Color lightBlueBox = Color(0xffEDF7FC);
  static Color darkBlueLine = Color(0xffBEE2F6);

  static List<List<Color>> boxColors = [
    [lightGreenBox, darkGreenLine],
    [lightSkinBox, darkSkinLine],
    [lightPinkBox, darkPinkLine],
    [lightPurpleBox, darkPurpleLine],
    [lightYellowBox, darkYellowLine],
    [lightBlueBox, darkBlueLine],
  ];

  static colorsBox({required int index}) {
    return index % 6 == 0
        ? AppColors.boxColors[0].first
        : index % 6 == 1
            ? AppColors.boxColors[1].first
            : index % 6 == 2
                ? AppColors.boxColors[2].first
                : index % 6 == 3
                    ? AppColors.boxColors[3].first
                    : index % 6 == 4
                        ? AppColors.boxColors[4].first
                        : AppColors.boxColors[5].first;
  }

  static colorsBoxBorder({required int index}) {
    return index % 6 == 0
        ? AppColors.boxColors[0].last
        : index % 6 == 1
            ? AppColors.boxColors[1].last
            : index % 6 == 2
                ? AppColors.boxColors[2].last
                : index % 6 == 3
                    ? AppColors.boxColors[3].last
                    : index % 6 == 4
                        ? AppColors.boxColors[4].last
                        : AppColors.boxColors[5].last;
  }
}
