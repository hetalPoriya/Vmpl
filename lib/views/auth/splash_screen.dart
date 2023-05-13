import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vmpl/helper/route_helper.dart';
import 'package:vmpl/utils/app_colors.dart';

import '../../utils/utils.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
      () => Get.offNamed(RouteHelper.onBoarding),
    );
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.splashImageBackColor,
          body: ListView(
            children: [
              Container(
                height: 40.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(AppImages.splashBackground),
                  colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.4), BlendMode.dstATop),
                  fit: BoxFit.fill,
                )),
              ),
              SizedBox(
                  height: 22.h,
                  width: 60.w,
                  child: Image.asset(AppImages.vmplLogo)),
            ],
          )),
    );
  }
}
