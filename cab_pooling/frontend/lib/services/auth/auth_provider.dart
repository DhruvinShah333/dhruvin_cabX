import 'package:CabX/services/auth/auth_user.dart';

abstract class AuthProviderClass {
  AuthUser? get currentUser;

  Future<void> initialize();
  Future<AuthUser> signIn();

  // Future<AuthUser> createUserWithEmailAndPassword(
  //     {required String email, required String password});

  Future<void> signOut();

  // Future<void> sendEmailVerification();

  // Future<void> sendForgotPasswordLink({required String email});
}
