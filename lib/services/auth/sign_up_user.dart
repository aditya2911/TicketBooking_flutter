import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class SignUpUser {
  final String _baseSignUpPath = "http://localhost:8080/api/v1/auth/register";
  final Dio _dio = Dio();

  Future<String> signUpUser(
      String firstname, String email, String lastname, String password) async {
    try {
      Response resp = await _dio.post(_baseSignUpPath, data: {
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "password": password
      });

      if (resp.statusCode == 200) {
        String token = resp.data["token"];

        debugPrint("Succesfully Posted $token");
        return token;
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error Occured in Auth $e");
      }
    }

    return "Could not POST DATA in signUP user";
  }
}
