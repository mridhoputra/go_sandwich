import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_sandwich/utils/colors.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = '/register';
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _username = '';
  String _fullName = '';
  String _email = '';
  String _password = '';
  bool secureTextEntry = true;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.blueAccent,
      ),
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
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
                        'assets/images/il_register.png',
                        height: MediaQuery.of(context).size.height * 0.4,
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
                          labelText: 'Fullname',
                          prefixIcon: const Icon(Icons.abc_rounded, color: Colors.black),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _fullName = value;
                          });
                        },
                      ),
                      const SizedBox(height: 20),
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
                          labelText: 'Email',
                          prefixIcon: const Icon(Icons.mail, color: Colors.black),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _email = value;
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
                          print(_username);
                          print(_email);
                          print(_password);
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
                          'Register',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
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
    );
  }
}
