import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:vmpl/helper/route_helper.dart';
import 'package:vmpl/utils/app_colors.dart';
import 'package:vmpl/utils/app_images.dart';
import 'package:vmpl/utils/app_strings.dart';
import 'package:vmpl/utils/app_styles.dart';
import 'package:vmpl/utils/app_widget.dart';

class MyAccount extends StatelessWidget {
  MyAccount({Key? key}) : super(key: key);

  List<ListTileClass> list = [
    ListTileClass(
        text: AppStrings.myOrder,
        image: AppImages.myOrder,
        screenName: RouteHelper.myOrder),
    ListTileClass(
        text: AppStrings.myDetails,
        image: AppImages.myDetails,
        screenName: RouteHelper.orderDetails),
    ListTileClass(
        text: AppStrings.deliveryAddress,
        image: AppImages.location,
        screenName: RouteHelper.deliveryAddress),
    ListTileClass(
        text: AppStrings.inviteAndEarn,
        image: AppImages.inviteAndEarn,
        screenName: RouteHelper.inviteAndEarn),
    ListTileClass(
        text: AppStrings.myNetwork,
        image: AppImages.myNetwork,
        screenName: RouteHelper.myNetwork),
    ListTileClass(
        text: AppStrings.help,
        image: AppImages.help,
        screenName: RouteHelper.helpScreen),
    ListTileClass(
        text: AppStrings.about,
        image: AppImages.about,
        screenName: RouteHelper.aboutScreen),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(children: [
        smallSizedBox,
        Container(
          height: 10.h,
          padding: paddingSymmetric(horizontal: 3.w),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Expanded(
                child: Container(
                    height: 100.h,
                    width: 100.w,
                    padding: paddingSymmetric(horizontal: 3.w, vertical: 2.w),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(7.w)),
                    ))),
            Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Lorem Ipsum',
                          style: AppStyles.smallerTextStyleBlack.copyWith(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.edit,
                              color: AppColors.lightGreen,
                            ))
                      ],
                    ),
                    Flexible(
                      child: Text(
                        'Loremipsum@gmail.com',
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.smallerTextStyleBlack.copyWith(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ),
                  ],
                )),
          ]),
        ),
        smallerSizedBox,
        AppWidget.divider(),
        ListView.builder(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: ((context, index) {
              return GestureDetector(
                onTap: () {
                  Get.toNamed(list[index].screenName);
                },
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: paddingSymmetric(horizontal: 7.w),
                      leading: Image.asset(list[index].image,
                          height: 3.h, width: 6.w),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.black,
                      ),
                      title: Text(list[index].text,
                          style: AppStyles.smallerTextStyleBlack
                              .copyWith(fontSize: 13.sp)),
                    ),
                    AppWidget.divider(),
                  ],
                ),
              );
            })),
        extraLargeSizedBox,
        GestureDetector(
          onTap: () {
            Get.offNamedUntil(RouteHelper.login, (route) => false);
          },
          child: Container(
              alignment: Alignment.center,
              height: 7.h,
              margin: paddingSymmetric(horizontal: 6.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.w),
                  color: AppColors.lightGrey),
              child: Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.center,
                      child: Image.asset(AppImages.logOut,
                          height: 3.h, width: 6.w),
                    ),
                  ),
                  Flexible(
                      flex: 3,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppStrings.logOut,
                          style: AppStyles.smallerTextStyleBlack.copyWith(
                              color: AppColors.lightGreen,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      )),
                ],
              )),
        )
      ]),
    ));
  }
}

class ListTileClass {
  String text;
  String image;
  String screenName;

  ListTileClass(
      {required this.text, required this.image, required this.screenName});
}
