import 'package:CoolHunter/constants/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DonationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: Colors.grey.withOpacity(.1),
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Donation History",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        children: [
          Column(
              // children: donationController.payments
              //     .map((payment) => PaymentWidget(
              //           paymentsModel: payment,
              //         ))
              //     .toList(),
              )
        ],
      ),
    );
  }
}
