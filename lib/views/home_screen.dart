import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:vmpl/controller/home_controller.dart';
import 'package:vmpl/helper/route_helper.dart';
import 'package:vmpl/utils/utils.dart';
import 'package:vmpl/views/account/account.dart';
import 'package:vmpl/views/cart/cart.dart';
import 'package:vmpl/views/products/categories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<BottomItem> bottomItem = [
      BottomItem(icon: AppImages.shop, text: 'Shop'),
      BottomItem(icon: AppImages.categories, text: 'Categories'),
      BottomItem(icon: AppImages.cart, text: 'Cart'),
      BottomItem(icon: AppImages.account, text: 'Account'),
    ];

    HomeController homeController = Get.put(HomeController());
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: Obx(
            () => BottomNavigationBar(
              currentIndex: homeController.bottomIndex.value,
              items: List.generate(
                  bottomItem.length,
                  (index) => BottomNavigationBarItem(
                        icon: Image.asset(bottomItem[index].icon,
                            height: 2.h,
                            color: homeController.bottomIndex.value == index
                                ? AppColors.lightGreen
                                : Colors.black),
                        label: bottomItem[index].text,
                      )),
              selectedItemColor: AppColors.lightGreen,
              unselectedItemColor: Colors.black,
              showUnselectedLabels: true,
              selectedLabelStyle:
                  AppStyles.smallerTextStyleBlack.copyWith(color: Colors.black),
              showSelectedLabels: true,
              unselectedLabelStyle: AppStyles.smallerTextStyleBlack,
              onTap: (ind) {
                homeController.bottomIndex.value = ind;
                homeController.particularProductIndex.value = 0;
                homeController.update();
              },
            ),
          ),
          body: Obx(
            () {
              return homeController.bottomIndex.value == 0
                  ? Padding(
                      padding: paddingSymmetric(horizontal: 6.w),
                      child: Column(
                        children: [
                          mediumSizedBox,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                AppImages.vmplLogo,
                                height: 4.h,
                                width: 12.w,
                              ),
                              Row(
                                children: [
                                  Image.asset(AppImages.location,
                                      height: 2.h,
                                      width: 4.w,
                                      color: AppColors.red),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Text(
                                    'City Center,Gwaliar',
                                    style: AppStyles.extrasmallerTextStyleGrey,
                                  ),
                                  Icon(Icons.arrow_drop_down_sharp,
                                      color: Colors.grey),
                                ],
                              ),
                            ],
                          ),
                          smallSizedBox,
                          AppWidget.searchTextFormField(),
                          Expanded(
                            child: ListView(
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              children: [
                                mediumSizedBox,
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2.w),
                                    color: Colors.black12,
                                  ),
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      CarouselSlider.builder(
                                        itemCount: 3,
                                        options: CarouselOptions(
                                            disableCenter: true,
                                            height: 18.h,
                                            viewportFraction: 1,
                                            onPageChanged: (index, reason) {
                                              homeController
                                                  .carouselIndex.value = index;
                                              homeController.update();
                                            }),
                                        itemBuilder: ((context, carouselIndex,
                                            realIndex) {
                                          return Container(
                                            height: 18.h,
                                            width: 100.w,
                                            alignment: Alignment.bottomCenter,
                                            padding:
                                                paddingSymmetric(vertical: 1.h),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(2.w),
                                                color: Colors.black12,
                                                image: const DecorationImage(
                                                    image: NetworkImage(
                                                      'https://images.creativemarket.com/0.1.0/ps/8268605/1820/971/m1/fpnw/wm1/oqqs4lhgkfl6ivu3cnvoezs4wxarqjbsxeunhpl8xiasskn8h9pliidvxrtwg5co-.jpg?1588712614&s=91820388e41048e88700ed14501910ba',
                                                    ),
                                                    fit: BoxFit.contain)),
                                          );
                                        }),
                                      ),
                                      Container(
                                        margin: paddingSymmetric(vertical: 1.w),
                                        child: Obx(
                                          () => Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: AppWidget.list
                                                .asMap()
                                                .entries
                                                .map((entry) {
                                              return Container(
                                                margin: paddingSymmetric(
                                                    horizontal: 1.w),
                                                width: homeController
                                                            .carouselIndex
                                                            .value ==
                                                        entry.key
                                                    ? 4.w
                                                    : 2.w,
                                                height: 6,
                                                decoration: BoxDecoration(
                                                    color: homeController
                                                                .carouselIndex
                                                                .value ==
                                                            entry.key
                                                        ? AppColors.lightGreen
                                                        : Colors.black26,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.w)),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                mediumSizedBox,
                                AppWidget.seeAllWidget(
                                    text: AppStrings.categories,
                                    onTap: () {
                                      homeController.bottomIndex.value = 1;
                                      homeController.update();
                                    }),
                                smallSizedBox,
                                AppWidget.smallBoxWidget(
                                    images: AppWidget.imageData),
                                mediumSizedBox,
                                AppWidget.seeAllWidget(
                                    text: AppStrings.bestSelling,
                                    onTap: () {
                                      homeController.bottomIndex.value = 1;
                                      homeController.update();
                                    }),
                                smallSizedBox,
                                SizedBox(
                                  height: 22.h,
                                  // color: AppColors.lightGreen,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: AppWidget.imageData.length,
                                      physics: BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: ((context, index) {
                                        return AppWidget.mediumBoxWidget(
                                            onTap: () {},
                                            images: AppWidget.imageData,
                                            imageString:
                                                AppWidget.imageData[index].icon,
                                            text: AppWidget
                                                .imageData[index].text);
                                      })),
                                ),
                                mediumSizedBox,
                                AppWidget.seeAllWidget(
                                    text: AppStrings.groceries,
                                    onTap: () {
                                      homeController.bottomIndex.value = 1;
                                      homeController.update();
                                    }),
                                smallSizedBox,
                                AppWidget.rowBoxWidget(
                                    images: AppWidget.imageData),
                                smallSizedBox,
                                SizedBox(
                                  height: 25.h,
                                  child: ListView.builder(
                                      physics: BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: AppWidget.imageData.length,
                                      itemBuilder: ((context, index) {
                                        return AppWidget.priceBoxWidget(
                                            imageString:
                                                AppWidget.imageData[index].icon,
                                            text:
                                                AppWidget.imageData[index].text,
                                            images: AppWidget.imageData,
                                            kgAndPrice: '1Kg , price',
                                            totalPrice: '₹4.99');
                                      })),
                                ),
                                mediumSizedBox,
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  : homeController.bottomIndex.value == 1
                      ? CategoriesScreen()
                      : homeController.bottomIndex.value == 2
                          ? MyCart()
                          : MyAccount();
            },
          )),
    );
  }
}

class BottomItem {
  String text;
  String icon;

  BottomItem({required this.icon, required this.text});
}
