import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:vmpl/controller/home_controller.dart';
import '../../utils/utils.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Controller
    HomeController homeController = Get.put(HomeController());
    final CarouselController _controller = CarouselController();

    return SafeArea(
        child: Scaffold(
      body: ListView(children: [
        Container(
          height: 40.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(6.w),
                  bottomRight: Radius.circular(6.w)),
              color: Colors.grey.shade200),
          child: Column(
            children: [
              AppWidget.appBarWidget(
                  title: '',
                  visibility: true,
                  imageString: AppImages.share,
                  onTapOnBackButton: () {
                    homeController.particularProductIndex.value = 1;
                    homeController.update();
                  }),
              SizedBox(
                height: 25.h,
                child: CarouselSlider.builder(
                  itemCount: 3,
                  options: CarouselOptions(
                      disableCenter: true,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        homeController.carouselIndex.value = index;
                        homeController.update();
                      }),
                  itemBuilder: ((context, carouselIndex, realIndex) {
                    return Container(
                      width: 100.w,
                      alignment: Alignment.bottomCenter,
                      padding: EdgeInsets.symmetric(vertical: 1.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.w),
                          image: const DecorationImage(
                              image: AssetImage('assets/sprite.png'),
                              fit: BoxFit.contain)),
                    );
                  }),
                ),
              ),
              Spacer(),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: AppWidget.list.asMap().entries.map((entry) {
                    return Container(
                      margin: paddingSymmetric(horizontal: 1.w),
                      width: homeController.carouselIndex.value == entry.key
                          ? 4.w
                          : 2.w,
                      height: 6,
                      decoration: BoxDecoration(
                          color: homeController.carouselIndex.value == entry.key
                              ? AppColors.lightGreen
                              : Colors.black26,
                          borderRadius: BorderRadius.circular(2.w)),
                    );
                  }).toList(),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
        smallSizedBox,
        Padding(
          padding: paddingSymmetric(horizontal: 6.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      'Sprite Can',
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.smallTextStyleBlack,
                    ),
                  ),
                  Image.asset(
                    AppImages.heartOutline,
                    height: 3.h,
                    width: 6.w,
                  ),
                ],
              ),
              Text(
                '1pc,Price',
                style: AppStyles.smallerTextStyleGrey,
              ),
              smallSizedBox,
              AppWidget.addRemoveItemWidget(),
              smallSizedBox,
              ExpansionTile(
                initiallyExpanded: true,
                trailing: Icon(Icons.keyboard_arrow_down,
                    color: Colors.black, size: 8.w),
                tilePadding: paddingSymmetric(
                  horizontal: 1.w,
                ),
                childrenPadding:
                    paddingSymmetric(horizontal: 1.w, vertical: 2.w),
                title: Text(AppStrings.productDetails,
                    style: AppStyles.smallerTextStyleBlack),
                children: [
                  Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                      style: AppStyles.smallerTextStyleGrey.copyWith(
                          fontWeight: FontWeight.normal,
                          fontSize: 10.sp,
                          color: Colors.grey.shade700))
                ],
              ),
              smallSizedBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      AppStrings.nutritions,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.smallerTextStyleBlack,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: paddingAll(padding: 1.w),
                        decoration: BoxDecoration(
                            color: AppColors.lightGrey,
                            borderRadius: BorderRadius.circular(1.w)),
                        child: Text('100gr',
                            style: AppStyles.extrasmallerTextStyleGrey),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Icon(Icons.arrow_forward_ios,
                          color: Colors.black, size: 5.w),
                    ],
                  )
                ],
              ),
              smallerSizedBox,
              AppWidget.divider(),
              smallerSizedBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.review,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.smallerTextStyleBlack,
                  ),
                  Spacer(),
                  Row(
                    children: List.generate(
                        5,
                        (index) => Icon(
                              Icons.star,
                              color: Colors.orange,
                            )),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Icon(Icons.arrow_forward_ios, color: Colors.black, size: 5.w),
                ],
              ),
              mediumSizedBox,
              Align(
                child: AppWidget.elevatedButton(
                    onTap: () {
                      homeController.bottomIndex.value = 0;
                      homeController.update();
                    },
                    text: AppStrings.addToBasket),
                alignment: Alignment.center,
              ),
              smallSizedBox,
            ],
          ),
        )
      ]),
    ));
  }
}
