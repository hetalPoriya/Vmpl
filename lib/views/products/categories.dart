import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vmpl/controller/home_controller.dart';
import 'package:vmpl/utils/utils.dart';
import 'package:sizer/sizer.dart';
import 'package:vmpl/views/products/products.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //controller
    HomeController homeController = Get.put(HomeController());
    return Obx(
      () {
        return homeController.particularProductIndex.value == 0
            ? AllCategories()
            : homeController.particularProductIndex.value == 1
                ? ParticularCategory()
                : ProductDetails();
      },
    );
  }
}
