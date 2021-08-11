import 'package:CoolHunter/models/models.dart';
import 'package:get/get.dart';

abstract class AuthenticationService extends GetxService {
  Future<UserModel?> getCurrentUser();
  Future<UserModel> signInWithEmailAndPassword(String email, String password);
  Future<void> signOut();
}

class FakeAuthenticationService extends AuthenticationService {
  @override
  Future<UserModel?> getCurrentUser() async {
    // simulated delay
    await Future.delayed(Duration(seconds: 2));
    return null;
  }

  @override
  Future<UserModel> signInWithEmailAndPassword(
      String email, String password) async {
    await Future.delayed(Duration(seconds: 2));

    if (email.toLowerCase() != 'test@domain.com' || password != 'testpass123') {
      throw AuthenticationException(message: 'Wrong username or password');
    }

    return UserModel(name: 'Test User', email: email);
  }

  @override
  Future<void> signOut() async {}
}

class AuthenticationException implements Exception {
  final String message;

  AuthenticationException({this.message = 'Unknown error occurred. '});
}
