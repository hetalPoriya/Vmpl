import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:timelines/timelines.dart';
import 'package:vmpl/utils/app_widget.dart';
import '../../utils/utils.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppWidget.appBarWidget(
          title: AppStrings.myOrder, onTapOnBackButton: () => Get.back()),
      body: Padding(
        padding: paddingSymmetric(horizontal: 4.w),
        child: ListView(children: [
          smallSizedBox,
          Container(
            height: 18.h,
            padding: paddingSymmetric(horizontal: 4.w, vertical: 2.w),
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                borderRadius: BorderRadius.circular(4.w),
                color: AppColors.darkYellowLine),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.trackOrderPackage,
                    style: AppStyles.smallerTextStyleBlack
                        .copyWith(fontSize: 12.sp),
                  ),
                  Text(
                    AppStrings.trackOrderNumber,
                    style: AppStyles.smallerTextStyleGrey.copyWith(
                      fontSize: 12.sp,
                    ),
                  ),
                  smallerSizedBox,
                  TextFormField(
                    decoration: InputDecoration(
                        filled: true,
                        hintText: AppStrings.trackNumber,
                        hintStyle: AppStyles.smallerTextStyleGrey,
                        fillColor: Colors.white,
                        suffixIcon: Padding(
                          padding: paddingAll(padding: 1.w),
                          child: CircleAvatar(
                              backgroundColor: AppColors.lightGreen,
                              child: Icon(
                                Icons.search,
                                color: Colors.white,
                              )),
                        ),
                        contentPadding: EdgeInsets.all(2.w),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.w),
                            borderSide: BorderSide(color: Colors.white))),
                  )
                ]),
          ),
          smallSizedBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  AppStrings.currentShipment,
                  overflow: TextOverflow.ellipsis,
                  style:
                      AppStyles.smallTextStyleBlack.copyWith(fontSize: 14.sp),
                ),
              ),
              Row(
                children: [
                  Image.asset(AppImages.location,
                      height: 2.h, width: 4.w, color: AppColors.lightGreen),
                  SizedBox(
                    width: 1.w,
                  ),
                  Text(
                    'City center, Gwalior',
                    style: AppStyles.extrasmallerTextStyleGrey
                        .copyWith(color: Colors.black),
                  )
                ],
              )
            ],
          ),
          smallSizedBox,
          Container(
            height: 30.h,
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                borderRadius: BorderRadius.circular(4.w),
                color: Colors.grey.shade100),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                      flex: 2,
                      child: Container(
                          //  color: Colors.lightGreen,
                          child: AppWidget.orderDetailWidget())),
                  AppWidget.divider(),
                  Flexible(
                    flex: 3,
                    child: Container(
                      child: Padding(
                        padding: paddingSymmetric(horizontal: 2.w),
                        child: FixedTimeline.tileBuilder(
                          theme: TimelineTheme.of(context).copyWith(
                              nodePosition: 0,
                              color: AppColors.lightGreen,
                              connectorTheme:
                                  ConnectorThemeData(color: Colors.lightGreen)),
                          builder: TimelineTileBuilder.fromStyle(
                            contentsAlign: ContentsAlign.basic,
                            contentsBuilder: (context, index) => Padding(
                                padding: paddingSymmetric(
                                    horizontal: 2.w, vertical: 2.w),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppStrings.from,
                                      style: AppStyles.smallerTextStyleGrey,
                                    ),
                                    Text(
                                      'Lorem ipsum, market, Delhi | 435021',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppStyles.extrasmallerTextStyleGrey
                                          .copyWith(
                                              color: Colors.black54,
                                              fontSize: 9.sp),
                                    )
                                  ],
                                )),
                            itemCount: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  AppWidget.divider(),
                  Flexible(
                      child: Padding(
                    padding: paddingSymmetric(horizontal: 2.w),
                    child: RichText(
                        text: TextSpan(
                            text: AppStrings.status,
                            style: AppStyles.smallerTextStyleGrey,
                            children: [
                          TextSpan(
                              text: 'Your package is in transit',
                              style: AppStyles.smallerTextStyleBlack
                                  .copyWith(color: Colors.black54))
                        ])),
                  )),
                ]),
          ),
          smallSizedBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  AppStrings.recentShipment,
                  overflow: TextOverflow.ellipsis,
                  style:
                      AppStyles.smallTextStyleBlack.copyWith(fontSize: 14.sp),
                ),
              ),
              Text(
                AppStrings.viewAll,
                style: AppStyles.extrasmallerTextStyleGrey
                    .copyWith(color: Colors.lightGreen, fontSize: 11.sp),
              )
            ],
          ),
          smallSizedBox,
          ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              physics: ClampingScrollPhysics(),
              itemBuilder: ((context, index) {
                return Column(
                  children: [
                    smallerSizedBox,
                    Container(
                      height: 10.h,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 4)
                          ],
                          color: AppColors.lightGreenColor,
                          borderRadius: BorderRadius.circular(2.w)),
                      child: AppWidget.orderDetailWidget(),
                    ),
                    smallerSizedBox,
                  ],
                );
              }))
        ]),
      ),
    ));
  }
}
