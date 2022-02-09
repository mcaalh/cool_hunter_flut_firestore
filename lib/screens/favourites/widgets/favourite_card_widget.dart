import 'package:CoolHunter/models/favourite.dart';
import 'package:CoolHunter/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class FavouriteCardWidget extends StatelessWidget {
  const FavouriteCardWidget({Key? key, required this.favourite})
      : super(key: key);
  final FavouriteModel favourite;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
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
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 14),
              child: CustomText(
                text: favourite.name,
                color: Colors.amberAccent,
                size: 17,
                weight: FontWeight.normal,
              ),
            ),
          ],
        )),
        Padding(
          padding: const EdgeInsets.all(14),
          child: CustomText(
            text: '\$${favourite.cost}',
            size: 22,
            weight: FontWeight.bold,
            color: Colors.amber,
          ),
        ),
      ],
    );
  }
}
