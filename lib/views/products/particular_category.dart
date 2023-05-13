import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vmpl/controller/home_controller.dart';
import 'package:sizer/sizer.dart';
import 'package:vmpl/utils/utils.dart';

class ParticularCategory extends StatelessWidget {
  const ParticularCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return SafeArea(
        child: Scaffold(
      appBar: AppWidget.appBarWidget(
          title: 'Category',
          visibility: true,
          onTapOnBackButton: () {
            homeController.particularProductIndex.value = 0;
            homeController.update();
          },
          onTapOnAction: () {}),
      body: Padding(
        padding: paddingSymmetric(horizontal: 6.w),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 4 / 5,
                      mainAxisSpacing: 2.h),
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  padding: paddingSymmetric(
                    vertical: 2.h,
                  ),
                  itemCount: AppWidget.imageData.length,
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () {
                        homeController.particularProductIndex.value = 2;
                        homeController.update();
                      },
                      child: AppWidget.priceBoxWidget(
                          imageString: AppWidget.imageData[index].icon,
                          text: AppWidget.imageData[index].text,
                          images: AppWidget.imageData,
                          kgAndPrice: '1Kg , price',
                          totalPrice: '₹4.99'),
                    );
                  })),
            ),
          ],
        ),
      ),
    ));
  }
}
