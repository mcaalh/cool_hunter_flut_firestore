import 'package:CoolHunter/screens/authentication/authentication_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:CoolHunter/controllers/authentication_controller.dart';
import 'package:CoolHunter/controllers/states/authentication_state.dart';
import 'package:CoolHunter/screens/authentication/login/login_screen.dart';
import 'package:CoolHunter/screens/authentication/login/login_screen_new.dart';
import 'package:CoolHunter/screens/home/my_home_screen.dart';
import 'package:CoolHunter/screens/splash/splash_screen.dart';
import 'package:CoolHunter/services/authentication_service.dart';
import 'package:get/get.dart';

import 'controllers/app_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initialize();
  runApp(MyApp());
}

void initialize() {
  Get.lazyPut(
    () => AuthenticationController(Get.put(FakeAuthenticationService())),
  );
  Get.put(AppController());
}

class MyApp extends GetWidget<AuthenticationController> {
  // This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cool Hunter',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
