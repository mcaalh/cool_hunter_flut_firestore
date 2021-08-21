import 'package:CoolHunter/screens/favourites/favourites_screen.dart';
import 'package:CoolHunter/screens/home/widgets/menu_widget.dart';
import 'package:CoolHunter/theme/bytel_icons_icons.dart';
import 'package:CoolHunter/theme/main_theme.dart';
import 'package:flutter/material.dart';
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
            IconButton(
              icon: Icon(BytelIcons.rvb_clients_commercial_coeur),
              color: kSecondaryLabelColor,
              onPressed: () {
                showBarModalBottomSheet<dynamic>(
                  context: context,
                  builder: (BuildContext context) => Container(
                    color: Colors.white,
                    child: FavouritesScreen(),
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
