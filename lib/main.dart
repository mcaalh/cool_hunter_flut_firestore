import 'package:CoolHunter/controllers/donation_controller.dart';
import 'package:CoolHunter/controllers/favourites_controller.dart';
import 'package:CoolHunter/controllers/projects_controller.dart';
import 'package:CoolHunter/screens/details/details_screen.dart';
import 'package:CoolHunter/screens/details_slide/details_slide_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:CoolHunter/controllers/authentication_controller.dart';
import 'package:CoolHunter/screens/splash/splash_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import 'controllers/app_controller.dart';

Future<void> main() async {
  dotenv.load(fileName: '.env');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initialize();
  runApp(MyApp());
}

void initialize() {
  // Get.lazyPut(
  //   () => AuthenticationController(Get.put(FakeAuthenticationService())),
  // );
  Get.put(AuthenticationController());
  Get.put(AppController());
  Get.put(ProjectsController());
  Get.put(FavouritesController());
  Get.put(DonationController());
}

class MyApp extends GetWidget<AuthenticationController> {
  // This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cool Hunter',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      getPages: <GetPage<dynamic>>[
        GetPage<dynamic>(
            name: '/details/',
            page: () => const DetailsScreen(),
            transition: Transition.downToUp),
        GetPage<dynamic>(
            name: '/details-slide/',
            page: () => const DetailsSlideScreen(),
            transition: Transition.downToUp),
      ],
    );
  }
}
