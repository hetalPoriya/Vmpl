import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:vmpl/helper/route_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  const SystemUiOverlayStyle(statusBarColor: Colors.white);
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
  ).then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: ((context, orientation, deviceType) {
      return GetMaterialApp(
        title: 'VMPL',
        debugShowCheckedModeBanner: false,
        getPages: RouteHelper.getPages,
        initialRoute: RouteHelper.splash,

        //  home: const MyHomePage(title: 'Flutter Demo Home Page'),
      );
    }));
  }
}
