import 'package:CoolHunter/constants/controllers.dart';
import 'package:CoolHunter/theme/main_theme.dart';
import 'package:CoolHunter/widgets/custom_button.dart';
import 'package:CoolHunter/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: CustomText(
                text: 'Heart heart',
                size: 24,
                weight: FontWeight.bold,
                color: Colors.amber,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Obx(
              () => Column(
                children: authenticationController.userModel.value.favourites
                    .map((dynamic favItem) => Text(
                          favItem.toString(),
                          style: kLink,
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 30,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(8),
            child: Obx(
              () => CustomButton(
                text:
                    'Pay (\$${favouritesController.totalCartPrice.value.toStringAsFixed(2)})',
                onTap: () {
                  donationController.makePayment();
                },
                bgColor: Colors.amber,
                shadowColor: Colors.black12,
                txtColor: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
