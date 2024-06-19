import 'package:google_sign_in/google_sign_in.dart';


class BackendUser {
  final String email;
  final String name;
  final String photoURL;
  final String phone;

  BackendUser({
    required this.email,
    required this.name,
    required this.photoURL,
    required this.phone,
  });

  BackendUser.fromGoogleSignInAccount(GoogleSignInAccount user)
      : email = user.email,
        name = user.displayName ?? "Unknown User",
        photoURL = user.photoUrl ?? '',
        phone = user.id;

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'photoURL': photoURL,
      'phone': phone,
    };
  }
  
  
  
}
