import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:vmpl/controller/home_controller.dart';

import '../../utils/utils.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //contoller
    HomeController homeController = Get.put(HomeController());
    return SafeArea(
        child: Scaffold(
      appBar: AppWidget.appBarWidget(
          title: 'All Category',
          onTapOnBackButton: () {
            homeController.bottomIndex.value = 0;
            homeController.update();
          },
          onTapOnAction: () {}),
      body: Padding(
        padding: paddingSymmetric(horizontal: 6.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          // Text(
          //   AppStrings.findProducts,
          //   style: AppStyles.smallTextStyleBlack,
          // ),
          smallSizedBox,
          AppWidget.searchTextFormField(),
          Expanded(
            child: GridView.builder(
                padding: paddingSymmetric(vertical: 2.h),
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: AppWidget.imageData.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 2.h,
                ),
                itemBuilder: ((context, index) {
                  return AppWidget.mediumBoxWidget(
                      onTap: () {
                        homeController.particularProductIndex.value = 1;
                        homeController.selectedCategoryName.value =
                            AppWidget.imageData[index].text.toString();
                        homeController.update();
                      },
                      images: AppWidget.imageData,
                      imageString: AppWidget.imageData[index].icon,
                      text: AppWidget.imageData[index].text,
                      boxColor: AppColors.colorsBox(index: index),
                      borderColor: AppColors.colorsBoxBorder(index: index));
                })),
          ),
        ]),
      ),
    ));
  }
}
