import 'package:CoolHunter/constants/firebase.dart';
import 'package:CoolHunter/models/donation.dart';
import 'package:CoolHunter/models/favourite.dart';
import 'package:CoolHunter/models/user.dart';
import 'package:CoolHunter/screens/authentication/authentication_screen.dart';
import 'package:CoolHunter/screens/home/my_home_screen.dart';
import 'package:CoolHunter/widgets/utils/show_loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  static AuthenticationController instance = Get.find();

  late Rx<User?> firebaseUser;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String usersCollection = 'users';
  Rx<UserModel> userModel = UserModel(
    name: '',
    email: '',
    id: '',
    favourites: <String>[],
    donations: <String>[],
  ).obs;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  Future<void> signIn() async {
    try {
      showLoading();
      await auth
          .signInWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((UserCredential result) {
        dismissLoadingWidget();
        _clearControllers();
      });
    } catch (e) {
      dismissLoadingWidget();
      debugPrint(e.toString());
      Get.snackbar<dynamic>('Sign In Failed', 'Try again');
    }
  }

  Future<void> signUp() async {
    showLoading();
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((UserCredential result) {
        final String _userId = result.user!.uid;
        _addUserToFirestore(_userId);
        _clearControllers();
        dismissLoadingWidget();
      });
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar<dynamic>('The registration Failed', 'Try again later');
    }
  }

  Future<void> signOut() async {
    auth.signOut();
  }

  void _clearControllers() {
    name.clear();
    email.clear();
    password.clear();
  }

  void _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll<dynamic>(() => AuthenticationScreen());
    } else {
      userModel.bindStream(listenToUser());
      Get.offAll<dynamic>(() => MyHomeScreen());
    }
  }

  void updateUserData(Map<String, dynamic> data) {
    // logger.i("UPDATED");
    print('User updated');
    try {
      firebaseFirestore
          .collection(usersCollection)
          .doc(firebaseUser.value!.uid)
          .update(data);
    } catch (e) {
      print(e.toString());
    }
  }

  Stream<UserModel> listenToUser() {
    return firebaseFirestore
        .collection(usersCollection)
        .doc(firebaseUser.value!.uid)
        .snapshots()
        .map((DocumentSnapshot<Map<String, dynamic>> snapshot) =>
            UserModel.fromSnapshot(snapshot));
  }

  void _addUserToFirestore(String userId) {
    firebaseFirestore.collection(usersCollection).doc(userId).set(
      <String, dynamic>{
        'name': name.text.trim(),
        'id': userId,
        'email': email.text.trim(),
        // "donations": [],
        'favourites': <FavouriteModel>[],
      },
    );
  }
}
