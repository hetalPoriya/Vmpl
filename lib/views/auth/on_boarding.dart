import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:vmpl/helper/route_helper.dart';
import 'package:vmpl/utils/utils.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.welcomeBackground),
                fit: BoxFit.fill)),
        child: Column(children: [
          Spacer(),
          Text(
            AppStrings.welcome,
            textAlign: TextAlign.center,
            style: AppStyles.largeTextStyle,
          ),
          Text(
            AppStrings.welcomeText,
            style: AppStyles.smallerTextStyleGrey,
          ),
          Spacer(flex: 4),
          Padding(
            padding: paddingSymmetric(horizontal: 6.w),
            child: AppWidget.elevatedButton(
                onTap: () => Get.offNamed(RouteHelper.login),
                text: AppStrings.getStarted),
          ),
          Spacer(),
        ]),
      ),
    ));
  }
}
