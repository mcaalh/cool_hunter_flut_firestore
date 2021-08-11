import 'package:CoolHunter/theme/main_theme.dart';
import 'package:flutter/material.dart';

class Searchwidget extends StatelessWidget {
  const Searchwidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: TextField(
        cursorColor: kPrimaryLabelColor,
        decoration: InputDecoration(
          icon: Icon(
            Icons.search,
          ),
        ),
      ),
    );
  }
}
