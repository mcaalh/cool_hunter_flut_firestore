import 'dart:io';

import 'package:CoolHunter/constants/controllers.dart';
import 'package:CoolHunter/constants/firebase.dart';
import 'package:CoolHunter/models/donation.dart';
import 'package:CoolHunter/screens/donations/donations_screen.dart';
import 'package:CoolHunter/widgets/custom_text.dart';
import 'package:CoolHunter/widgets/utils/show_loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart' as dio_x;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart' as get_x;
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class DonationController extends GetxController {
  static DonationController instance = get_x.Get.find();
  String? url = dotenv.env['STRIPE_PAYEMENT_URL'];
  String? stripeUrl = dotenv.env['STRIPE_URL'];

  dio_x.BaseOptions options = dio_x.BaseOptions(
    headers: <String, dynamic>{
      HttpHeaders.acceptHeader: 'accept: application/json',
    },
  );

  dio_x.Dio dio = dio_x.Dio();

  String donationCollection = 'donations';
  List<DonationModel> payments = <DonationModel>[];

  @override
  void onReady() {
    Stripe.publishableKey = dotenv.env['STRIPE_PUBLIC_KEY'].toString();
    Stripe.merchantIdentifier = 'merchant.app.coolhunter';
  }

  Future<void> applePayPayment(String amount) async {
    try {
      // 1. Present Apple Pay sheet
      await Stripe.instance.presentApplePay(
        ApplePayPresentParams(
          cartItems: <ApplePayCartSummaryItem>[
            ApplePayCartSummaryItem(
              label: 'Product Test',
              amount: amount,
            ),
          ],
          country: 'Fr',
          currency: 'EUR',
        ),
      );

      // 2. fetch Intent Client Secret from backend
      final dio_x.Response<dynamic> response = await dio.get<dynamic>(url!,
          options: dio_x.Options(
            contentType: 'application/json',
          ));
      final String clientSecret = response.data['paymentIntent'].toString();

      // 2. Confirm apple pay payment
      await Stripe.instance.confirmApplePayPayment(clientSecret);
      get_x.Get.snackbar<dynamic>('Apple pay payment ', 'Succeded');
    } catch (e) {
      get_x.Get.snackbar<dynamic>(
          'Apple pay payment ', 'failed ${e.toString()}');
    }
  }

  Future<void> makePayment() async {
    final dio_x.Response<dynamic> response = await dio.post<dynamic>(
      '$stripeUrl/create_payment_sheet',
    );
    final dynamic _paymentSheetData = response.data;
    try {
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          applePay: true,
          googlePay: true,
          style: ThemeMode.dark,
          testEnv: true,
          merchantCountryCode: 'FR',
          merchantDisplayName: 'Flutter Stripe Store Demo',
          customerId: _paymentSheetData['customer'].toString(),
          paymentIntentClientSecret:
              _paymentSheetData['paymentIntent'].toString(),
          customerEphemeralKeySecret:
              _paymentSheetData['ephemeralKey'].toString(),
        ),
      );
      _displayPaymentSheet(_paymentSheetData);
    } catch (e) {
      print('error flutter make payment: ${e.toString()}');
    }
  }

  Future<void> _displayPaymentSheet(dynamic clientSecret) async {
    try {
      // #3 display payment sheet
      await Stripe.instance.presentPaymentSheet(
        parameters: PresentPaymentSheetParameters(
          clientSecret: clientSecret['paymentIntent'].toString(),
          confirmPayment: true,
        ),
      );
      get_x.Get.snackbar<dynamic>(
          'payed successefully', 'ou paid ${clientSecret['paymentIntent']}');
    } catch (e) {
      print('error flutter display : ${e.toString()}');
    }
  }

  void _showPaymentFailedAlert() {
    get_x.Get.defaultDialog<dynamic>(
        content: const CustomText(
          text: 'Payment failed, try another card',
          color: Colors.black,
          size: 18.0,
          weight: FontWeight.bold,
        ),
        actions: <GestureDetector>[
          GestureDetector(
              onTap: () {
                get_x.Get.back<dynamic>();
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomText(
                  text: 'Okay',
                  color: Colors.black,
                  size: 18.0,
                  weight: FontWeight.bold,
                ),
              ))
        ]);
  }

  void _addToCollection(
      {required String paymentStatus, required String paymentId}) {
    final String id = const Uuid().v1();
    firebaseFirestore
        .collection(donationCollection)
        .doc(id)
        .set(<String, dynamic>{
      'id': id,
      'clientId': authenticationController.userModel.value.id,
      'status': paymentStatus,
      'paymentId': paymentId,
      'amount': favouritesController.totalCartPrice.value.toStringAsFixed(2),
      'createdAt': DateTime.now().microsecondsSinceEpoch,
    });
  }

  void getPaymentHistory() {
    showLoading();
    payments.clear();
    firebaseFirestore
        .collection(donationCollection)
        .where('clientId',
            isEqualTo: authenticationController.userModel.value.id)
        .get()
        .then((QuerySnapshot<Map<String, dynamic>> snapshot) {
      for (QueryDocumentSnapshot<Map<String, dynamic>> doc in snapshot.docs) {
        final DonationModel payment = DonationModel.fromMap(doc.data());
        payments.add(payment);
      }

      dismissLoadingWidget();
      get_x.Get.to<dynamic>(() => DonationsScreen());
    });
  }
}
