import 'package:CoolHunter/theme/main_theme.dart';
import 'package:flutter/material.dart';

class Searchwidget extends StatelessWidget {
  const Searchwidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 33.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14.0),
              boxShadow: const <BoxShadow>[
                BoxShadow(
                  color: kShadowColor,
                  offset: Offset(0, 12),
                  blurRadius: 16.0,
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              cursorColor: kPrimaryLabelColor,
              decoration: const InputDecoration(
                icon: Icon(
                  Icons.search,
                  color: kPrimaryLabelColor,
                  size: 20.0,
                ),
                border: InputBorder.none,
                hintText: 'Find coolest place',
                hintStyle: kLabelSidebar,
              ),
              style: kLabelSidebar,
              onChanged: (String newText) {
                print(newText);
              },
            ),
          ),
        ),
      ),
    );
  }
}
