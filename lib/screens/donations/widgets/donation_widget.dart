import 'package:CoolHunter/models/donation.dart';
import 'package:CoolHunter/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class DonationWidget extends StatelessWidget {
  final DonationModel donationModel;

  const DonationWidget({Key? key, required this.donationModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(.5), blurRadius: 15)
          ]),
      child: Wrap(
        children: [
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CustomText(
                  text: "ITEMS:",
                  color: Colors.grey,
                  size: 14.0,
                  weight: FontWeight.normal,
                ),
              ),
              CustomText(
                text: donationModel.amount.toString(),
                color: Colors.black,
                weight: FontWeight.bold,
                size: 16.0,
              ),
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomText(
                  text: "\$ ${donationModel.amount}",
                  color: Colors.black,
                  weight: FontWeight.bold,
                  size: 18,
                ),
              ),
              SizedBox(
                width: 5,
              )
            ],
          ),
          Divider(),
          // Column(
          //   children: donationModel.cart
          //       .map((item) => ListTile(
          //             title: CustomText(
          //               text: item['name'],
          //               size: 14.0,
          //               weight: FontWeight.normal,
          //               color: Colors.black,
          //             ),
          //             trailing: CustomText(
          //               text: "\$ ${item['cost']}",
          //               size: 14.0,
          //               weight: FontWeight.normal,
          //               color: Colors.black,
          //             ),
          //           ))
          //       .toList(),
          // ),
          Divider(),
          ListTile(
            title: CustomText(
              text: _returnDate(),
              color: Colors.grey,
              size: 14.0,
              weight: FontWeight.normal,
            ),
            trailing: CustomText(
              text: donationModel.status,
              color: Colors.green,
              size: 14.0,
              weight: FontWeight.normal,
            ),
          )
        ],
      ),
    );
  }

  String _returnDate() {
    DateTime date =
        new DateTime.fromMillisecondsSinceEpoch(donationModel.createdAt);
    return timeago.format(date, locale: 'fr');
  }
}
