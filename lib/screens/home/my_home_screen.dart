import 'package:CoolHunter/constants/controllers.dart';
import 'package:CoolHunter/constants/firebase.dart';
import 'package:CoolHunter/models/models.dart';
import 'package:CoolHunter/screens/home/widgets/home_nav_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:CoolHunter/controllers/authentication_controller.dart';
import 'package:CoolHunter/widgets/grid_view_widget.dart';
import 'package:get/get.dart';

class MyHomeScreen extends StatelessWidget {
  final UserModel? user;

  MyHomeScreen({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserModel _user = authenticationController.userModel.value;
    return Obx(
      () {
        return Scaffold(
          extendBodyBehindAppBar: true,
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                InkWell(
                  onTap: () => Get.toNamed<dynamic>('/profile'),
                  child: UserAccountsDrawerHeader(
                      currentAccountPicture: const Hero(
                        tag: 'assets/images/photo2.jpg',
                        child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/photo2.jpg')),
                      ),
                      accountName: Text(auth.currentUser!.email != null
                          ? authenticationController.userModel.value.name
                              .toString()
                          : 'NoOne'),
                      accountEmail: Text(_user != null
                          ? _user.email.toString()
                          : 'noone@nobody.com')),
                ),
                ListTile(
                  onTap: () {
                    print(authenticationController.userModel.value.name);
                    authenticationController.signOut();
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
      },
    );
  }
}
