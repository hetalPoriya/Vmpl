import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';

import '../../utils/utils.dart';

class InviteAndEarn extends StatelessWidget {
  const InviteAndEarn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppWidget.logInBackground(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppWidget.appBarWidget(
          title: AppStrings.referAndEarn, onTapOnBackButton: () => Get.back()),
      body: Padding(
        padding: paddingSymmetric(horizontal: 6.w),
        child: ListView(children: [
          smallSizedBox,
          AppWidget.divider(),
          smallSizedBox,
          Center(
            child: Text(
              AppStrings.inviteFriends,
              style: AppStyles.mediumTextStyleBlack,
            ),
          ),
          Center(
            child: Text(
              AppStrings.earnRs,
              style:
                  AppStyles.smallTextStyleBlack.copyWith(color: AppColors.red),
            ),
          ),
          smallSizedBox,
          Center(
            child: Text(
              AppStrings.inviteFriendsDes,
              textAlign: TextAlign.center,
              style: AppStyles.smallerTextStyleGrey,
            ),
          ),
          largeSizedBox,
          Image.asset(
            AppImages.referAndEarn,
            height: 34.h,
            width: 80.w,
          ),
          mediumSizedBox,
          Text(
            AppStrings.yourReferralCode,
            style: AppStyles.smallerTextStyleGrey,
          ),
          smallerSizedBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '2GHW6',
                style: AppStyles.mediumTextStyleBlack,
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: '2GHW6'));
                        Fluttertoast.showToast(msg: '2GHW6');
                      },
                      icon: Icon(
                        Icons.copy,
                        color: Colors.blue,
                        size: 4.w,
                      )),
                  Text(
                    AppStrings.copyCode,
                    style: AppStyles.extrasmallerTextStyleGrey
                        .copyWith(color: Colors.blue.shade400, fontSize: 10.sp),
                  ),
                  IconButton(
                      onPressed: () {
                        Share.share('Vmpl Refer Code 2GHW6');
                      },
                      icon: Icon(
                        Icons.share,
                        color: Colors.grey.shade500,
                        size: 5.w,
                      ))
                ],
              ),
            ],
          ),
          AppWidget.divider(),
          smallSizedBox,
          Text(
            AppStrings.shareText,
            textAlign: TextAlign.center,
            style: AppStyles.smallerTextStyleGrey.copyWith(
                fontWeight: FontWeight.normal, color: Colors.grey.shade700),
          ),
          smallSizedBox,
        ]),
      ),
    ));
  }
}
