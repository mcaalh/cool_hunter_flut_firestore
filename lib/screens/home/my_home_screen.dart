import 'package:CoolHunter/constants/controllers.dart';
import 'package:CoolHunter/constants/firebase.dart';
import 'package:CoolHunter/models/models.dart';
import 'package:CoolHunter/screens/home/widgets/home_nav_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:CoolHunter/controllers/authentication_controller.dart';
import 'package:CoolHunter/models/category.dart';
import 'package:CoolHunter/widgets/custom_text.dart';
import 'package:CoolHunter/widgets/grid_view_widget.dart';
import 'package:get/get.dart';

class MyHomeScreen extends StatelessWidget {
  final UserModel? user;

  MyHomeScreen({Key? key, this.user}) : super(key: key);
  final AuthenticationController _authenticationController = Get.find();

  @override
  Widget build(BuildContext context) {
    List<Category> data = [];
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text(auth.currentUser!.email != null
                    ? _authenticationController.userModel.value.name.toString()
                    : 'NoOne'),
                accountEmail: Text(user != null
                    ? user!.email.toString()
                    : 'noone@nobody.com')),
            ListTile(
              onTap: () {
                print(_authenticationController.userModel.value.name);
                _authenticationController.signOut();
                // print('signout');
              },
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Log out'),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const HomeNavBarWidget(),
            Expanded(child: GridViewWidget()),
          ],
        ),
      ),
    );
  }
}
