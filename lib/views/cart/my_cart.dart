import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:vmpl/controller/home_controller.dart';
import 'package:vmpl/helper/route_helper.dart';
import 'package:vmpl/utils/app_colors.dart';
import 'package:vmpl/utils/app_strings.dart';
import 'package:vmpl/utils/app_styles.dart';
import 'package:vmpl/utils/app_widget.dart';

import '../../utils/utils.dart';

class MyCart extends StatelessWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //controller
    HomeController homeController = Get.put(HomeController());
    return SafeArea(
        child: Scaffold(
      appBar: AppWidget.appBarWidget(
          title: AppStrings.myCart,
          onTapOnBackButton: () {
            homeController.particularProductIndex.value = 3;
            homeController.bottomIndex.value = 1;
            homeController.update();
          }),
      body: ListView(children: [
        smallerSizedBox,
        AppWidget.divider(),
        ListView.builder(
            itemCount: 5,
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: ((context, index) {
              return Padding(
                padding: paddingSymmetric(horizontal: 6.w, vertical: 1.w),
                child: Column(
                  children: [
                    Container(
                      height: 15.h,
                      child: Row(children: [
                        Expanded(
                            child: Padding(
                          padding:
                              paddingSymmetric(horizontal: 2.w, vertical: 6.w),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: Text(
                                              'Sprite Can',
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: AppStyles
                                                  .smallerTextStyleBlack,
                                            ),
                                          ),
                                          Icon(Icons.close),
                                        ],
                                      ),
                                      Text(
                                        '1pc,Price',
                                        style: AppStyles.smallerTextStyleGrey,
                                      ),
                                      Spacer(),
                                      AppWidget.addRemoveItemWidget(
                                          flex: 2, fontSize: 13.sp),
                                    ]),
                              ),
                            )),
                      ]),
                    ),
                    AppWidget.divider(),
                  ],
                ),
              );
            })),
        Padding(
            padding: paddingSymmetric(horizontal: 6.w, vertical: 1.w),
            child: AppWidget.elevatedButtonCheckOut(
                onTap: () => _showBottomSheet(context),
                text: AppStrings.goToCheckout,
                totalPrice: '₹1.50')),
        smallSizedBox,
      ]),
    ));
  }

  _showBottomSheet(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Get.bottomSheet(Container(
      width: 100.w,
      height: 60.h,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(spreadRadius: 1, color: Colors.black12, blurRadius: 4)
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.w), topRight: Radius.circular(8.w)),
          color: Colors.white),
      child: Padding(
        padding: paddingSymmetric(
          horizontal: 4.w,
        ),
        child: ListView(shrinkWrap: true, children: [
          smallSizedBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.checkout,
                style: AppStyles.smallTextStyleBlack,
              ),
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.close))
            ],
          ),
          smallSizedBox,
          AppWidget.divider(),
          smallerSizedBox,
          _rowWidget(text: AppStrings.delivery, text2: AppStrings.selectMethod),
          AppWidget.divider(),
          _rowWidget(text: AppStrings.payment, text2: AppStrings.selectMethod),
          AppWidget.divider(),
          _rowWidget(
              text: AppStrings.promoCode, text2: AppStrings.pickDiscount),
          AppWidget.divider(),
          _rowWidget(text: AppStrings.totalCost, text2: '₹13.97'),
          AppWidget.divider(),
          AppWidget.richText(
              text1: AppStrings.placeOrderAgree,
              text2: ' Terms and Conditions'),
          smallerSizedBox,
          AppWidget.elevatedButton(
              onTap: () {
                Get.back();
                Get.toNamed(RouteHelper.orderAccepted);
                // homeController.bottomIndex.value = 0;
                // homeController.update();
              },
              text: AppStrings.placeOrder),
          smallerSizedBox,
        ]),
      ),
    ));
  }

  _rowWidget({
    required String text,
    required String text2,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: AppStyles.smallerTextStyleGrey.copyWith(fontSize: 12.sp),
        ),
        Row(
          children: [
            Text(
              text2,
              style: AppStyles.smallerTextStyleBlack,
            ),
            IconButton(
                onPressed: () {}, icon: Icon(Icons.arrow_forward_ios_outlined))
          ],
        )
      ],
    );
  }
}
