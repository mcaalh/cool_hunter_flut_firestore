import 'package:CoolHunter/constants/firebase.dart';
import 'package:CoolHunter/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class UsersController extends GetxController {
  Future<UserModel> getUser(String uid) async {
    try {
      final DocumentSnapshot _doc =
          await firebaseFirestore.collection('users').doc(uid).get();

      return UserModel.fromSnapshot(_doc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
