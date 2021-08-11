import 'package:CoolHunter/screens/home/widgets/menu_widget.dart';
import 'package:CoolHunter/theme/main_theme.dart';
import 'package:flutter/material.dart';

class HomeNavBarWidget extends StatelessWidget {
  const HomeNavBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const <Widget>[
          MenuWidget(),
          Icon(
            Icons.menu_open,
            color: kSecondaryLabelColor,
          ),
        ],
      ),
    );
  }
}
