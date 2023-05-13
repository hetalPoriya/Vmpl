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

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

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
                Text(
                  AppStrings.singUp,
                  style: AppStyles.mediumTextStyleBlack,
                ),
                smallerSizedBox,
                Text(
                  AppStrings.enterCredentials,
                  style: AppStyles.smallerTextStyleGrey,
                ),
                mediumSizedBox,
                AppWidget.textFormField(
                  controller: authController.userNameController.value,
                  hintText: AppStrings.username,
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
                  obscureText: authController.isPasswordVisible.value,
                ),
                mediumSizedBox,
                AppWidget.textFormField(
                    controller: authController.referralCodeController.value,
                    hintText: AppStrings.referralCode,
                    suffixWidget: Text(AppStrings.optional,
                        style: AppStyles.smallerTextStyleGrey),
                    textInputAction: TextInputAction.done),
                smallSizedBox,
                Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                      text: TextSpan(
                          text: AppStrings.agree,
                          style: AppStyles.smallerTextStyleGrey,
                          children: [
                        TextSpan(
                            text: 'Terms of Service ',
                            style: AppStyles.smallerTextStyleBlack
                                .copyWith(color: AppColors.lightGreen)),
                        const TextSpan(text: 'and '),
                        TextSpan(
                            text: 'Privacy Policy ',
                            style: AppStyles.smallerTextStyleBlack
                                .copyWith(color: AppColors.lightGreen)),
                      ])),
                ),
                mediumSizedBox,
                AppWidget.elevatedButton(
                    onTap: () => Get.offNamedUntil(
                        RouteHelper.homeScreen, (route) => false),
                    text: AppStrings.singUp),
                mediumSizedBox,
                AppWidget.richText(
                    onTap: () => Get.offNamed(RouteHelper.login),
                    text1: AppStrings.alreadyHaveAccount,
                    text2: AppStrings.logIn),
              ]),
            )));
  }
}
