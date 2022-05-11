import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

import 'package:gazelist/utils/auth.dart';
import 'package:gazelist/utils/validator.dart';
import 'package:gazelist/dao/user_dao.dart';
import 'package:gazelist/model/user.dart' as _model;

import 'package:gazelist/routes/home.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _registerFormKey = GlobalKey<FormState>();

  final _nameContextController = TextEditingController();
  final _emailContextController = TextEditingController();
  final _passwordContextController = TextEditingController();

  final _focusName = FocusNode();
  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  final _uuid = const Uuid();

  bool _loading = false;

  void _removeFocus() {
    _focusName.unfocus();
    _focusEmail.unfocus();
    _focusPassword.unfocus();
  }

  Future<void> _handleRegister() async {
    setState(() {
      _loading = true;
    });

    if (_registerFormKey.currentState!.validate()) {
      User? user = await FireAuth.registerUsingEmail(
          _nameContextController.text,
          _emailContextController.text,
          _passwordContextController.text);

      setState(() {
        _loading = false;
      });

      if (user != null) {
        var userModel = _model.User(
            _uuid.v5(Uuid.NAMESPACE_URL, 'dvoracek.dev'),
            _emailContextController.text);
        var dao = UserDao();
        dao.saveUser(userModel);

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const HomePage()),
            ModalRoute.withName('/'));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _removeFocus,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Register'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: _registerFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameContextController,
                      focusNode: _focusName,
                      validator: (value) => Validator.validateName(value),
                      decoration: InputDecoration(
                          hintText: 'Display Name',
                          errorBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              borderSide: const BorderSide(color: Colors.red))),
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                        controller: _emailContextController,
                        focusNode: _focusEmail,
                        validator: (value) => Validator.validateEmail(value),
                        decoration: InputDecoration(
                          hintText: 'Email',
                          errorBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              borderSide: const BorderSide(color: Colors.red)),
                        )),
                    const SizedBox(height: 20.0),
                    TextFormField(
                        controller: _passwordContextController,
                        focusNode: _focusPassword,
                        obscureText: true,
                        validator: (value) => Validator.validatePassword(value),
                        decoration: InputDecoration(
                          hintText: 'Password',
                          errorBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              borderSide: const BorderSide(color: Colors.red)),
                        )),
                    const SizedBox(height: 30.0),
                    _loading
                        ? const CircularProgressIndicator()
                        : Row(
                            children: [
                              Expanded(
                                  child: ElevatedButton(
                                onPressed: _handleRegister,
                                child: const Text('Register',
                                    style: TextStyle(color: Colors.white)),
                              ))
                            ],
                          )
                  ],
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
