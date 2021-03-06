import 'package:CoolHunter/screens/favourites/favourites_screen.dart';
import 'package:CoolHunter/screens/home/widgets/menu_widget.dart';
import 'package:CoolHunter/screens/home/widgets/search_widget.dart';
import 'package:CoolHunter/theme/bytel_icons_icons.dart';
import 'package:CoolHunter/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomeNavBarWidget extends StatelessWidget {
  const HomeNavBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const MenuWidget(),
            const Searchwidget(),
            IconButton(
              icon: const Icon(Icons.map),
              color: kSecondaryLabelColor,
              onPressed: () {
                Get.toNamed<dynamic>('/map/');
              },
            ),
            IconButton(
              icon: const Icon(BytelIcons.rvb_clients_commercial_coeur),
              color: kSecondaryLabelColor,
              onPressed: () {
                showBarModalBottomSheet<dynamic>(
                  context: context,
                  builder: (BuildContext context) => Container(
                    color: Colors.white,
                    child: const FavouritesScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
