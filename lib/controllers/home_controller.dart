import 'package:get/get.dart';

import 'authentication_controller.dart';

class HomeController extends GetxController {
  final AuthenticationController _authenticationController = Get.find();

  void signOut() {
    _authenticationController.signOut();
  }
}
