import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var emailController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var userNameController = TextEditingController().obs;
  var referralCodeController = TextEditingController().obs;
  var searchController = TextEditingController().obs;

  RxBool isPasswordVisible = false.obs;
}
