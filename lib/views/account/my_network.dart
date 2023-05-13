import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:vmpl/utils/app_colors.dart';
import 'package:vmpl/utils/app_strings.dart';
import 'package:vmpl/utils/app_styles.dart';
import 'package:vmpl/utils/app_widget.dart';

class MyNetwork extends StatelessWidget {
  const MyNetwork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TextClass> list = [
      TextClass(text1: AppStrings.tongkunLee, isActive: AppStrings.active),
      TextClass(text1: AppStrings.rehmemKhihal, isActive: AppStrings.inactive),
      TextClass(text1: AppStrings.fazurNalim, isActive: AppStrings.active),
      TextClass(text1: AppStrings.boaPalegleam, isActive: AppStrings.active),
    ];

    List<TextClass> listText = [
      TextClass(text1: '34', isActive: AppStrings.active),
      TextClass(text1: '21', isActive: AppStrings.yourLevel),
      TextClass(text1: 'XX', isActive: AppStrings.yourPv),
      TextClass(text1: 'XX', isActive: AppStrings.yourBv),
    ];

    return AppWidget.logInBackground(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppWidget.appBarWidget(
          title: AppStrings.yourNetwork, onTapOnBackButton: () => Get.back()),
      body: ListView(children: [
        smallSizedBox,
        AppWidget.divider(),
        ListView.builder(
            itemCount: list.length,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemBuilder: ((context, index) {
              return Container(
                margin: paddingSymmetric(vertical: 2.w),
                child: Padding(
                  padding: paddingSymmetric(
                    horizontal: 6.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(list[index].text1,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyles.smallerTextStyleBlack),
                      Text(list[index].isActive,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyles.smallerTextStyleBlack.copyWith(
                              color: list[index].isActive == 'Active'
                                  ? AppColors.lightGreen
                                  : AppColors.red)),
                    ],
                  ),
                ),
              );
            })),
        mediumSizedBox,
        Container(
          height: 7.h,
          padding: paddingSymmetric(horizontal: 4.w),
          color: AppColors.lightGrey,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              AppStrings.memberInDownline,
              style: AppStyles.smallerTextStyleBlack.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87),
            ),
            CircleAvatar(
              backgroundColor: AppColors.lightGreen,
              child: Text('41', style: AppStyles.smallerTextStyleWhite),
            )
          ]),
        ),
        mediumSizedBox,
        Padding(
          padding: paddingSymmetric(horizontal: 6.w),
          child: GridView.builder(
              shrinkWrap: true,
              itemCount: listText.length,
              physics: ClampingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4.w,
                  crossAxisSpacing: 4.w,
                  childAspectRatio: 5 / 4),
              itemBuilder: ((context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: AppColors.lightPinkBox,
                    borderRadius: BorderRadius.circular(2.w),
                    border: Border.all(color: AppColors.darkPinkLine),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          listText[index].text1,
                          style: AppStyles.mediumTextStyleBlack,
                        ),
                        Text(
                          listText[index].isActive,
                          style: AppStyles.smallTextStyleBlack,
                        )
                      ]),
                );
              })),
        ),
        mediumSizedBox,
        Padding(
          padding: paddingSymmetric(horizontal: 6.w),
          child: AppWidget.elevatedButtonCheckOut(
              onTap: () {}, text: AppStrings.yourEarnings, totalPrice: '₹1.50'),
        ),
        smallSizedBox,
      ]),
    ));
  }
}

class TextClass {
  String text1;
  String isActive;

  TextClass({required this.text1, required this.isActive});
}
