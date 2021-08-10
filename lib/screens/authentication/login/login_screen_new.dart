import 'package:flutter/material.dart';
import 'package:CoolHunter/constants/controllers.dart';
import 'package:CoolHunter/screens/home/home_screen.dart';
import 'package:CoolHunter/screens/home/my_home_screen.dart';
import 'package:CoolHunter/widgets/custom_button.dart';
import 'package:get/get.dart';

class LoginScreenNew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.5),
                blurRadius: 10,
              )
            ],
            borderRadius: BorderRadius.circular(20)),
        child: Wrap(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  margin: EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.grey.withOpacity(.3),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    child: TextField(
                      controller: authenticationController.email,
                      decoration: InputDecoration(
                          icon: Icon(Icons.email_outlined),
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          hintText: "Email"),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  margin: EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.grey.withOpacity(.3),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    child: TextField(
                      controller: authenticationController.password,
                      decoration: InputDecoration(
                          icon: Icon(Icons.lock),
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          hintText: "Password"),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: CustomButton(
                bgColor: Colors.blue.shade700,
                text: "Login",
                onTap: () {
                  print('et login tap');
                  // Get.to<dynamic>(MyHomeScreen());
                  authenticationController.signIn();
                },
                txtColor: Colors.black,
                shadowColor: Colors.amberAccent,
              ),
            )
          ],
        ),
      ),
    );
  }
}