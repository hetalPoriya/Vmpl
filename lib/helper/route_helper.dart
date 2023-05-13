import 'package:get/get.dart';
import 'package:vmpl/views/account/about.dart';
import 'package:vmpl/views/account/account.dart';
import 'package:vmpl/views/auth/auth.dart';
import 'package:vmpl/views/cart/cart.dart';
import 'package:vmpl/views/home_screen.dart';
import 'package:vmpl/views/products/products.dart';

class RouteHelper {
  static String splash = '/splash';
  static String onBoarding = '/onBoarding';
  static String login = '/login';
  static String signUp = '/signUp';
  static String homeScreen = '/homeScreen';

  //products
  static String categories = '/categories';
  static String allCategories = '/allCategories';
  static String particularCategory = '/particularCategory';
  static String productDetails = '/productDetails';

  //cart
  static String myCart = '/myCart';
  static String orderAccepted = '/orderAccepted';

  //account
  static String aboutScreen = '/aboutScreen';
  static String deliveryAddress = '/deliveryAddress';
  static String helpScreen = '/helpScreen';
  static String inviteAndEarn = '/inviteAndEarn';
  static String myAccount = '/myAccount';
  static String myDetails = '/myDetails';
  static String myNetwork = '/myNetwork';
  static String myOrder = '/myOrder';
  static String orderDetails = '/orderDetails';

  static List<GetPage> getPages = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: onBoarding, page: () => const OnBoarding()),
    GetPage(name: login, page: () => const LoginScreen()),
    GetPage(name: signUp, page: () => const SignUpScreen()),
    GetPage(name: homeScreen, page: () => const HomeScreen()),

    //products
    GetPage(name: categories, page: () => const CategoriesScreen()),
    GetPage(name: allCategories, page: () => const AllCategories()),
    GetPage(name: particularCategory, page: () => const ParticularCategory()),
    GetPage(name: productDetails, page: () => const ProductDetails()),

    //cart
    GetPage(name: myCart, page: () => const MyCart()),
    GetPage(name: orderAccepted, page: () => const OrderAccepted()),

    //account
    GetPage(name: aboutScreen, page: () => const AboutScreen()),
    GetPage(name: deliveryAddress, page: () => const DeliveryAddress()),
    GetPage(name: helpScreen, page: () => const HelpScreen()),
    GetPage(name: inviteAndEarn, page: () => const InviteAndEarn()),
    GetPage(name: myAccount, page: () => MyAccount()),
    GetPage(name: myDetails, page: () => const MyDetails()),
    GetPage(name: myNetwork, page: () => const MyNetwork()),
    GetPage(name: myOrder, page: () => const MyOrder()),
    GetPage(name: orderDetails, page: () => const OrderDetails()),
  ];
}
