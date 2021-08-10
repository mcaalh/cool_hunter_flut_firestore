import 'package:flutter/material.dart';
import 'package:CoolHunter/controllers/authentication_controller.dart';
import 'package:CoolHunter/controllers/states/authentication_state.dart';
import 'package:CoolHunter/screens/authentication/login/login_screen.dart';
import 'package:CoolHunter/screens/authentication/login/login_screen_new.dart';
import 'package:CoolHunter/screens/home/home_screen.dart';
import 'package:CoolHunter/screens/home/my_home_screen.dart';
import 'package:CoolHunter/screens/splash/splash_screen.dart';
import 'package:CoolHunter/services/authentication_service.dart';
import 'package:get/get.dart';

void main() {
  initialize();
  runApp(MyApp());
}

void initialize() {
  Get.lazyPut(
    () => AuthenticationController(Get.put(FakeAuthenticationService())),
  );
}

class MyApp extends GetWidget<AuthenticationController> {
  // This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fluter GetX Auth',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: Obx(() {
        if (controller.state is UnAuthenticated) {
          return LoginScreenNew();
        }

        if (controller.state is Authenticated) {
          // return HomeScreen(
          //   user: (controller.state as Authenticated).user,
          // );
          return MyHomeScreen();
        }
        return SplashScreen();
      }),
    );
  }
}
