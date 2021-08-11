import 'package:CoolHunter/theme/bytel_icons_icons.dart';
import 'package:CoolHunter/theme/main_theme.dart';
import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        print('navbar tap');
      },
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      highlightColor: kHoverColor,
      splashColor: kSecondaryLabelColor,
      constraints: const BoxConstraints(
        maxHeight: 40.0,
        maxWidth: 40.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: kBackgroundColor,
          borderRadius: BorderRadius.circular(14.0),
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: kTrendBackgroundColor,
                offset: Offset(0, 20),
                blurRadius: 16.0)
          ],
        ),
        child: const Icon(
          BytelIcons.rvb_interface_interface_menu,
        ),
        padding: const EdgeInsets.all(8.0),
      ),
    );
  }
}
