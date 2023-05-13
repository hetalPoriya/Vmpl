import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:vmpl/controller/auth/auth_controller.dart';
import 'package:vmpl/utils/utils.dart';
import 'package:vmpl/views/home_screen.dart';

class AppWidget {
  static elevatedButton(
          {required VoidCallback onTap,
          required String text,
          bool loading = false}) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
            width: 100.w,
            height: 7.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.w), color: AppColors.red),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: AppStyles.smallerTextStyleWhite,
                ),
                SizedBox(
                  width: 2.w,
                ),
                Visibility(visible: loading, child: circularIndicator())
              ],
            )),
      );

  static elevatedButtonCheckOut(
          {required VoidCallback onTap,
          required String text,
          String? totalPrice,
          bool loading = false}) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
            width: 100.w,
            height: 7.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.w), color: AppColors.red),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: AppStyles.smallerTextStyleWhite,
                ),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  totalPrice.toString(),
                  style: AppStyles.smallerTextStyleWhite,
                ),
                Visibility(visible: loading, child: circularIndicator())
              ],
            )),
      );

  static circularIndicator() => const Center(
        child: CircularProgressIndicator(color: Colors.white),
      );

  static logInBackground({required Widget child}) => SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.logInBackColor,
              image: DecorationImage(
                  image: AssetImage(AppImages.loginBackground),
                  fit: BoxFit.fill)),
          child: Scaffold(body: child, backgroundColor: Colors.transparent),
        ),
      );

  static textFormField({
    TextInputAction? textInputAction,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
    bool obscureText = false,
    IconData? icon,
    VoidCallback? onTapOnIcon,
    Widget? suffixWidget,
    required TextEditingController controller,
    required String hintText,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            hintText,
            style: AppStyles.smallerTextStyleGrey,
          ),
          TextFormField(
            controller: controller,
            obscureText: obscureText,
            validator: validator,
            cursorColor: Colors.black,
            textInputAction: textInputAction ?? TextInputAction.next,
            keyboardType: keyboardType ?? TextInputType.text,
            decoration: InputDecoration(
                hintText: hintText,
                suffixIcon: suffixWidget ??
                    GestureDetector(
                        onTap: onTapOnIcon,
                        child: Icon(
                          icon,
                          color: Colors.grey.shade500,
                        )),
                hintStyle: AppStyles.smallerTextStyleBlack.copyWith(
                    fontWeight: FontWeight.w500, color: Colors.grey.shade600),
                focusedBorder: UnderlineInputBorder(),
                enabledBorder: UnderlineInputBorder()),
          ),
        ],
      );

  static richText(
          {required String text1,
          required String text2,
          VoidCallback? onTap}) =>
      Align(
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: onTap,
          child: RichText(
              text: TextSpan(
                  text: text1,
                  style: AppStyles.smallerTextStyleBlack,
                  children: [
                TextSpan(
                    text: text2,
                    style: AppStyles.smallerTextStyleBlack
                        .copyWith(color: AppColors.lightGreen))
              ])),
        ),
      );

  static searchTextFormField() {
    AuthController authController = AuthController();
    return Obx(
      () => TextFormField(
        controller: authController.searchController.value,
        cursorColor: Colors.black,
        decoration: InputDecoration(
            filled: true,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            hintText: AppStrings.searchText,
            contentPadding: paddingAll(padding: 4.w),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.w),
                borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.w),
                borderSide: BorderSide(color: Colors.black))),
      ),
    );
  }

  static seeAllWidget({required String text, required VoidCallback onTap}) =>
      GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                text,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.smallTextStyleBlack,
              ),
            ),
            Text(
              AppStrings.seeAll,
              style: AppStyles.smallerTextStyleBlack
                  .copyWith(color: AppColors.lightGreen),
            )
          ],
        ),
      );

  static fadeImageWidget({String? imageString}) => FadeInImage(
        image: AssetImage(imageString ?? AppImages.welcomeBackground),
        placeholder: AssetImage(AppImages.welcomeBackground),
      );

  static smallBoxWidget({required List<BottomItem> images}) => Container(
        height: 18.h,
        // color: AppColors.lightGreen,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: images.length,
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: ((context, index) {
              return Container(
                width: 38.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.w),
                    color: AppColors.colorsBox(index: index),
                    border: Border.all(
                        color: AppColors.colorsBoxBorder(index: index))),
                margin: paddingSymmetric(horizontal: 2.w),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          flex: 2,
                          child: Container(
                              // color: Colors.black12,
                              margin: paddingSymmetric(
                                  horizontal: 2.w, vertical: 1.w),
                              child: fadeImageWidget(
                                  imageString: images[index].icon))),
                      Expanded(
                          child: Container(
                        alignment: Alignment.center,
                        margin: paddingSymmetric(horizontal: 2.w),
                        child: Text(images[index].text,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: AppStyles.smallerTextStyleBlack),
                      ))
                    ]),
              );
            })),
      );

  static mediumBoxWidget(
          {required List<BottomItem> images,
          required String imageString,
          required String text,
          required VoidCallback onTap,
          Color? boxColor,
          Color? borderColor}) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          width: 42.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.w),
              color: boxColor ?? Colors.grey.shade50,
              border: Border.all(color: borderColor ?? Colors.grey.shade400)),
          margin: paddingSymmetric(horizontal: 2.w),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                        // color: Colors.black12,
                        margin:
                            paddingSymmetric(horizontal: 2.w, vertical: 1.w),
                        child: fadeImageWidget(imageString: imageString))),
                Expanded(
                    child: Container(
                  alignment: Alignment.center,
                  margin: paddingSymmetric(horizontal: 2.w),
                  child: Text(text,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: AppStyles.smallerTextStyleBlack),
                ))
              ]),
        ),
      );

  static rowBoxWidget({required List<BottomItem> images}) => Container(
        height: 10.h,
        child: ListView.builder(
            itemCount: images.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: ((context, index) {
              return Container(
                width: 50.w,
                margin: paddingSymmetric(
                  horizontal: 2.w,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.w),
                  border: Border.all(
                      color: AppColors.colorsBoxBorder(index: index)),
                  color: AppColors.colorsBox(index: index),
                ),
                child: Row(
                  children: [
                    Flexible(
                        child: Container(
                            height: 10.h,
                            margin: paddingSymmetric(
                                horizontal: 2.w, vertical: 1.w),
                            child: fadeImageWidget(
                                imageString: images[index].icon))),
                    Flexible(
                        child: Container(
                      height: 10.h,
                      margin: paddingSymmetric(horizontal: 2.w, vertical: 1.w),
                      alignment: Alignment.center,
                      child: Text(images[index].text,
                          // overflow: TextOverflow.ellipsis,
                          maxLines: null,
                          textAlign: TextAlign.center,
                          style: AppStyles.smallerTextStyleBlack),
                    )),
                  ],
                ),
              );
            })),
      );

  static priceBoxWidget(
          {required List<BottomItem> images,
          double? height,
          required String kgAndPrice,
          required String totalPrice,
          required String text,
          required String imageString}) =>
      Container(
        width: 45.w,
        height: height ?? 25.h,
        margin: paddingSymmetric(horizontal: 2.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.w),
            color: Colors.grey.shade50,
            border: Border.all(color: Colors.grey.shade400)),
        child: Column(children: [
          Expanded(
              flex: 3,
              child: Container(
                  width: 100.w,
                  margin: paddingSymmetric(horizontal: 2.w, vertical: 1.w),
                  child: AppWidget.fadeImageWidget(imageString: imageString))),
          Expanded(
              flex: 2,
              child: Container(
                margin: paddingSymmetric(horizontal: 2.w),
                width: 100.w,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                          child: Text(
                        text,
                        style: AppStyles.smallerTextStyleBlack,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )),
                      Flexible(
                          child: Text(
                        kgAndPrice,
                        style: AppStyles.smallerTextStyleGrey,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ))
                    ]),
              )),
          Expanded(
              flex: 2,
              child: Container(
                margin: paddingSymmetric(horizontal: 2.w, vertical: 1.w),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            height: 100.h,
                            width: 100.w,
                            child: Text(totalPrice,
                                overflow: TextOverflow.ellipsis,
                                style: AppStyles.smallerTextStyleBlack
                                    .copyWith(fontSize: 13.sp)),
                          )),
                      Flexible(
                          child: Container(
                        height: 100.h,
                        width: 100.w,
                        margin:
                            paddingSymmetric(horizontal: 1.w, vertical: 2.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.w),
                          color: AppColors.lightGreen,
                        ),
                        child: Icon(Icons.add, color: Colors.white, size: 3.h),
                      )),
                    ]),
              )),
        ]),
      );

  static appBarWidget(
          {VoidCallback? onTapOnBackButton,
          VoidCallback? onTapOnAction,
          required String title,
          String? imageString,
          bool visibility = false}) =>
      AppBar(
          centerTitle: true,
          elevation: 0,
          leading: Padding(
            padding: EdgeInsets.only(left: 5.w),
            child: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.black,
                onPressed: onTapOnBackButton),
          ),
          actions: [
            Visibility(
              visible: visibility,
              child: GestureDetector(
                  onTap: onTapOnAction,
                  child: Padding(
                    padding: EdgeInsets.only(right: 6.w),
                    child: Image.asset(imageString ?? AppImages.settings,
                        height: 3.h, width: 5.w),
                  )),
            )
          ],
          backgroundColor: Colors.transparent,
          title: Text(
            title,
            style: AppStyles.smallTextStyleBlack.copyWith(fontSize: 14.sp),
          ));

  static divider() => Divider(color: Colors.grey.shade500);

  static addRemoveItemWidget({int? flex, double? fontSize}) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              flex: flex ?? 1,
              child: Container(
                // color: Colors.black,
                child: Row(
                  children: [
                    Container(
                      height: 5.h,
                      width: 10.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(2.w),
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.remove,
                            color: Colors.grey.shade700,
                          )),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text('1',
                        style: AppStyles.smallTextStyleBlack.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54)),
                    SizedBox(
                      width: 4.w,
                    ),
                    Container(
                      height: 5.h,
                      width: 10.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(2.w),
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add,
                            color: AppColors.lightGreen,
                          )),
                    )
                  ],
                ),
              )),
          Flexible(
              child: Text(
            '₹1.50',
            style: AppStyles.smallTextStyleBlack.copyWith(fontSize: fontSize),
          )),
        ],
      );

  static orderDetailWidget() => Row(
        children: [
          Expanded(
              child: Padding(
            padding: paddingSymmetric(horizontal: 3.w, vertical: 3.w),
            child: Image.asset('assets/sprite.png'),
          )),
          Expanded(
              flex: 5,
              child: Padding(
                padding: paddingSymmetric(horizontal: 2.w, vertical: 3.w),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sprite Can (4 pcs.) ',
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.smallerTextStyleBlack,
                          ),
                          Image.asset(AppImages.dots, width: 8.w),
                        ],
                      ),
                      Text(
                        'Tracking ID: HG32534657688TY',
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.extrasmallerTextStyleGrey
                            .copyWith(fontSize: 10.sp),
                      )
                    ]),
              )),
        ],
      );
  static List<BottomItem> imageData = [
    BottomItem(icon: 'assets/vegetables.png', text: 'Frash Fruits & Vegetable'),
    BottomItem(icon: 'assets/oil.png', text: 'Cooking Oil & Ghee'),
    BottomItem(icon: 'assets/fish.png', text: 'Meat & Fish'),
    BottomItem(icon: 'assets/snack.png', text: 'Bakery & Snacks'),
    BottomItem(icon: 'assets/egg.png', text: 'Dairy & Eggs'),
    BottomItem(icon: 'assets/img.png', text: 'Beverages'),
    BottomItem(icon: 'assets/snack.png', text: 'Bakery & Snacks'),
    BottomItem(icon: 'assets/egg.png', text: 'Dairy & Eggs'),
    BottomItem(icon: 'assets/img.png', text: 'Beverages'),
  ];

  static List<BottomItem> list = [
    BottomItem(icon: 'assets/vegetables.png', text: 'Frash Fruits & Vegetable'),
    BottomItem(icon: 'assets/oil.png', text: 'Cooking Oil & Ghee'),
    BottomItem(icon: 'assets/fish.png', text: 'Meat & Fish'),
  ];
}
