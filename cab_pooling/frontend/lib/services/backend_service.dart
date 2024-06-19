import 'dart:math';

import 'package:google_sign_in/google_sign_in.dart';
import 'dart:developer' as devtools;
import 'package:http/http.dart' as http;
import 'package:CabX/data/BackendUser.dart';
import 'package:CabX/data/CabPoolRequest.dart';

class BackendService {

  static final BackendService _shared = BackendService._sharedInstance();
  BackendService._sharedInstance();
  factory BackendService() => _shared;

  Future<void> registerUser(GoogleSignInAccount user) async {
    // Register user with backend
    try {
      BackendUser backendUser = BackendUser.fromGoogleSignInAccount(user);
      final response = await http.post(Uri.parse('$backendUrl/register'),
          body: backendUser.toJson());
    } catch (error) {
      devtools.log(error.toString(), name: 'BackendService');
    }
  }

  int fetchNewPoolInfo() {
    // Fetch ride info from backend
    // generate a new random number for cost between 1000, 2000

    try {
      Random random = new Random();
      return random.nextInt(1000) + 1000;
    } catch (error) {
      devtools.log(error.toString(), name: 'BackendService');
    }
    return 0;
  }

  Future<int> joinPool(CabPoolRequest request) async {
    // Join pool with backend
    try {
      final response = await http.post(
          Uri.parse('$backendUrl/register_pool_ride'),
          body: request.toJsonForRegister());

      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody =
            response.body as Map<String, dynamic>;

        return responseBody['pool_id'];
      } else {
        throw Exception('Failed to join pool');
      }
    } catch (error) {
      devtools.log(error.toString(), name: 'BackendService');
    }

    return -1;
  }

  Future<void> showPoolInfo(int poolId) async {
    // Show pool info from backend
    try {
      final response =
          await http.get(Uri.parse('$backendUrl/pool_info/specific_pool'));

      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody =
            response.body as Map<String, dynamic>;

        print(responseBody);
      } else {
        throw Exception('Failed to show pool info');
      }
    } catch (error) {
      devtools.log(error.toString(), name: 'BackendService');
    }
  }
}
