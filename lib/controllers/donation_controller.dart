import 'package:CoolHunter/constants/controllers.dart';
import 'package:CoolHunter/constants/firebase.dart';
import 'package:CoolHunter/models/user.dart';
import 'package:get/get.dart';

class DonationController extends GetxController {
  static DonationController instance = Get.find();
  RxDouble totalDonationAmount = 0.0.obs;

  @override
  void onReady() {
    super.onReady();
    ever(authenticationController.userModel, changeDonationTotalAmount);
  }

  changeDonationTotalAmount(UserModel callback) {}
}
