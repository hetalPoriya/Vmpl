import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:vmpl/controller/auth/auth_controller.dart';
import 'package:vmpl/helper/route_helper.dart';
import 'package:vmpl/utils/app_colors.dart';
import 'package:vmpl/utils/app_images.dart';
import 'package:vmpl/utils/app_strings.dart';
import 'package:vmpl/utils/app_styles.dart';
import 'package:vmpl/utils/app_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //controller
    AuthController authController = Get.put(AuthController());

    return AppWidget.logInBackground(
        child: Padding(
            padding: paddingSymmetric(horizontal: 6.w),
            child: Obx(
              () => ListView(children: [
                extraLargeSizedBox,
                Image.asset(
                  AppImages.vmplLogo,
                  width: 10.w,
                  height: 10.h,
                ),
                mediumSizedBox,
                Text(
                  AppStrings.logIn,
                  style: AppStyles.mediumTextStyleBlack,
                ),
                smallerSizedBox,
                Text(
                  AppStrings.enterData,
                  style: AppStyles.smallerTextStyleGrey,
                ),
                mediumSizedBox,
                AppWidget.textFormField(
                    controller: authController.emailController.value,
                    hintText: AppStrings.email,
                    keyboardType: TextInputType.emailAddress),
                mediumSizedBox,
                AppWidget.textFormField(
                  controller: authController.passwordController.value,
                  hintText: AppStrings.password,
                  icon: authController.isPasswordVisible.value == true
                      ? Icons.remove_red_eye
                      : Icons.remove_red_eye_outlined,
                  onTapOnIcon: () {
                    authController.isPasswordVisible.value =
                        !authController.isPasswordVisible.value;
                    authController.update();
                  },
                  textInputAction: TextInputAction.done,
                  obscureText: authController.isPasswordVisible.value,
                ),
                smallSizedBox,
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(AppStrings.forgotPassword,
                      style: AppStyles.smallerTextStyleBlack
                          .copyWith(color: Colors.black54)),
                ),
                mediumSizedBox,
                AppWidget.elevatedButton(
                    onTap: () => Get.offNamedUntil(
                        RouteHelper.homeScreen, (route) => false),
                    text: AppStrings.logIn),
                mediumSizedBox,
                AppWidget.richText(
                    onTap: () => Get.toNamed(RouteHelper.signUp),
                    text1: AppStrings.notHaveAccount,
                    text2: AppStrings.singUp),
              ]),
            )));
  }
}
