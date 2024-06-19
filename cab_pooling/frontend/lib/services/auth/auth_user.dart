import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

@immutable
class AuthUser {
  final String id;
  final bool isEmailVerified;
  final String email;
  const AuthUser({required this.id, required this.isEmailVerified, required this.email});

  factory AuthUser.fromFirebaseUser(User? user) {
    return AuthUser(id: user!.uid, isEmailVerified: user.emailVerified, email: user.email!);
  }

  // override for printing the user details
  @override
  String toString() {
    return 'AuthUser{isEmailVerified: $isEmailVerified}';
  }
}