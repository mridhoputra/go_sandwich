import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:go_sandwich/pages/home/home_page.dart';
import 'package:go_sandwich/pages/register/register_page.dart';
import 'package:go_sandwich/utils/colors.dart';
import 'package:go_sandwich/utils/show_alert.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _username = '';
  String _password = '';
  bool secureTextEntry = true;

  Future<bool> _onBackPressed() async {
    await showAlert(
      context: context,
      title: 'Alert',
      onPressed: () async {
        if (Platform.isAndroid) {
          SystemNavigator.pop();
        }
      },
      showCancelButton: true,
      content: 'Apakah anda yakin untuk keluar?',
    );
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.lightBlue,
      ),
      child: WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(color: ColorTheme.primary),
                    height: MediaQuery.of(context).size.height,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Spacer(),
                        Image.asset(
                          'assets/images/il_sandwich_mix.png',
                          height: MediaQuery.of(context).size.height * 0.42,
                        ),
                        const Spacer(),
                        TextField(
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: ColorTheme.secondary,
                            labelStyle: const TextStyle(height: 1, color: Colors.black),
                            contentPadding: const EdgeInsets.symmetric(vertical: 2),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                width: 2,
                                color: Color(0xffffbbda),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                width: 2,
                                color: ColorTheme.secondary,
                              ),
                            ),
                            labelText: 'Username',
                            prefixIcon: const Icon(Icons.person, color: Colors.black),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _username = value;
                            });
                          },
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          obscureText: secureTextEntry,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: ColorTheme.secondary,
                            labelStyle: const TextStyle(height: 1, color: Colors.black),
                            contentPadding: const EdgeInsets.symmetric(vertical: 2),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                width: 2,
                                color: Color(0xffffbbda),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                width: 2,
                                color: ColorTheme.secondary,
                              ),
                            ),
                            labelText: 'Password',
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.black,
                            ),
                            suffixIconConstraints: const BoxConstraints(maxHeight: 20),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  secureTextEntry = !secureTextEntry;
                                });
                              },
                              child: secureTextEntry
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16),
                                      child: Image.asset(
                                        'assets/images/icon_eye_disabled.png',
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16),
                                      child: Image.asset(
                                        'assets/images/icon_eye.png',
                                      ),
                                    ),
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _password = value;
                            });
                          },
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            context.goNamed(HomePage.routeName);
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 3,
                            backgroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Login',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'Belum punya akun? Silahkan ',
                            style: const TextStyle(
                              height: 1,
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                            children: [
                              TextSpan(
                                text: 'Register',
                                style: const TextStyle(
                                  height: 1,
                                  fontSize: 12,
                                  color: Color(0xFF4169E1),
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    context.pushNamed(RegisterPage.routeName);
                                  },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
