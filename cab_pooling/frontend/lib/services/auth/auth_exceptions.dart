

class GenericAuthException implements Exception {
  final String message;
  GenericAuthException({this.message = 'An error occurred during authentication.'});
}

class UserNotLoggedInException implements Exception {}