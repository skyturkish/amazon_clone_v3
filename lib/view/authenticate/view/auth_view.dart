// ignore_for_file: avoid_print

import 'package:amazon_clone_v3/core/constants/color/color_constants.dart';
import 'package:amazon_clone_v3/core/init/translations/locale_keys.g.dart';
import 'package:amazon_clone_v3/product/enum/auth.dart';
import 'package:amazon_clone_v3/product/widget/button/custom_elevated_button.dart';
import 'package:amazon_clone_v3/product/widget/textfield/custom_textfield.dart';
import 'package:amazon_clone_v3/view/authenticate/service/auth_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AuthView extends StatefulWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  Auth _auth = Auth.signin;

  //KEYS
  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _signInFormKey = GlobalKey<FormState>();

  //TEXT EDITING CONTROLLERS
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final AuthService authService = AuthService();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text,
    );
  }

  void signInUser() {
    authService.signInUser(context: context, email: _emailController.text, password: _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: PaddingVariables.allDefault,
          child: Column(
            children: [
              Text(
                LocaleKeys.welcome.tr(),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              ListTile(
                tileColor: _auth == Auth.signup ? ColorVariables.backgroundColor : ColorVariables.greyBackgroundCOlor,
                title: Text(
                  LocaleKeys.createAccount.tr(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  activeColor: ColorVariables.secondaryColor,
                  value: Auth.signup,
                  groupValue: _auth,
                  onChanged: (Auth? value) {
                    setState(() {
                      _auth = value!; // we forced, ?????????????????????
                    });
                  },
                ),
              ),
              if (_auth == Auth.signup)
                Container(
                  padding: PaddingVariables.allDefault,
                  color: ColorVariables.backgroundColor,
                  child: Form(
                    key: _signUpFormKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: PaddingVariables.onlyBottomLow,
                          child: CustomTextField(
                            controller: _nameController,
                            hintText: LocaleKeys.name.tr(),
                          ),
                        ),
                        Padding(
                          padding: PaddingVariables.onlyBottomLow,
                          child: CustomTextField(
                            controller: _emailController,
                            hintText: LocaleKeys.email.tr(),
                          ),
                        ),
                        Padding(
                          padding: PaddingVariables.onlyBottomLow,
                          child: CustomTextField(
                            controller: _passwordController,
                            hintText: LocaleKeys.password.tr(),
                          ),
                        ),
                        CustomElevatedButton(
                          text: LocaleKeys.signUp.tr(),
                          onTap: () {
                            if (_signUpFormKey.currentState!.validate()) {
                              print("selam");
                              signUpUser();
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ListTile(
                tileColor: _auth != Auth.signup ? ColorVariables.backgroundColor : ColorVariables.greyBackgroundCOlor,
                title: Text(
                  LocaleKeys.signIn.tr(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  activeColor: ColorVariables.secondaryColor,
                  value: Auth.signin,
                  groupValue: _auth,
                  onChanged: (Auth? value) {
                    setState(() {
                      _auth = value!; // we forced, ?????????????????????
                    });
                  },
                ),
              ),
              if (_auth == Auth.signin)
                Container(
                  padding: PaddingVariables.allDefault,
                  color: ColorVariables.backgroundColor,
                  child: Form(
                    key: _signInFormKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: PaddingVariables.onlyBottomLow,
                          child: CustomTextField(
                            controller: _emailController,
                            hintText: LocaleKeys.email.tr(),
                          ),
                        ),
                        Padding(
                          padding: PaddingVariables.onlyBottomLow,
                          child: CustomTextField(
                            controller: _passwordController,
                            hintText: LocaleKeys.password.tr(),
                          ),
                        ),
                        CustomElevatedButton(
                          text: LocaleKeys.signIn.tr(),
                          onTap: () {
                            if (_signInFormKey.currentState!.validate()) {
                              print("selamlar signin'in içindeyim");
                              signInUser();
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaddingVariables {
  static EdgeInsets onlyBottomLow = const EdgeInsets.only(bottom: 10.0);
  static EdgeInsets allDefault = const EdgeInsets.all(8.0);
}
