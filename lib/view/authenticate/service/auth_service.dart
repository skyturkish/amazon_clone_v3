import 'package:amazon_clone_v3/core/constants/app/app_constants.dart';
import 'package:amazon_clone_v3/core/constants/error_handling.dart';
import 'package:amazon_clone_v3/core/constants/utils.dart';
import 'package:amazon_clone_v3/view/authenticate/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService {
  //sign up user
  Future<void> signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      UserModel user = UserModel(
        id: ' ',
        name: name,
        email: email,
        password: password,
        address: ' ',
        type: ' ',
        token: ' ',
      );
      http.Response response = await http.post(
        Uri.parse('${ApplicationConstants.REAL_APP_IP_ADRESS}/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      print(response);
      httpErrorHandle(
        response: response,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            'Account created! Login with the same credentials!',
          );
        },
      );
    } catch (e) {
      print(e.toString());
      showSnackBar(context, e.toString());
    }
  }
}
