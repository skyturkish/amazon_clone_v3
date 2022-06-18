// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:amazon_clone_v3/core/constants/app/app_constants.dart';
import 'package:amazon_clone_v3/core/constants/error_handling.dart';
import 'package:amazon_clone_v3/core/constants/navigation/navigation_constants.dart';
import 'package:amazon_clone_v3/core/constants/utils.dart';
import 'package:amazon_clone_v3/providers/user_providers.dart';
import 'package:amazon_clone_v3/view/authenticate/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final String authTokenName = "x-auth-token";
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
          });
    } catch (e) {
      print(e.toString());
      showSnackBar(context, e.toString());
    }
  }

  // Sign in
  Future<void> signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response response = await http.post(
        Uri.parse('${ApplicationConstants.REAL_APP_IP_ADRESS}/api/signin'),
        body: jsonEncode({'email': email, 'password': password}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(response.body);
      httpErrorHandle(
          response: response,
          context: context,
          onSuccess: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            Provider.of<UserProvider>(context, listen: false).setUser(response.body);
            await prefs.setString(authTokenName, jsonDecode(response.body)['token']);
            Navigator.pushNamedAndRemoveUntil(
              context,
              NavigationConstants.HOME_VIEW,
              (route) => false,
            );
          });
    } catch (e) {
      print(e.toString());
      showSnackBar(context, e.toString());
    }
  }

  Future<void> getUserData(
    BuildContext context,
  ) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString(authTokenName);

      if (token == null) {
        prefs.setString(authTokenName, ' ');
      }

      var tokenRes = await http.post(
        Uri.parse('${ApplicationConstants.REAL_APP_IP_ADRESS}/tokenIsValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          authTokenName: token!,
        },
      );
      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        http.Response userRes = await http.get(
          Uri.parse('${ApplicationConstants.REAL_APP_IP_ADRESS}/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            authTokenName: token,
          },
        );
        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      print(e.toString());
      showSnackBar(context, e.toString());
    }
  }
}
