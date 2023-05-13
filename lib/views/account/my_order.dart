import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:vmpl/helper/route_helper.dart';
import 'package:vmpl/utils/app_strings.dart';
import 'package:vmpl/utils/app_styles.dart';
import 'package:vmpl/utils/app_widget.dart';

class MyOrder extends StatelessWidget {
  const MyOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppWidget.appBarWidget(
        title: AppStrings.myOrder,
        onTapOnBackButton: () => Get.back(),
      ),
      body: ListView(children: [
        smallSizedBox,
        AppWidget.divider(),
        ListView.builder(
            physics: ClampingScrollPhysics(),
            itemCount: 10,
            shrinkWrap: true,
            itemBuilder: ((context, index) {
              return Padding(
                padding: paddingSymmetric(horizontal: 6.w, vertical: 1.w),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => Get.toNamed(RouteHelper.orderDetails),
                      child: Container(
                        height: 12.h,
                        child: Row(children: [
                          Expanded(
                              child: Padding(
                            padding: paddingSymmetric(
                                horizontal: 2.w, vertical: 3.w),
                            child: Container(
                                width: 100.w,
                                height: 100.h,
                                //  color: AppColors.darkYellowLine,
                                child: Image.asset('assets/sprite.png')),
                          )),
                          Expanded(
                              flex: 3,
                              child: Container(
                                child: Padding(
                                  padding: paddingSymmetric(vertical: 2.w),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Flexible(
                                            child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Icon(Icons.close,
                                              color: Colors.grey.shade400),
                                        )),
                                        Text('Delivered on  31st Dec, 2022',
                                            style: AppStyles
                                                .smallerTextStyleGrey
                                                .copyWith(
                                                    color: Colors.black54,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                        Text(
                                          'Sprite Can',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style:
                                              AppStyles.smallerTextStyleBlack,
                                        ),
                                        Text(
                                          '1pc,Price',
                                          style: AppStyles.smallerTextStyleGrey,
                                        ),
                                        Spacer(),
                                      ]),
                                ),
                              )),
                        ]),
                      ),
                    ),
                    AppWidget.divider(),
                  ],
                ),
              );
            }))
      ]),
    ));
  }
}
