import 'package:CoolHunter/controllers/app_controller.dart';
import 'package:CoolHunter/screens/authentication/login/login_screen_new.dart';
import 'package:CoolHunter/screens/authentication/register/register_screen.dart';
import 'package:CoolHunter/screens/authentication/widgets/bottom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationScreen extends StatelessWidget {
  final AppController _appController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Obx(
          () => SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Image.asset(
                  'assets/images/bg3.png',
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.cover,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.width / 1.3),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 70,
                    ),
                    Visibility(
                        visible: _appController.isLoginWidgetDisplayed.value,
                        child: const LoginScreenNew()),
                    Visibility(
                        visible: !_appController.isLoginWidgetDisplayed.value,
                        child: RegisterScreen()),
                    const SizedBox(
                      height: 10,
                    ),
                    Visibility(
                      visible: _appController.isLoginWidgetDisplayed.value,
                      child: BottomTextWidget(
                        onTap: () {
                          _appController.changeDisplayedAuthWidget();
                        },
                        text1: "Don't have an account?",
                        text2: 'Create account!',
                      ),
                    ),
                    Visibility(
                      visible: !_appController.isLoginWidgetDisplayed.value,
                      child: BottomTextWidget(
                        onTap: () {
                          _appController.changeDisplayedAuthWidget();
                        },
                        text1: 'Already have an account?',
                        text2: 'Sign in!!',
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.25,
                  left: MediaQuery.of(context).size.width * 0.30,
                  child: Image.asset(
                    'assets/logos/makiHead.png',
                    width: 140,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
