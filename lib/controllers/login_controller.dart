import 'package:CoolHunter/constants/controllers.dart';
import 'package:CoolHunter/controllers/authentication_controller.dart';
import 'package:CoolHunter/services/authentication_service.dart';
import 'package:get/get.dart';

import 'states/login_state.dart';

class LoginController extends GetxController {
  static LoginController instance = Get.find();

  final _loginStateStream = LoginState().obs;

  LoginState get state => _loginStateStream.value;

  void login(String email, String password) async {
    _loginStateStream.value = LoginLoading();

    try {
      await authenticationController.signIn();
      _loginStateStream.value = LoginState();
    } on AuthenticationException catch (e) {
      _loginStateStream.value = LoginFailure(error: e.message);
    }
  }
}
