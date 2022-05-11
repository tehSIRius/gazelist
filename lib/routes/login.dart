import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:gazelist/utils/auth.dart';
import 'package:gazelist/utils/validator.dart';

import 'package:gazelist/routes/homepage.dart';
import 'package:gazelist/routes/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailTextController = TextEditingController();
  final _passwordController = TextEditingController();

  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  bool _loading = false;

  void _checkLogin() {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  void _removeFocus() {
    _focusEmail.unfocus();
    _focusPassword.unfocus();
  }

  Future<void> _handleLogin() async {
    _removeFocus();

    if (_formKey.currentState!.validate()) {
      setState(() {
        _loading = true;
      });

      User? user = await FireAuth.loginUsingEmail(
          _emailTextController.text, _passwordController.text, context);

      setState(() {
        _loading = false;
      });

      if (user != null) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage()));
      }
    }
  }

  void _handleGoToRegisterPage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const RegisterPage()));
  }

  @override
  Widget build(BuildContext context) {
    _checkLogin();

    return GestureDetector(
      onTap: _removeFocus,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Text(
                  'Login',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _emailTextController,
                      focusNode: _focusEmail,
                      validator: (value) => Validator.validateEmail(value),
                      decoration: InputDecoration(
                          hintText: "Email",
                          errorBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              borderSide: const BorderSide(color: Colors.red))),
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      controller: _passwordController,
                      focusNode: _focusPassword,
                      obscureText: true,
                      validator: (value) => Validator.validatePassword(value),
                      decoration: InputDecoration(
                          hintText: 'Password',
                          errorBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              borderSide: const BorderSide(color: Colors.red))),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    _loading
                        ? const CircularProgressIndicator()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: _handleLogin,
                                  child: const Text(
                                    'Log In',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30.0),
                              Expanded(
                                  child: ElevatedButton(
                                onPressed: _handleGoToRegisterPage,
                                child: const Text('Register',
                                    style: TextStyle(color: Colors.white)),
                              ))
                            ],
                          )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
