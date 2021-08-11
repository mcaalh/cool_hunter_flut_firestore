import 'package:CoolHunter/constants/firebase.dart';
import 'package:CoolHunter/controllers/states/authentication_state.dart';
import 'package:CoolHunter/models/user.dart';
import 'package:CoolHunter/screens/authentication/authentication_screen.dart';
import 'package:CoolHunter/screens/home/my_home_screen.dart';
// import 'package:CoolHunter/models/user.dart';
import 'package:CoolHunter/services/authentication_service.dart';
import 'package:CoolHunter/widgets/utils/show_loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  static AuthenticationController instance = Get.find();

  late Rx<User?> firebaseUser;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String usersCollection = "users";
  Rx<UserModel> userModel = UserModel(name: '', email: 'email').obs;

  final AuthenticationService _authenticationService;
  final _authenticationStateStream = AuthenticationState().obs;

  AuthenticationState get state => _authenticationStateStream.value;

  AuthenticationController(this._authenticationService);

  // @override
  // void onInit() {
  //   _getAuthenticatedUser();
  //   super.onInit();
  // }

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
          .then((result) {
        print(result.user.toString());
        // _authenticationStateStream.value =
        //     Authenticated(user: result.user as User);
        dismissLoadingWidget();
        _clearControllers();
      });
    } catch (e) {
      dismissLoadingWidget();
      debugPrint(e.toString());
      Get.snackbar("Sign In Failed", "Try again");
    }
    // _authenticationStateStream.value = Authenticated(user: user);
  }

  void signOut() async {
    // await _authenticationService.signOut();
    auth.signOut();
    _authenticationStateStream.value = UnAuthenticated();
  }

  void _getAuthenticatedUser() async {
    _authenticationStateStream.value = AuthenticationLoading();

    final user = await _authenticationService.getCurrentUser();
    print('user to get');
    print(user);

    if (user == null) {
      _authenticationStateStream.value = UnAuthenticated();
    } else {
      // _authenticationStateStream.value = Authenticated(user: user);
      print('authenticated');
    }
  }

  void _clearControllers() {
    name.clear();
    email.clear();
    password.clear();
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => AuthenticationScreen());
    } else {
      userModel.bindStream(listenToUser());
      Get.offAll(() => MyHomeScreen());
    }
  }

  Stream<UserModel> listenToUser() => firebaseFirestore
      .collection(usersCollection)
      .doc(firebaseUser.value!.uid)
      .snapshots()
      .map((snapshot) => snapshot.data() as UserModel);
}
