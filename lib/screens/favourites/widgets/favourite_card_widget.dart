import 'package:CoolHunter/controllers/favourites_controller.dart';
import 'package:CoolHunter/models/favourite.dart';
import 'package:CoolHunter/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class FavouriteCardWidget extends StatelessWidget {
  final FavouriteModel favourite;

  const FavouriteCardWidget({Key? key, required this.favourite})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(
            favourite.image,
            width: 80,
          ),
        ),
        Expanded(
            child: Wrap(
          direction: Axis.vertical,
          children: [
            Container(
                padding: EdgeInsets.only(left: 14),
                child: CustomText(
                  text: favourite.name,
                  color: Colors.amberAccent,
                  size: 17,
                  weight: FontWeight.normal,
                )),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     IconButton(
            //         icon: Icon(Icons.chevron_left),
            //         onPressed: () {
            //           FavouritesController.decreaseQuantity(favourite);
            //         }),
            //     Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: CustomText(
            //         text: favourite.quantity.toString(),
            //       ),
            //     ),
            //     IconButton(
            //         icon: Icon(Icons.chevron_right),
            //         onPressed: () {
            //           cartController.increaseQuantity(favourite);
            //         }),
            //   ],
            // )
          ],
        )),
        Padding(
          padding: const EdgeInsets.all(14),
          child: CustomText(
            text: "\$${favourite.cost}",
            size: 22,
            weight: FontWeight.bold,
            color: Colors.amber,
          ),
        ),
      ],
    );
  }
}
