import 'dart:convert';
import 'package:CoolHunter/screens/home/widgets/home_nav_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:CoolHunter/controllers/authentication_controller.dart';
import 'package:CoolHunter/controllers/home_controller.dart';
import 'package:CoolHunter/models/category.dart';
import 'package:CoolHunter/widgets/custom_text.dart';
import 'package:CoolHunter/widgets/grid_view_widget.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class MyHomeScreen extends StatelessWidget {
  MyHomeScreen({Key? key}) : super(key: key);
  final AuthenticationController _authenticationController = Get.find();

  @override
  Widget build(BuildContext context) {
    List<Category> data = [];
    Future<List<Category>> readJson() async {
      String response;
      try {
        response =
            await rootBundle.loadString('assets/data/category_data_en.json');
      } catch (_) {
        response =
            await rootBundle.loadString('assets/data/category_data_fr.json');
      }
      final List<dynamic> jsonData = json.decode(response) as List<dynamic>;

      data = jsonData
          .map((dynamic element) =>
              Category.fromJson(element as Map<String, dynamic>))
          .toList();
      return data;
    }

    // final CategoryProvider categoryProvider =
    //     Provider.of<CategoryProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const CustomText(
          text: 'Cadevo',
          size: 18,
          color: Colors.amber,
          weight: FontWeight.bold,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const UserAccountsDrawerHeader(
                accountName: Text('Bool'),
                accountEmail: Text('mcaalh@gmail.com')),
            ListTile(
              onTap: () {
                _authenticationController.signOut();
                // print('signout');
              },
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Log out'),
            )
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          const HomeNavBarWidget(),
          Expanded(child: GridViewWidget(categories: data.toList())),
        ],
      ),
    );
  }
}
