import 'package:CoolHunter/controllers/authentication_controller.dart';
import 'package:CoolHunter/controllers/donation_controller.dart';
import 'package:CoolHunter/controllers/favourites_controller.dart';
import 'package:CoolHunter/controllers/map_controller.dart';
import 'package:CoolHunter/controllers/projects_controller.dart';
import 'package:CoolHunter/screens/details/details_screen.dart';
import 'package:CoolHunter/screens/details_slide/details_slide_screen.dart';
import 'package:CoolHunter/screens/map/map_screen.dart';
import 'package:CoolHunter/screens/profile/profile_screen.dart';
import 'package:CoolHunter/screens/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import 'controllers/app_controller.dart';

Future<void> main() async {
  dotenv.load(fileName: '.env');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initialize();
  runApp(const MyApp());
}

void initialize() {
  Get.put(AuthenticationController());
  Get.put(AppController());
  Get.put(ProjectsController());
  Get.put(FavouritesController());
  Get.put(DonationController());
  Get.put(MapController());
}

class MyApp extends GetWidget<AuthenticationController> {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cool Hunter',
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      getPages: <GetPage<dynamic>>[
        GetPage<dynamic>(
            name: '/details/',
            page: () => const DetailsScreen(),
            transition: Transition.downToUp),
        GetPage<dynamic>(
            name: '/details-slide/',
            page: () => const DetailsSlideScreen(),
            transition: Transition.downToUp),
        GetPage<dynamic>(
            name: '/map/',
            page: () => const MapScreen(),
            transition: Transition.zoom),
        GetPage<dynamic>(
            name: '/profile/',
            page: () => const ProfileScreen(),
            transition: Transition.fade),
      ],
    );
  }
}
