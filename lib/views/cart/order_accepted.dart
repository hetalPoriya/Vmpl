import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:vmpl/controller/home_controller.dart';
import 'package:vmpl/helper/route_helper.dart';
import 'package:vmpl/utils/app_colors.dart';
import 'package:vmpl/utils/app_images.dart';
import 'package:vmpl/utils/app_strings.dart';
import 'package:vmpl/utils/app_styles.dart';
import 'package:vmpl/utils/app_widget.dart';

class OrderAccepted extends StatelessWidget {
  const OrderAccepted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //controller
    HomeController homeController = Get.put(HomeController());
    return AppWidget.logInBackground(
        child: Container(
      width: 100.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(
            flex: 2,
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: Image.asset(
              AppImages.success,
              height: 25.h,
              width: 80.w,
            ),
          ),
          largeSizedBox,
          Text(
            AppStrings.thanksForOrder,
            textAlign: TextAlign.center,
            style: AppStyles.smallTextStyleBlack,
          ),
          smallSizedBox,
          Text(
            AppStrings.shippingOrder,
            textAlign: TextAlign.center,
            style: AppStyles.smallerTextStyleGrey.copyWith(
                fontWeight: FontWeight.w500, color: Colors.grey.shade700),
          ),
          Spacer(flex: 2),
          Padding(
            padding: paddingSymmetric(horizontal: 6.w),
            child: AppWidget.elevatedButton(
                onTap: () {
                  Get.toNamed(RouteHelper.myOrder);
                },
                text: AppStrings.trackOrder),
          ),
          smallSizedBox,
          GestureDetector(
            onTap: () {
              Get.back();
              homeController.bottomIndex.value = 0;
              homeController.update();
            },
            child: Text(
              AppStrings.backToHome,
              textAlign: TextAlign.center,
              style: AppStyles.smallerTextStyleBlack,
            ),
          ),
          Spacer(),
        ],
      ),
    ));
  }
}
