// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/services.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:swift_street/firebase_options.dart';
// import 'package:swift_street/services/auth/auth_exceptions.dart';
// import 'package:swift_street/services/auth/auth_provider.dart';
// import 'package:swift_street/services/auth/auth_user.dart';

// class GoogleAuthClass implements AuthProviderClass {
//   @override
//   AuthUser? get currentUser {
//     final user = FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       return AuthUser.fromFirebaseUser(user);
//     }
//     return null;
//   }

//   @override
//   Future<void> initialize() async {
//     await Firebase.initializeApp(
//       options: DefaultFirebaseOptions.currentPlatform,
//     );
//   }

//   @override
//   Future<AuthUser> signIn() async {
//     try {
//       final googleProvider = GoogleSignIn(
//         clientId: DefaultFirebaseOptions.currentPlatform.projectId,
//         scopes: ['email'],
//       );
//       final googleUser = await googleProvider.signIn();

//       if (googleUser == null) {
//         throw GenericAuthException(
//             message: 'An error occurred during Google Sign In.');
//       }

//       final googleAuth = await googleUser.authentication;

//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       final userCredential =
//           await FirebaseAuth.instance.signInWithCredential(credential);

//       return AuthUser.fromFirebaseUser(userCredential.user);
//     } on PlatformException catch (e) {
//       await GoogleSignIn().signOut();
//       throw GenericAuthException(
//           message: e.toString() ?? "An error occurred during Google Sign In.");
//     } on FirebaseAuthException catch (e) {
//       await GoogleSignIn().signOut();

//       throw GenericAuthException(
//           message: e.toString() ?? "An error occurred during Google Sign In.");
//     }
//   }

//   @override
//   Future<void> signOut() async {
//     final user = FirebaseAuth.instance.currentUser;

//     if (user != null) {
//       await FirebaseAuth.instance.signOut();
//     } else {
//       throw UserNotLoggedInException();
//     }
//   }
// }
